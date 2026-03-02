import 'dart:convert';
import 'dart:math';
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

  static const _capsolverUrl = 'https://api.capsolver.com';

  static const _userAgent =
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 '
      '(KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36';

  final _random = Random();

  void _log(String msg) => stderr.writeln('[${DateTime.now()}] SRI-BOT: $msg');

  /// Lee el archivo .env del proyecto y retorna un mapa de clave=valor.
  /// Busca el .env en el directorio actual y en el directorio padre (estructura Serverpod).
  Map<String, String> _readEnvFile() {
    final candidates = [
      '.env',
      '../.env',
      '${Directory.current.path}/.env',
    ];
    for (final path in candidates) {
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

  /// Parche de stealth completo aplicado antes de que cargue cualquier script.
  static const _stealthScript = r'''
    () => {
      Object.defineProperty(navigator, 'webdriver', { get: () => false });

      window.chrome = {
        app: {
          isInstalled: false,
          InstallState: { DISABLED: 'disabled', INSTALLED: 'installed', NOT_INSTALLED: 'not_installed' },
          RunningState: { CANNOT_RUN: 'cannot_run', READY_TO_RUN: 'ready_to_run', RUNNING: 'running' }
        },
        runtime: {
          OnInstalledReason: { CHROME_UPDATE: 'chrome_update', INSTALL: 'install', SHARED_MODULE_UPDATE: 'shared_module_update', UPDATE: 'update' },
          OnRestartRequiredReason: { APP_UPDATE: 'app_update', OS_UPDATE: 'os_update', PERIODIC: 'periodic' },
          PlatformArch: { ARM: 'arm', ARM64: 'arm64', MIPS: 'mips', MIPS64: 'mips64', X86_32: 'x86-32', X86_64: 'x86-64' },
          PlatformOs: { ANDROID: 'android', CROS: 'cros', LINUX: 'linux', MAC: 'mac', OPENBSD: 'openbsd', WIN: 'win' },
          RequestUpdateCheckStatus: { NO_UPDATE: 'no_update', THROTTLED: 'throttled', UPDATE_AVAILABLE: 'update_available' }
        },
        loadTimes: function() {
          return { requestTime: Date.now() / 1000, startLoadTime: Date.now() / 1000,
            commitLoadTime: Date.now() / 1000, finishDocumentLoadTime: Date.now() / 1000,
            finishLoadTime: Date.now() / 1000, firstPaintTime: Date.now() / 1000,
            firstPaintAfterLoadTime: 0, navigationType: 'Other', wasFetchedViaSpdy: false,
            wasNpnNegotiated: false, npnNegotiatedProtocol: '', wasAlternateProtocolAvailable: false,
            connectionInfo: 'http/1.1' };
        },
        csi: function() {
          return { startE: Date.now(), onloadT: Date.now(), pageT: 1, tran: 15 };
        }
      };

      const pluginArray = [
        { name: 'Chrome PDF Plugin',      filename: 'internal-pdf-viewer',           description: 'Portable Document Format', length: 1 },
        { name: 'Chrome PDF Viewer',      filename: 'mhjfbmdgcfjbbpaeojofohoefgiehjai', description: '',                   length: 1 },
        { name: 'Native Client',          filename: 'internal-nacl-plugin',           description: '',                   length: 2 }
      ];
      Object.defineProperty(navigator, 'plugins', { get: () => pluginArray });
      Object.defineProperty(navigator, 'mimeTypes', {
        get: () => [{ type: 'application/pdf', description: 'Portable Document Format', enabledPlugin: pluginArray[0] }]
      });

      const _DateTimeFormat = Intl.DateTimeFormat;
      Intl.DateTimeFormat = function(locale, options = {}) {
        options.timeZone = options.timeZone || 'America/Guayaquil';
        return new _DateTimeFormat(locale || 'es-EC', options);
      };
      Intl.DateTimeFormat.prototype = _DateTimeFormat.prototype;
      Intl.DateTimeFormat.supportedLocalesOf = _DateTimeFormat.supportedLocalesOf;

      Object.defineProperty(navigator, 'languages', { get: () => ['es-EC', 'es', 'en-US', 'en'] });
      Object.defineProperty(navigator, 'language',  { get: () => 'es-EC' });

      const _origPermQuery = navigator.permissions.query.bind(navigator.permissions);
      navigator.permissions.query = (p) =>
        p.name === 'notifications'
          ? Promise.resolve({ state: Notification.permission, onchange: null })
          : _origPermQuery(p);

      Object.defineProperty(navigator, 'hardwareConcurrency', { get: () => 8 });
      Object.defineProperty(navigator, 'deviceMemory',        { get: () => 8 });

      delete window.__puppeteer_evaluation_script__;
      delete window.__puppeteer_execution_context_id__;
    }
  ''';

  /// Aplica los filtros de año/mes en la página de comprobantes.
  Future<void> _aplicarFiltros(Page page, int year, String mes) =>
      page.evaluate(r'''(year, mes) => {
        const setSelect = (id, label) => {
          const el = document.getElementById(id);
          if (!el) return;
          for (const opt of el.options) {
            if (opt.text.trim() === String(label)) {
              el.value = opt.value;
              el.dispatchEvent(new Event('change', { bubbles: true }));
              break;
            }
          }
        };
        setSelect('frmPrincipal:ano', year);
        setSelect('frmPrincipal:mes', mes);
        setSelect('frmPrincipal:dia', 'Todos');
      }''', args: [year, mes]);

  /// Extrae el site key de reCAPTCHA Enterprise de los scripts de la página.
  /// Busca en: src de script tags, atributos data-sitekey, y llamadas grecaptcha.
  Future<String?> _extraerSiteKey(Page page) async {
    final key = await page.evaluate<String?>(r'''() => {
      // 1. Buscar en src de scripts: enterprise.js?render=KEY o recaptcha/api.js?render=KEY
      for (const s of document.querySelectorAll('script[src]')) {
        const m = s.src.match(/[?&]render=([^&]+)/);
        if (m && m[1] !== 'explicit') return m[1];
      }
      // 2. Buscar atributo data-sitekey
      const el = document.querySelector('[data-sitekey]');
      if (el) return el.getAttribute('data-sitekey');
      // 3. Buscar en código inline de scripts
      for (const s of document.querySelectorAll('script:not([src])')) {
        const m = s.textContent.match(/['"](6[A-Za-z0-9_-]{38})['"]/);
        if (m) return m[1];
      }
      return null;
    }''');
    _log('Site key encontrado: ${key ?? "NO ENCONTRADO"}');
    return key;
  }

  /// Llama a CapSolver para resolver el reCAPTCHA Enterprise v3 y retorna el token.
  ///
  /// Usa `ReCaptchaV3EnterpriseTaskProxyLess` (sin proxy propio, CapSolver usa los suyos).
  /// Timeout máximo: 120 segundos con polling cada 5 segundos.
  Future<String?> _solveRecaptcha(
      String apiKey, String siteKey, String pageUrl, String action) async {
    _log('Solicitando token a CapSolver (siteKey=${siteKey.substring(0, 10)}... action=$action)...');

    final client = HttpClient();
    try {
      // 1. Crear tarea
      final createReq = await client.postUrl(Uri.parse('$_capsolverUrl/createTask'));
      createReq.headers.set('Content-Type', 'application/json');
      createReq.write(jsonEncode({
        'clientKey': apiKey,
        'task': {
          'type': 'ReCaptchaV3EnterpriseTaskProxyLess',
          'websiteURL': pageUrl,
          'websiteKey': siteKey,
          'pageAction': action,
        },
      }));
      final createResp = await createReq.close();
      final createBody = jsonDecode(await createResp.transform(utf8.decoder).join());

      if (createBody['errorId'] != 0) {
        _log('CapSolver createTask error: ${createBody['errorDescription']}');
        return null;
      }
      final taskId = createBody['taskId'] as String;
      _log('CapSolver taskId=$taskId — esperando solución...');

      // 2. Polling hasta obtener resultado
      for (int i = 0; i < 24; i++) {
        await Future.delayed(const Duration(seconds: 5));

        final getReq = await client.postUrl(Uri.parse('$_capsolverUrl/getTaskResult'));
        getReq.headers.set('Content-Type', 'application/json');
        getReq.write(jsonEncode({'clientKey': apiKey, 'taskId': taskId}));
        final getResp = await getReq.close();
        final getBody = jsonDecode(await getResp.transform(utf8.decoder).join());

        if (getBody['status'] == 'ready') {
          final token = getBody['solution']?['gRecaptchaResponse'] as String?;
          _log('CapSolver token obtenido (${token?.length ?? 0}B).');
          return token;
        }
        _log('CapSolver status=${getBody['status']} (${(i + 1) * 5}s)...');
      }
      _log('CapSolver timeout (120s).');
      return null;
    } catch (e) {
      _log('CapSolver error: $e');
      return null;
    } finally {
      client.close();
    }
  }

  /// Inyecta el token de reCAPTCHA en el campo oculto del formulario JSF.
  Future<void> _inyectarToken(Page page, String token) =>
      page.evaluate(r'''(token) => {
        // El campo puede llamarse g-recaptcha-response o estar en un textarea oculto
        const setField = (sel) => {
          const el = document.querySelector(sel);
          if (el) { el.value = token; return true; }
          return false;
        };
        if (!setField('[name="g-recaptcha-response"]')) {
          // Crear el campo si no existe (algunos JSF lo crean dinámicamente)
          const ta = document.createElement('textarea');
          ta.name = 'g-recaptcha-response';
          ta.style.display = 'none';
          ta.value = token;
          document.getElementById('frmPrincipal')?.appendChild(ta);
        }
        // También intentar con la API de grecaptcha si está disponible
        if (window.grecaptcha?.enterprise) {
          try { window.___capsolver_token = token; } catch(_) {}
        }
      }''', args: [token]);

  /// Aplica filtros, resuelve el CAPTCHA con CapSolver y ejecuta la búsqueda.
  Future<bool> _buscarComprobantes(
      Page page, String apiKey, int year, String mes) async {
    await _aplicarFiltros(page, year, mes);
    await _humanDelay(minMs: 800, maxMs: 1500);

    // Extraer site key de la página actual
    final pageUrl = page.url ?? _comprobantesUrl;
    final siteKey = await _extraerSiteKey(page);

    if (siteKey == null) {
      _log('WARN: No se encontró site key. Intentando DOM click directo...');
    } else {
      // Resolver CAPTCHA via CapSolver e inyectar token
      final action = 'submit'; // acción típica del SRI
      final token = await _solveRecaptcha(apiKey, siteKey, pageUrl, action);
      if (token != null) {
        await _inyectarToken(page, token);
        _log('Token inyectado correctamente.');
      } else {
        _log('WARN: CapSolver no retornó token. Intentando de todas formas...');
      }
    }

    // Esperar que el botón esté habilitado (debería estarlo con el token inyectado)
    try {
      await page.waitForFunction(
        r'''() => {
          const btn = document.querySelector("#frmPrincipal\\:btnBuscar");
          return btn && !btn.disabled && !btn.classList.contains("ui-state-disabled");
        }''',
        timeout: const Duration(seconds: 15),
        polling: Polling.interval(const Duration(milliseconds: 500)),
      );
      _log('Botón habilitado.');
    } catch (_) {
      _log('WARN: Botón sigue deshabilitado. Forzando click de todas formas...');
    }

    _log('Ejecutando búsqueda (DOM click)...');
    await page.evaluate(r'''() => {
      const btn = document.querySelector("#frmPrincipal\\:btnBuscar");
      if (btn) btn.click();
    }''');

    try {
      await page.waitForFunction(
        r'''() => {
          const tabla = document.getElementById("frmPrincipal:tablaCompRecibidos");
          if (!tabla) return false;
          return tabla.querySelectorAll("tbody tr").length > 0;
        }''',
        timeout: const Duration(seconds: 40),
        polling: Polling.interval(const Duration(milliseconds: 1000)),
      );
      _log('Tabla de resultados encontrada.');
      return true;
    } catch (_) {
      _log('WARN: Tabla no apareció en 40s.');
      try {
        final bytes = await page.screenshot();
        final path = '/tmp/sri_debug_${DateTime.now().millisecondsSinceEpoch}.png';
        await File(path).writeAsBytes(bytes);
        _log('Screenshot: $path');
      } catch (_) {}
      final texto = await page.evaluate<String>(
          r'''() => (document.body?.innerText ?? '').substring(0, 2000)''');
      _log('Contenido:\n$texto');
      return false;
    }
  }

  /// Descarga todos los XMLs visibles en la página actual.
  ///
  /// Recolecta toda la info de la tabla en un único evaluate antes de clickear
  /// para evitar que el AJAX del primer click invalide referencias DOM siguientes.
  Future<int> _descargarPaginaActual(Page page, Directory outputDir) async {
    final allRowsData = await page.evaluate<List>(r'''() => {
      const tabla = document.getElementById("frmPrincipal:tablaCompRecibidos");
      if (!tabla) return [];
      const rows = Array.from(tabla.querySelectorAll("tbody tr"));
      return rows.map((row, rowIdx) => {
        const tds = row.querySelectorAll("td");
        const clave = (tds[3]?.innerText ?? "").trim();
        const allElements = Array.from(row.querySelectorAll("a, button")).map(el => ({
          id: el.id,
          text: (el.innerText || "").trim().substring(0, 40),
          title: el.title || "",
          onclick: (el.getAttribute("onclick") || "").substring(0, 200),
          tdIndex: Array.from(tds).findIndex(td => td.contains(el))
        }));
        return { clave, elements: allElements, fullHtml: rowIdx === 0 ? row.innerHTML : "" };
      });
    }''');

    if (allRowsData.isEmpty) {
      _log('Sin filas en la tabla.');
      return 0;
    }

    final dataRows = allRowsData
        .map((r) => r as Map)
        .where((r) => (r['clave'] as String? ?? '').length > 10)
        .toList();
    _log('Filas a descargar: ${dataRows.length}');

    if (dataRows.isEmpty) {
      _log('Sin comprobantes para el periodo consultado.');
      // Log del HTML del primer row para diagnóstico
      final firstHtml = (allRowsData.first as Map)['fullHtml'] as String? ?? '';
      if (firstHtml.isNotEmpty) _log('Row[0] HTML:\n$firstHtml');
      return 0;
    }

    // Capturar cookies + form state para hacer POSTs directos desde Dart
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
    _log('Form URL: $formUrl  |  campos: ${baseFields.length}  |  cookies: ${(await page.cookies()).length}');

    int descargados = 0;
    for (int i = 0; i < dataRows.length; i++) {
      final row = dataRows[i];
      final clave = row['clave'] as String? ?? '';
      final elements = (row['elements'] as List?) ?? [];

      // Estrategia 1: ID o title que contenga "xml" / "descargar"
      Map? xmlBtn = elements
          .map((e) => e as Map)
          .where((e) {
            final id = (e['id'] as String? ?? '').toLowerCase();
            final title = (e['title'] as String? ?? '').toLowerCase();
            return id.contains('lnkxml') || id.contains('xml') ||
                title.contains('xml') || title.contains('descargar');
          })
          .lastOrNull;

      // Estrategia 2 (fallback): último elemento en td[4+] que no sea modal de detalle
      xmlBtn ??= elements
          .map((e) => e as Map)
          .where((e) {
            final onclick = e['onclick'] as String? ?? '';
            final tdIdx = (e['tdIndex'] as num?)?.toInt() ?? 0;
            return tdIdx >= 4 &&
                !onclick.contains('dlgPanelDetalleFactura') &&
                !onclick.contains('dlgDocumentos');
          })
          .lastOrNull;

      if (xmlBtn == null) {
        _log('[${i + 1}/${dataRows.length}] ✗ Sin botón XML. Elements: $elements');
        continue;
      }
      final btnId = xmlBtn['id'] as String? ?? '';
      _log('[${i + 1}/${dataRows.length}] POST $btnId (${clave.substring(0, clave.length.clamp(0, 20))}...)');

      // POST directo con application/x-www-form-urlencoded (igual que haría JSF)
      try {
        final fields = {...baseFields, btnId: btnId};
        final body = fields.entries
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
        _log('[${i + 1}/${dataRows.length}] HTTP ${resp.statusCode} ct=${resp.headers.value("content-type")} size=${bytes.length}B');

        if (responseText.trimLeft().startsWith('<?xml') &&
            !responseText.contains('<partial-response>') &&
            bytes.length > 200) {
          await File('${outputDir.path}/$clave.xml').writeAsBytes(bytes);
          _log('[${i + 1}/${dataRows.length}] ✓ $clave');
          descargados++;
        } else {
          _log('[${i + 1}/${dataRows.length}] ✗ No es XML: ${responseText.substring(0, responseText.length.clamp(0, 300))}');
        }
      } catch (e) {
        _log('[${i + 1}/${dataRows.length}] ✗ Error HTTP: $e');
      }

      await _humanDelay(minMs: 300, maxMs: 700);
    }

    return descargados;
  }

  Future<bool> requestSridownload(
      Session session, String ruc, String password, int year, int month) async {
    _log('=== INICIO $ruc $year-${month.toString().padLeft(2, '0')} ===');
    Browser? browser;

    try {
      final outputDir = Directory(
          '/tmp/sri_xmls/${ruc}_${year}_${month.toString().padLeft(2, '0')}');
      if (!outputDir.existsSync()) outputDir.createSync(recursive: true);

      // Leer API key de CapSolver: primero del entorno del proceso, luego del .env
      final capsolverApiKey = Platform.environment['CAPSOLVER_API_KEY'] ??
          _readEnvFile()['CAPSOLVER_API_KEY'] ?? '';
      if (capsolverApiKey.isEmpty) {
        _log('ERROR: CAPSOLVER_API_KEY no está configurada en el entorno ni en .env.');
        return false;
      }

      // Priorizar Chrome real — fingerprint genuino
      const chromeMac = '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome';
      const chromeLinux = '/usr/bin/google-chrome';
      const chromiumLinux = '/usr/bin/chromium';
      final execPath = File(chromeMac).existsSync()
          ? chromeMac
          : File(chromeLinux).existsSync()
              ? chromeLinux
              : File(chromiumLinux).existsSync()
                  ? chromiumLinux
                  : null;
      _log('Browser: ${execPath ?? "puppeteer-bundled-chromium"}');

      browser = await puppeteer.launch(
        headless: false,
        executablePath: execPath,
        ignoreDefaultArgs: ['--enable-automation'],
        args: [
          '--no-sandbox',
          '--disable-setuid-sandbox',
          '--disable-blink-features=AutomationControlled',
          '--window-size=1280,900',
        ],
      );

      final page = await browser.newPage();
      await page.setUserAgent(_userAgent);
      await page.setViewport(DeviceViewport(width: 1280, height: 900));
      await page.evaluateOnNewDocument(_stealthScript);

      // Interceptar para loguear estado del token en los POSTs
      await page.setRequestInterception(true);
      page.onRequest.listen((req) {
        if (req.url.contains('comprobantesRecibidos.jsf') && req.method == 'POST') {
          final body = req.postData ?? '';
          final hasToken = body.contains('g-recaptcha-response');
          final tokenEmpty = RegExp(r'g-recaptcha-response=(&|$)').hasMatch(body);
          _log('POST comprobantes: captcha_token='
              '${hasToken ? (tokenEmpty ? "VACÍO" : "PRESENTE(${body.length}B)") : "AUSENTE"}');
        }
        req.continueRequest();
      });

      // --- LOGIN ---
      _log('Autenticando...');
      await page.goto(_sriLoginUrl,
          wait: Until.domContentLoaded, timeout: const Duration(seconds: 60));
      await page.waitForSelector('#usuario', timeout: const Duration(seconds: 20));
      await page.type('#usuario', ruc,
          delay: Duration(milliseconds: 50 + _random.nextInt(100)));
      await _humanDelay(minMs: 200, maxMs: 600);
      await page.type('#password', password,
          delay: Duration(milliseconds: 50 + _random.nextInt(100)));
      await _humanDelay(minMs: 500, maxMs: 1000);
      await page.click('#kc-login');
      await page.waitForNavigation(
          wait: Until.domContentLoaded, timeout: const Duration(seconds: 60));

      if (!page.url!.contains('sri-en-linea')) {
        _log('ERROR: Login fallido. URL actual: ${page.url}');
        return false;
      }

      // --- COMPROBANTES ---
      _log('Navegando a comprobantes...');
      await page.goto(_comprobantesUrl,
          wait: Until.domContentLoaded, timeout: const Duration(seconds: 60));
      await page.waitForSelector('#frmPrincipal\\:btnBuscar',
          timeout: const Duration(seconds: 20));
      await _humanDelay(minMs: 1000, maxMs: 2000); // dar tiempo al JS de la página

      final meses = [
        '', 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
        'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'
      ];

      if (!await _buscarComprobantes(page, capsolverApiKey, year, meses[month])) {
        return false;
      }

      // --- DESCARGA CON PAGINACIÓN ---
      int totalDescargados = 0;
      int pagina = 1;

      while (true) {
        _log('Procesando página $pagina...');
        totalDescargados += await _descargarPaginaActual(page, outputDir);

        final hayMas = await page.evaluate<bool>(r'''() =>
          document.querySelector('.ui-paginator-next:not(.ui-state-disabled)') != null
        ''');
        if (!hayMas) break;

        _log('Avanzando a página ${pagina + 1}...');
        await page.click('.ui-paginator-next');
        await _humanDelay(minMs: 3000, maxMs: 5000);
        pagina++;
      }

      _log('FIN: $totalDescargados XML(s) descargados en $pagina página(s).');
      return totalDescargados > 0;
    } catch (e, st) {
      _log('Error crítico: $e\n$st');
      return false;
    } finally {
      await browser?.close();
      _log('=== FIN ===');
    }
  }
}