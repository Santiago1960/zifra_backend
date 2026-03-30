import 'dart:convert';
import 'dart:math';
import 'dart:io';
import 'package:serverpod/serverpod.dart';
import 'package:puppeteer/puppeteer.dart';
import 'sri_xml_parser.dart';
import 'generated/protocol.dart';

/// Función de log que emite a consola y al buffer de progreso.
typedef _LogFn = void Function(String msg, {String type, int? done, int? total});

class SriEndpoint extends Endpoint {
  static const _sriLoginUrl =
      'https://srienlinea.sri.gob.ec/auth/realms/Internet/protocol/openid-connect/auth'
      '?client_id=app-sri-claves-angular'
      '&redirect_uri=https%3A%2F%2Fsrienlinea.sri.gob.ec%2Fsri-en-linea%2F%2Fcontribuyente%2Fperfil'
      '&response_mode=fragment&response_type=code&scope=openid';

  static const _comprobantesUrl =
      'https://srienlinea.sri.gob.ec/tuportal-internet/accederAplicacion.jspa'
      '?redireccion=57&idGrupo=55';

  static const _capsolverUrl = 'https://api.capsolver.com';

  static const _userAgent =
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 '
      '(KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36';

  static const _meses = [
    '', 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
    'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'
  ];

  final _random = Random();
  final _parser = SriXmlParser();

  // ---------------------------------------------------------------------------
  // Progress buffer — keyed by projectId, drenado por getProgress()
  // ---------------------------------------------------------------------------

  /// Crea la función de log para una descarga: emite a stderr + archivo temporal (por los Isolate).
  _LogFn _makeLog(int projectId) =>
      (String msg, {String type = 'info', int? done, int? total}) {
        stderr.writeln('[${DateTime.now()}] SRI-BOT: $msg');
        
        final evt = {
          'msg': msg,
          'type': type,
          'ts': DateTime.now().millisecondsSinceEpoch,
          if (done != null) 'done': done,
          if (total != null) 'total': total,
        };
        try {
          final f = File('${Directory.systemTemp.path}/sri_progress_$projectId.txt');
          f.writeAsStringSync(jsonEncode(evt) + '\n', mode: FileMode.append);
        } catch (_) {}
      };

  /// Retorna los eventos acumulados desde la última llamada y los elimina.
  /// El cliente Flutter llama esto cada ~1.5s mientras la descarga está activa.
  /// Responde: JSON string → `[{"msg":"...","type":"info","ts":0}, ...]`
  Future<String> getProgress(Session session, int projectId) async {
    final path = '${Directory.systemTemp.path}/sri_progress_$projectId.txt';
    final f = File(path);
    if (!f.existsSync()) return '[]'; // Safe boundary sync check
    
    try {
      final lines = f.readAsLinesSync();
      // Renombrar/borrar el archivo lo antes posible para minimizar colisiones
      f.deleteSync(); 
      final evts = <Map<String, dynamic>>[];
      for (var line in lines) {
        if (line.trim().isEmpty) continue;
        try { evts.add(jsonDecode(line) as Map<String, dynamic>); } catch (_) {}
      }
      return jsonEncode(evts);
    } catch (_) {
      return '[]';
    }
  }

  /// Lee el archivo .env y retorna un mapa clave=valor.
  Map<String, String> _readEnvFile() {
    for (final path in ['.env', '../.env', '${Directory.current.path}/.env']) {
      final file = File(path);
      if (!file.existsSync()) continue;
      return Map.fromEntries(
        file.readAsLinesSync()
            .where((l) => l.contains('=') && !l.trimLeft().startsWith('#'))
            .map((l) {
              final idx = l.indexOf('=');
              return MapEntry(l.substring(0, idx).trim(), l.substring(idx + 1).trim());
            }),
      );
    }
    return {};
  }

  Future<void> _humanDelay({int minMs = 500, int maxMs = 2000}) =>
      Future.delayed(Duration(milliseconds: minMs + _random.nextInt(maxMs - minMs)));

  static const _stealthScript = r'''
    () => {
      Object.defineProperty(navigator, 'webdriver', { get: () => false });
      window.chrome = {
        app: { isInstalled: false, InstallState: { DISABLED: 'disabled', INSTALLED: 'installed', NOT_INSTALLED: 'not_installed' }, RunningState: { CANNOT_RUN: 'cannot_run', READY_TO_RUN: 'ready_to_run', RUNNING: 'running' } },
        runtime: { OnInstalledReason: { CHROME_UPDATE: 'chrome_update', INSTALL: 'install', SHARED_MODULE_UPDATE: 'shared_module_update', UPDATE: 'update' }, OnRestartRequiredReason: { APP_UPDATE: 'app_update', OS_UPDATE: 'os_update', PERIODIC: 'periodic' }, PlatformArch: { ARM: 'arm', ARM64: 'arm64', MIPS: 'mips', MIPS64: 'mips64', X86_32: 'x86-32', X86_64: 'x86-64' }, PlatformOs: { ANDROID: 'android', CROS: 'cros', LINUX: 'linux', MAC: 'mac', OPENBSD: 'openbsd', WIN: 'win' }, RequestUpdateCheckStatus: { NO_UPDATE: 'no_update', THROTTLED: 'throttled', UPDATE_AVAILABLE: 'update_available' } },
        loadTimes: function() { return { requestTime: Date.now() / 1000, startLoadTime: Date.now() / 1000, commitLoadTime: Date.now() / 1000, finishDocumentLoadTime: Date.now() / 1000, finishLoadTime: Date.now() / 1000, firstPaintTime: Date.now() / 1000, firstPaintAfterLoadTime: 0, navigationType: 'Other', wasFetchedViaSpdy: false, wasNpnNegotiated: false, npnNegotiatedProtocol: '', wasAlternateProtocolAvailable: false, connectionInfo: 'http/1.1' }; },
        csi: function() { return { startE: Date.now(), onloadT: Date.now(), pageT: 1, tran: 15 }; }
      };
      const pluginArray = [{ name: 'Chrome PDF Plugin', filename: 'internal-pdf-viewer', description: 'Portable Document Format', length: 1 }, { name: 'Chrome PDF Viewer', filename: 'mhjfbmdgcfjbbpaeojofohoefgiehjai', description: '', length: 1 }, { name: 'Native Client', filename: 'internal-nacl-plugin', description: '', length: 2 }];
      Object.defineProperty(navigator, 'plugins', { get: () => pluginArray });
      Object.defineProperty(navigator, 'mimeTypes', { get: () => [{ type: 'application/pdf', description: 'Portable Document Format', enabledPlugin: pluginArray[0] }] });
      const _DateTimeFormat = Intl.DateTimeFormat;
      Intl.DateTimeFormat = function(locale, options = {}) { options.timeZone = options.timeZone || 'America/Guayaquil'; return new _DateTimeFormat(locale || 'es-EC', options); };
      Intl.DateTimeFormat.prototype = _DateTimeFormat.prototype;
      Intl.DateTimeFormat.supportedLocalesOf = _DateTimeFormat.supportedLocalesOf;
      Object.defineProperty(navigator, 'languages', { get: () => ['es-EC', 'es', 'en-US', 'en'] });
      Object.defineProperty(navigator, 'language', { get: () => 'es-EC' });
      const _origPermQuery = navigator.permissions.query.bind(navigator.permissions);
      navigator.permissions.query = (p) => p.name === 'notifications' ? Promise.resolve({ state: Notification.permission, onchange: null }) : _origPermQuery(p);
      Object.defineProperty(navigator, 'hardwareConcurrency', { get: () => 8 });
      Object.defineProperty(navigator, 'deviceMemory', { get: () => 8 });
      delete window.__puppeteer_evaluation_script__;
      delete window.__puppeteer_execution_context_id__;
    }
  ''';

  // ---------------------------------------------------------------------------
  // Helpers de reCAPTCHA y formulario
  // ---------------------------------------------------------------------------

  Future<String?> _extraerSiteKey(Page page, _LogFn log) async {
    final key = await page.evaluate<String?>(r'''() => {
      for (const s of document.querySelectorAll('script[src]')) {
        const m = s.src.match(/[?&]render=([^&]+)/);
        if (m && m[1] !== 'explicit') return m[1];
      }
      const el = document.querySelector('[data-sitekey]');
      if (el) return el.getAttribute('data-sitekey');
      for (const s of document.querySelectorAll('script:not([src])')) {
        const m = s.textContent.match(/['\"](6[A-Za-z0-9_-]{38})['\"]/)
        if (m) return m[1];
      }
      return null;
    }''');
    log('Site key: ${key ?? "NO ENCONTRADO"}');
    return key;
  }

  Future<String?> _solveRecaptcha(String apiKey, String siteKey, String pageUrl, _LogFn log) async {
    log('Solicitando token...');
    final client = HttpClient();
    try {
      final createReq = await client.postUrl(Uri.parse('$_capsolverUrl/createTask'));
      createReq.headers.set('Content-Type', 'application/json');
      createReq.write(jsonEncode({
        'clientKey': apiKey,
        'task': { 'type': 'ReCaptchaV3EnterpriseTaskProxyLess', 'websiteURL': pageUrl, 'websiteKey': siteKey, 'pageAction': 'submit' },
      }));
      final createBody = jsonDecode(await (await createReq.close()).transform(utf8.decoder).join());
      if (createBody['errorId'] != 0) { log('Error: ${createBody['errorDescription']}', type: 'error'); return null; }

      final taskId = createBody['taskId'] as String;
      log('taskId=$taskId...');
      for (int i = 0; i < 24; i++) {
        await Future.delayed(const Duration(seconds: 5));
        final getReq = await client.postUrl(Uri.parse('$_capsolverUrl/getTaskResult'));
        getReq.headers.set('Content-Type', 'application/json');
        getReq.write(jsonEncode({'clientKey': apiKey, 'taskId': taskId}));
        final getBody = jsonDecode(await (await getReq.close()).transform(utf8.decoder).join());
        if (getBody['status'] == 'ready') {
          final token = getBody['solution']?['gRecaptchaResponse'] as String?;
          log('Token obtenido (${token?.length ?? 0}B).', type: 'success');
          return token;
        }
      }
      log('CS timeout.', type: 'error');
      return null;
    } catch (e) { log('CS error: $e', type: 'error'); return null; }
    finally { client.close(); }
  }

  Future<void> _inyectarToken(Page page, String token) => page.evaluate(r'''(token) => {
    const setField = (sel) => { const el = document.querySelector(sel); if (el) { el.value = token; return true; } return false; };
    if (!setField('[name="g-recaptcha-response"]')) {
      const ta = document.createElement('textarea');
      ta.name = 'g-recaptcha-response'; ta.style.display = 'none'; ta.value = token;
      document.getElementById('frmPrincipal')?.appendChild(ta);
    }
  }''', args: [token]);

  Future<void> _aplicarFiltros(Page page, int year, String mes) =>
      page.evaluate(r'''(year, mes) => {
        const setSelect = (id, label) => {
          const el = document.getElementById(id); if (!el) return;
          for (const opt of el.options) { if (opt.text.trim() === String(label)) { el.value = opt.value; el.dispatchEvent(new Event('change', { bubbles: true })); break; } }
        };
        setSelect('frmPrincipal:ano', year); setSelect('frmPrincipal:mes', mes); setSelect('frmPrincipal:dia', 'Todos');
      }''', args: [year, mes]);

  /// Aplica filtros, resuelve CAPTCHA y espera la tabla de resultados.
  Future<bool> _buscarComprobantes(Page page, String apiKey, int year, String mes, _LogFn log) async {
    await _aplicarFiltros(page, year, mes);
    await _humanDelay(minMs: 800, maxMs: 1500);

    final siteKey = await _extraerSiteKey(page, log);
    if (siteKey != null) {
      final token = await _solveRecaptcha(apiKey, siteKey, page.url ?? _comprobantesUrl, log);
      if (token != null) { await _inyectarToken(page, token); log('Token entregado.'); }
    }

    try {
      await page.waitForFunction(
        r'''() => { const btn = document.querySelector("#frmPrincipal\\:btnBuscar"); return btn && !btn.disabled && !btn.classList.contains("ui-state-disabled"); }''',
        timeout: const Duration(seconds: 15),
        polling: Polling.interval(const Duration(milliseconds: 500)),
      );
    } catch (_) { log('WARN: Botón sigue deshabilitado. Forzando click...', type: 'error'); }

    await page.evaluate(r'''() => { const btn = document.querySelector("#frmPrincipal\\:btnBuscar"); if (btn) btn.click(); }''');

    try {
      await page.waitForFunction(
        r'''() => { const t = document.getElementById("frmPrincipal:tablaCompRecibidos"); return t && t.querySelectorAll("tbody tr").length > 0; }''',
        timeout: const Duration(seconds: 40),
        polling: Polling.interval(const Duration(milliseconds: 1000)),
      );
      log('Tabla de comprobantes encontrada.', type: 'success');
      return true;
    } catch (_) {
      try { final b = await page.screenshot(); await File('/tmp/sri_debug_${DateTime.now().millisecondsSinceEpoch}.png').writeAsBytes(b); } catch (_) {}
      log('WARN: Tabla no apareció en 40s.', type: 'error');
      return false;
    }
  }

  // ---------------------------------------------------------------------------
  // Descarga de XMLs de la página actual
  // ---------------------------------------------------------------------------

  Future<List<String>> _descargarXmlsPaginaActual(Page page, _LogFn log) async {
    final allRowsData = await page.evaluate<List>(r'''() => {
      const tabla = document.getElementById("frmPrincipal:tablaCompRecibidos");
      if (!tabla) return [];
      return Array.from(tabla.querySelectorAll("tbody tr")).map((row, rowIdx) => {
        const tds = row.querySelectorAll("td");
        const clave = (tds[3]?.innerText ?? "").trim();
        const allElements = Array.from(row.querySelectorAll("a, button")).map(el => ({
          id: el.id, text: (el.innerText || "").trim().substring(0, 40),
          title: el.title || "", onclick: (el.getAttribute("onclick") || "").substring(0, 200),
          tdIndex: Array.from(tds).findIndex(td => td.contains(el))
        }));
        return { clave, elements: allElements };
      });
    }''');

    final dataRows = allRowsData
        .map((r) => r as Map)
        .where((r) => (r['clave'] as String? ?? '').length > 10)
        .toList();

    if (dataRows.isEmpty) return [];

    final pageState = await page.evaluate<Map>(r'''() => {
      const form = document.getElementById("frmPrincipal");
      if (!form) return { url: window.location.href, fields: {} };
      const fields = {};
      for (const [k, v] of new FormData(form).entries()) fields[k] = v;
      return { url: form.action || window.location.href, fields };
    }''');
    final formUrl = pageState['url'] as String;
    final baseFields = (pageState['fields'] as Map).cast<String, String>();
    final cookieHeader = (await page.cookies()).map((c) => '${c.name}=${c.value}').join('; ');

    final total = dataRows.length;
    final xmlContents = <String>[];
    for (int i = 0; i < total; i++) {
      final row = dataRows[i];
      final clave = row['clave'] as String;
      final elements = (row['elements'] as List).map((e) => e as Map).toList();

      final xmlBtn = elements.where((e) {
        final id = (e['id'] as String? ?? '').toLowerCase();
        final title = (e['title'] as String? ?? '').toLowerCase();
        return id.contains('lnkxml') || id.contains('xml') || title.contains('xml') || title.contains('descargar');
      }).lastOrNull ?? elements.where((e) {
        final onclick = e['onclick'] as String? ?? '';
        final tdIdx = (e['tdIndex'] as num?)?.toInt() ?? 0;
        return tdIdx >= 4 && !onclick.contains('dlgPanelDetalleFactura') && !onclick.contains('dlgDocumentos');
      }).lastOrNull;

      if (xmlBtn == null) {
        log('[${i + 1}/$total] ✗ Sin botón XML', type: 'error', done: i + 1, total: total);
        continue;
      }
      final btnId = xmlBtn['id'] as String? ?? '';

      try {
        final body = {...baseFields, btnId: btnId}.entries
            .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
            .join('&');
        final client = HttpClient();
        final req = await client.postUrl(Uri.parse(formUrl));
        req.headers.set('Content-Type', 'application/x-www-form-urlencoded');
        req.headers.set('Cookie', cookieHeader);
        req.headers.set('Referer', formUrl);
        req.headers.set('User-Agent', _userAgent);
        req.headers.set('Accept', 'text/html,application/xhtml+xml,application/xml,*/*');
        req.write(body);
        final resp = await req.close();
        final bytes = <int>[];
        await resp.forEach(bytes.addAll);
        client.close();

        final responseText = utf8.decode(bytes, allowMalformed: true);
        if (responseText.trimLeft().startsWith('<?xml') && !responseText.contains('<partial-response>') && bytes.length > 200) {
          xmlContents.add(responseText);
          log('[${i + 1}/$total] ✓ ${clave.substring(0, 10)}...', type: 'success', done: i + 1, total: total);
        } else {
          log('[${i + 1}/$total] ✗ No es XML valido', type: 'error', done: i + 1, total: total);
        }
      } catch (e) { log('[${i + 1}/$total] ✗ Error: $e', type: 'error', done: i + 1, total: total); }

      await _humanDelay(minMs: 300, maxMs: 700);
    }
    return xmlContents;
  }

  // ---------------------------------------------------------------------------
  // Guardado en BD con detección de duplicados
  // ---------------------------------------------------------------------------

  Future<({int guardadas, int duplicadas, int errores})> _guardarFacturas(
      Session session, List<Invoices> facturas, int projectId, _LogFn log) async {
    int guardadas = 0, duplicadas = 0, errores = 0;

    for (final factura in facturas) {
      final existing = await Invoices.db.findFirstRow(session,
          where: (t) => t.claveAcceso.equals(factura.claveAcceso));
      if (existing != null) { duplicadas++; continue; }

      try {
        await session.db.transaction((tx) async {
          final inserted = await Invoices.db.insertRow(
              session, factura.copyWith(projectId: projectId), transaction: tx);
          if (factura.detalles != null) {
            for (var d in factura.detalles!) { d.invoiceId = inserted.id!; }
            await InvoiceDetail.db.insert(session, factura.detalles!, transaction: tx);
          }
          if (factura.pagos != null) {
            for (var p in factura.pagos!) { p.invoiceId = inserted.id!; }
            await Pago.db.insert(session, factura.pagos!, transaction: tx);
          }
          if (factura.infoAdicional != null) {
            for (var a in factura.infoAdicional!) { a.invoiceId = inserted.id!; }
            await InvoiceInfoAdicional.db.insert(session, factura.infoAdicional!, transaction: tx);
          }
        });
        guardadas++;
      } catch (e) { log('Error guardando ${factura.claveAcceso}: $e', type: 'error'); errores++; }
    }
    return (guardadas: guardadas, duplicadas: duplicadas, errores: errores);
  }

  // ---------------------------------------------------------------------------
  // Endpoint público
  // ---------------------------------------------------------------------------

  /// Descarga los comprobantes del SRI para múltiples períodos y los guarda
  /// directamente en el proyecto indicado, marcados como [certificada]=true.
  /// El progreso puede consultarse en tiempo real vía [getProgress].
  Future<SriDownloadResult> downloadAndSave(
      Session session, String ruc, String password, int projectId, List<SriPeriod> periods) async {
    final log = _makeLog(projectId);
    log('=== INICIO $ruc projectId=$projectId períodos=${periods.length} ===');
    Browser? browser;
    final periodResults = <SriPeriodResult>[];

    try {
      final capsolverApiKey = Platform.environment['CAPSOLVER_API_KEY'] ??
          _readEnvFile()['CAPSOLVER_API_KEY'] ?? '';
      if (capsolverApiKey.isEmpty) {
        log('ERROR: CS_API_KEY no configurada.', type: 'error');
        return SriDownloadResult(periods: [], totalDescargadas: 0, totalDuplicadas: 0, totalErrores: 1);
      }

      const chromeMac         = '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome';
      const chromeLinux       = '/usr/bin/google-chrome';
      const chromiumLinux     = '/usr/bin/chromium';
      const chromiumBrowser   = '/usr/bin/chromium-browser';
      const chromiumSnap      = '/snap/bin/chromium';
      final execPath = File(chromeMac).existsSync()       ? chromeMac
          : File(chromeLinux).existsSync()                ? chromeLinux
          : File(chromiumLinux).existsSync()              ? chromiumLinux
          : File(chromiumBrowser).existsSync()            ? chromiumBrowser
          : File(chromiumSnap).existsSync()               ? chromiumSnap
          : null;
      log('Browser: ${execPath ?? "puppeteer-bundled"}');

      browser = await puppeteer.launch(
        headless: false,
        executablePath: execPath,
        ignoreDefaultArgs: ['--enable-automation'],
        args: [
          '--no-sandbox',
          '--disable-setuid-sandbox',
          '--disable-blink-features=AutomationControlled',
          '--disable-gpu',
          '--disable-dev-shm-usage',
          '--no-first-run',
          '--no-zygote',
          '--window-size=1280,900',
        ],
      );

      final page = await browser.newPage();
      await page.setUserAgent(_userAgent);
      await page.setViewport(DeviceViewport(width: 1280, height: 900));
      await page.evaluateOnNewDocument(_stealthScript);

      // --- LOGIN ---
      log('Autenticando en SRI...');
      await page.goto(_sriLoginUrl, wait: Until.domContentLoaded, timeout: const Duration(seconds: 60));
      await page.waitForSelector('#usuario', timeout: const Duration(seconds: 20));
      await page.type('#usuario', ruc, delay: Duration(milliseconds: 50 + _random.nextInt(100)));
      await _humanDelay(minMs: 200, maxMs: 600);
      await page.type('#password', password, delay: Duration(milliseconds: 50 + _random.nextInt(100)));
      await _humanDelay(minMs: 500, maxMs: 1000);
      await page.click('#kc-login');
      await page.waitForNavigation(wait: Until.domContentLoaded, timeout: const Duration(seconds: 60));

      if (!page.url!.contains('sri-en-linea')) {
        log('ERROR: Login fallido. URL: ${page.url}', type: 'error');
        return SriDownloadResult(periods: [], totalDescargadas: 0, totalDuplicadas: 0, totalErrores: 1);
      }
      log('Login exitoso.', type: 'success');

      // --- ITERAR POR PERÍODO ---
      for (final period in periods) {
        final periodoStr = '${period.year}-${period.month.toString().padLeft(2, "0")}';
        log('--- Período $periodoStr ---');
        int descargadas = 0, duplicadas = 0, errores = 0;

        await page.goto(_comprobantesUrl, wait: Until.domContentLoaded, timeout: const Duration(seconds: 60));
        await page.waitForSelector('#frmPrincipal\\:btnBuscar', timeout: const Duration(seconds: 20));
        await _humanDelay(minMs: 1000, maxMs: 2000);

        final busquedaOk = await _buscarComprobantes(page, capsolverApiKey, period.year, _meses[period.month], log);
        if (!busquedaOk) {
          log('Período $periodoStr: búsqueda fallida.', type: 'error');
          periodResults.add(SriPeriodResult(year: period.year, month: period.month, descargadas: 0, duplicadas: 0, errores: 1));
          continue;
        }

        int pagina = 1;
        while (true) {
          log('Página $pagina — período $periodoStr...');
          final xmlContents = await _descargarXmlsPaginaActual(page, log);
          final facturas = _parser.parseAll(xmlContents);

          final resultado = await _guardarFacturas(session, facturas, projectId, log);
          descargadas += resultado.guardadas;
          duplicadas  += resultado.duplicadas;
          errores     += resultado.errores;

          final hayMas = await page.evaluate<bool>(r'''() =>
            document.querySelector('.ui-paginator-next:not(.ui-state-disabled)') != null''');
          if (!hayMas) break;

          await page.click('.ui-paginator-next');
          await _humanDelay(minMs: 3000, maxMs: 5000);
          pagina++;
        }

        log('Período $periodoStr: ✓$descargadas dup=$duplicadas err=$errores', type: 'success');
        periodResults.add(SriPeriodResult(
          year: period.year, month: period.month,
          descargadas: descargadas, duplicadas: duplicadas, errores: errores));
      }

      final result = SriDownloadResult(
        periods: periodResults,
        totalDescargadas: periodResults.fold(0, (s, p) => s + p.descargadas),
        totalDuplicadas:  periodResults.fold(0, (s, p) => s + p.duplicadas),
        totalErrores:     periodResults.fold(0, (s, p) => s + p.errores),
      );
      log('=== FIN: ${result.totalDescargadas} guardadas, ${result.totalDuplicadas} duplicadas ===', type: 'done');
      return result;
    } catch (e, st) {
      log('Error crítico: $e\n$st', type: 'error');
      return SriDownloadResult(periods: periodResults, totalDescargadas: 0, totalDuplicadas: 0, totalErrores: 1);
    } finally {
      await browser?.close();
      try {
        final f = File('${Directory.systemTemp.path}/sri_progress_$projectId.txt');
        if (f.existsSync()) f.deleteSync(); // limpieza del buffer al completar
      } catch (_) {}
    }
  }
}