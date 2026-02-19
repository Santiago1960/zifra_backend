import 'dart:io';
import 'package:serverpod/serverpod.dart';
import 'package:puppeteer/puppeteer.dart';

class SriEndpoint extends Endpoint {
  static const _sriLoginUrl =
      'https://srienlinea.sri.gob.ec/auth/realms/Internet/protocol/openid-connect/auth'
      '?client_id=app-sri-claves-angular'
      '&redirect_uri=https%3A%2F%2Fsrienlinea.sri.gob.ec%2Fsri-en-linea%2F%2Fcontribuyente%2Fperfil'
      '&response_mode=fragment&response_type=code&scope=openid';

  static const _comprobantesUrl =
      'https://srienlinea.sri.gob.ec/tuportal-internet/accederAplicacion.jspa'
      '?redireccion=57&idGrupo=55';

  void _log(String msg) => stderr.writeln('[${DateTime.now()}] SRI: $msg');

  Future<bool> requestSridownload(Session session, String ruc, String password, int year, int month) async {
    _log('=== INICIO ===');

    Browser? browser;
    try {
      final outputDir = Directory('/tmp/sri_xmls/${ruc}_${year}_${month.toString().padLeft(2, '0')}');
      if (!outputDir.existsSync()) outputDir.createSync(recursive: true);

      // Usar Chromium del sistema si existe (producción Docker), sino el default (dev local)
      final systemChromium = File('/usr/bin/chromium');
      browser = await puppeteer.launch(
        headless: false, // Requiere display (Xvfb en producción)
        executablePath: systemChromium.existsSync() ? systemChromium.path : null,
        args: [
          '--no-sandbox',
          '--disable-setuid-sandbox',
          '--disable-blink-features=AutomationControlled',
          '--disable-dev-shm-usage', // Evitar problemas de memoria en Docker
          '--window-size=1280,900',
        ],
      );
      final page = await browser.newPage();
      await page.setViewport(DeviceViewport(width: 1280, height: 900));
      await page.evaluateOnNewDocument(
        r'''() => Object.defineProperty(navigator, 'webdriver', { get: () => false })''',
      );

      // Configurar descargas automáticas al directorio
      // ignore: deprecated_member_use
      await page.devTools.page.setDownloadBehavior('allow', downloadPath: outputDir.path);

      // --- Login ---
      _log('Login...');
      await page.goto(_sriLoginUrl, wait: Until.load, timeout: Duration(seconds: 60));
      await page.waitForSelector('#usuario', timeout: Duration(seconds: 30));
      await page.type('#usuario', ruc, delay: Duration(milliseconds: 80));
      await Future.delayed(Duration(milliseconds: 300));
      await page.type('#password', password, delay: Duration(milliseconds: 80));
      await Future.delayed(Duration(milliseconds: 500));
      await page.click('#kc-login');
      await page.waitForNavigation(wait: Until.load, timeout: Duration(seconds: 60));

      if (!page.url!.contains('contribuyente/perfil') && !page.url!.contains('sri-en-linea')) {
        _log('ERROR Login fallido');
        return false;
      }
      _log('Login exitoso');

      // --- Comprobantes ---
      _log('Navegando a comprobantes...');
      await page.goto(_comprobantesUrl, wait: Until.load, timeout: Duration(seconds: 60));
      await page.waitForSelector('#frmPrincipal\\:btnBuscar', timeout: Duration(seconds: 45));
      await Future.delayed(Duration(seconds: 2));

      // --- Período ---
      final meses = ['', 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
                     'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];

      await page.evaluate(r'''(year, mes) => {
        const selAno = document.getElementById('frmPrincipal:ano');
        for (const opt of selAno.options) {
          if (opt.text.trim() === String(year)) { selAno.value = opt.value; selAno.dispatchEvent(new Event('change', { bubbles: true })); break; }
        }
        const selMes = document.getElementById('frmPrincipal:mes');
        for (const opt of selMes.options) {
          if (opt.text.trim() === mes) { selMes.value = opt.value; selMes.dispatchEvent(new Event('change', { bubbles: true })); break; }
        }
        const selDia = document.getElementById('frmPrincipal:dia');
        for (const opt of selDia.options) {
          if (opt.text.trim() === 'Todos') { selDia.value = opt.value; selDia.dispatchEvent(new Event('change', { bubbles: true })); break; }
        }
      }''', args: [year, meses[month]]);
      _log('Período: ${meses[month]} $year');
      await Future.delayed(Duration(seconds: 1));

      // --- Consultar ---
      await page.evaluate(r'''() => executeRecaptcha('consulta_cel_recibidos')''');
      _log('Consulta ejecutada, esperando resultados...');
      await Future.delayed(Duration(seconds: 12));

      // --- Inspeccionar botones de descarga de la primera fila ---
      final downloadInfo = await page.evaluate<String>(r'''() => {
        const tables = document.querySelectorAll('table');
        for (const t of tables) {
          const rows = t.querySelectorAll('tbody tr');
          if (rows.length > 3 && rows[0]?.querySelectorAll('td').length >= 5) {
            const tds = rows[0].querySelectorAll('td');
            let info = `Tabla: ${rows.length} filas, ${tds.length} cols\n`;
            // Inspeccionar todas las columnas que tengan links/botones
            for (let i = 0; i < tds.length; i++) {
              const links = tds[i].querySelectorAll('a, button');
              if (links.length > 0) {
                info += `Col[${i}]: `;
                links.forEach(el => {
                  info += `<${el.tagName} onclick="${(el.getAttribute('onclick')||'').substring(0,80)}" href="${(el.href||'').substring(0,80)}" title="${el.title}" id="${el.id}" class="${el.className.substring(0,40)}"> `;
                });
                info += '\n';
              }
            }
            return info;
          }
        }
        return 'No tabla';
      }''');
      _log('Botones de descarga:\n$downloadInfo');

      // --- Obtener total de filas y descargar cada XML ---
      final totalRows = await page.evaluate<int>(r'''() => {
        const tables = document.querySelectorAll('table');
        for (const t of tables) {
          const rows = t.querySelectorAll('tbody tr');
          if (rows.length > 3 && rows[0]?.querySelectorAll('td').length >= 5) return rows.length;
        }
        return 0;
      }''');
      _log('Descargando $totalRows comprobantes...');
      final descargaPath = '${outputDir.path}/Factura.xml';

      for (int i = 0; i < totalRows; i++) {
        // Extraer clave de acceso de la fila actual (columna 3)
        final claveAcceso = await page.evaluate<String>(r'''(rowIndex) => {
          const tables = document.querySelectorAll('table');
          for (const t of tables) {
            const rows = t.querySelectorAll('tbody tr');
            if (rows.length > 3 && rows[0]?.querySelectorAll('td').length >= 5) {
              const tds = rows[rowIndex]?.querySelectorAll('td');
              return tds?.[3]?.innerText?.trim() || `fila_${rowIndex}`;
            }
          }
          return `fila_${rowIndex}`;
        }''', args: [i]);

        // Eliminar archivo previo para detectar nueva descarga
        final prevFile = File(descargaPath);
        if (prevFile.existsSync()) prevFile.deleteSync();

        // Click en descarga
        final clicked = await page.evaluate<bool>(r'''(rowIndex) => {
          const tables = document.querySelectorAll('table');
          for (const t of tables) {
            const rows = t.querySelectorAll('tbody tr');
            if (rows.length > 3 && rows[0]?.querySelectorAll('td').length >= 5) {
              const row = rows[rowIndex];
              if (!row) return false;
              const clickables = row.querySelectorAll('a, button');
              for (const el of clickables) {
                const text = (el.innerText || el.title || el.getAttribute('onclick') || el.href || '').toLowerCase();
                if (text.includes('xml') || text.includes('descarg') || text.includes('download')) {
                  el.click();
                  return true;
                }
              }
              return false;
            }
          }
          return false;
        }''', args: [i]);

        if (!clicked) {
          _log('[${i + 1}/$totalRows] Sin link de descarga');
          continue;
        }

        // Esperar a que Factura.xml aparezca (max 5s)
        for (int wait = 0; wait < 10; wait++) {
          await Future.delayed(Duration(milliseconds: 500));
          if (File(descargaPath).existsSync()) break;
        }

        // Renombrar inmediatamente
        final downloaded = File(descargaPath);
        if (downloaded.existsSync()) {
          final destino = '${outputDir.path}/$claveAcceso.xml';
          downloaded.renameSync(destino);
          _log('[${i + 1}/$totalRows] ✓ $claveAcceso.xml');
        } else {
          _log('[${i + 1}/$totalRows] ✗ No se descargó para $claveAcceso');
        }
      }

      final archivos = outputDir.listSync().where((f) => f.path.endsWith('.xml')).length;
      _log('Total: $archivos XMLs en ${outputDir.path}');

      session.log('SRI: $archivos XMLs descargados en ${outputDir.path}');
      return archivos > 0;
    } catch (e) {
      _log('ERROR: $e');
      session.log('SRI: Error: $e', level: LogLevel.error);
      return false;
    } finally {
      await browser?.close();
      _log('=== FIN ===');
    }
  }
}