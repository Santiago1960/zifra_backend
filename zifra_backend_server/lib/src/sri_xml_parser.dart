import 'dart:io';
import 'package:xml/xml.dart';
import 'generated/protocol.dart';

/// Parser de XMLs del SRI portado del frontend Flutter.
///
/// Convierte el contenido XML de un comprobante electrónico en los modelos
/// de Serverpod [Invoices], [InvoiceDetail], [Pago] e [InvoiceInfoAdicional].
/// Las facturas parseadas aquí se marcan con [certificada]=true porque su
/// origen es directamente el SRI, sin intervención manual.
class SriXmlParser {
  void _log(String msg) => stderr.writeln('[${DateTime.now()}] SRI-PARSER: $msg');

  /// Parsea una lista de contenidos XML y retorna las facturas válidas.
  /// Ignora silenciosamente tipos no soportados (notas de crédito, retenciones).
  List<Invoices> parseAll(List<String> xmlContents) => xmlContents
      .map(_parseOne)
      .whereType<Invoices>()
      .toList();

  Invoices? _parseOne(String xmlContent) {
    try {
      final document = XmlDocument.parse(xmlContent);

      // El XML del SRI tiene una envoltura <autorizacion> con el comprobante en CDATA
      final autorizacionNode = document.findAllElements('autorizacion').firstOrNull;
      String numeroAutorizacion = 'N/A';
      String fechaAutorizacion = 'N/A';
      XmlDocument invoiceData;

      if (autorizacionNode != null) {
        numeroAutorizacion = _text(autorizacionNode, 'numeroAutorizacion');
        fechaAutorizacion  = _text(autorizacionNode, 'fechaAutorizacion');
        final cdataNode    = autorizacionNode.findAllElements('comprobante').firstOrNull;

        invoiceData = (cdataNode?.firstChild is XmlCDATA)
            ? XmlDocument.parse(cdataNode!.firstChild!.value!)
            : document;
      } else {
        invoiceData = document;
      }

      // Solo procesamos facturas — otros tipos (nota de crédito, retención) se ignoran
      if (invoiceData.findAllElements('factura').isEmpty) {
        final claveTemp = invoiceData.findAllElements('claveAcceso').firstOrNull?.innerText.trim() ?? '?';
        _log('SKIP: tipo no soportado en $claveTemp');
        return null;
      }
      final invoiceNode = invoiceData.findAllElements('factura').first;

      // --- infoTributaria ---
      final infoTrib      = invoiceNode.findAllElements('infoTributaria').first;
      final razonSocial   = _text(infoTrib, 'razonSocial');
      final ruc           = _text(infoTrib, 'ruc');
      final claveAcceso   = _text(infoTrib, 'claveAcceso');
      var   nombreComercial = _text(infoTrib, 'nombreComercial', razonSocial);
      if (nombreComercial == ruc) nombreComercial = razonSocial;

      // Si no hay envoltura de autorización, usamos clave/fecha de emisión como fallback
      if (autorizacionNode == null) {
        numeroAutorizacion = claveAcceso;
        fechaAutorizacion  = _text(infoTrib, 'fechaEmision');
      }

      // --- infoFactura ---
      final infoFact = invoiceNode.findAllElements('infoFactura').first;

      // Totales de impuestos
      double baseIvaCero = 0, baseIva = 0, valorIVA = 0, valorDevIva = 0;
      for (final imp in infoFact.findAllElements('totalImpuesto')) {
        if (_text(imp, 'codigo') != '2') continue; // Solo IVA
        final pct = _text(imp, 'codigoPorcentaje');
        final base = _double(_text(imp, 'baseImponible', '0'));
        final val  = _double(_text(imp, 'valor', '0'));
        if (pct == '0') {
          baseIvaCero += base;
        } else if (['2', '3', '4'].contains(pct)) {
          baseIva  += base;
          valorIVA += val;
        }
        valorDevIva += _double(_text(imp, 'valorDevolucionIva', '0'));
      }

      // --- Detalles ---
      final detalles = invoiceNode
          .findAllElements('detalle')
          .map((d) => InvoiceDetail(
                invoiceId:              0, // se actualiza antes del INSERT en _guardarFacturas
                codigoPrincipal:        _text(d, 'codigoPrincipal'),
                descripcion:            _text(d, 'descripcion'),
                cantidad:               _double(_text(d, 'cantidad', '0')),
                precioUnitario:         _double(_text(d, 'precioUnitario', '0')),
                descuento:              _double(_text(d, 'descuento', '0')),
                precioTotalSinImpuesto: _double(_text(d, 'precioTotalSinImpuesto', '0')),
              ))
          .toList();

      // --- Pagos ---
      final pagos = invoiceNode
          .findAllElements('pago')
          .map((p) => Pago(
                invoiceId:    0,
                formaPago:    _text(p, 'formaPago'),
                total:        _double(_text(p, 'total', '0')),
                plazo:        _double(_text(p, 'plazo', '0')),
                unidadTiempo: _text(p, 'unidadTiempo', 'dias'),
              ))
          .toList();

      // --- InfoAdicional ---
      final infoAdicional = invoiceNode
          .findAllElements('campoAdicional')
          .map((c) => InvoiceInfoAdicional(
                invoiceId: 0,
                clave: c.getAttribute('nombre') ?? 'N/A',
                valor: c.innerText.trim(),
              ))
          .toList();

      return Invoices(
        projectId:                  0, // se asigna en _guardarFacturas
        razonSocial:                razonSocial,
        nombreComercial:            nombreComercial,
        ruc:                        ruc,
        claveAcceso:                claveAcceso,
        codDoc:                     _text(infoTrib, 'codDoc'),
        estab:                      _text(infoTrib, 'estab'),
        ptoEmi:                     _text(infoTrib, 'ptoEmi'),
        secuencial:                 _text(infoTrib, 'secuencial'),
        dirMatriz:                  _text(infoTrib, 'dirMatriz'),
        fechaEmision:               _text(infoFact, 'fechaEmision'),
        dirEstablecimiento:         _text(infoFact, 'dirEstablecimiento'),
        contribuyenteEspecial:      _text(infoFact, 'contribuyenteEspecial', 'NO'),
        obligadoContabilidad:       _text(infoFact, 'obligadoContabilidad', 'NO'),
        tipoIdentificacionComprador: _text(infoFact, 'tipoIdentificacionComprador'),
        razonSocialComprador:       _text(infoFact, 'razonSocialComprador'),
        identificacionComprador:    _text(infoFact, 'identificacionComprador'),
        totalSinImpuestos:          _double(_text(infoFact, 'totalSinImpuestos', '0')),
        totalDescuento:             _double(_text(infoFact, 'totalDescuento', '0')),
        baseImponibleIvaCero:       baseIvaCero,
        baseImponibleIva:           baseIva,
        valorIVA:                   valorIVA,
        valorDevolucionIva:         valorDevIva,
        propina:                    _double(_text(infoFact, 'propina', '0')),
        importeTotal:               _double(_text(infoFact, 'importeTotal', '0')),
        numeroAutorizacion:         numeroAutorizacion,
        fechaAutorizacion:          fechaAutorizacion,
        estaSeleccionada:           false,
        certificada:                true, // Garantía de origen SRI — no adulterada
        detalles:                   detalles,
        pagos:                      pagos,
        infoAdicional:              infoAdicional,
      );
    } catch (e) {
      _log('Error parseando XML: $e');
      return null;
    }
  }

  // --- Helpers ---

  String _text(XmlElement? el, String name, [String defaultVal = 'N/A']) =>
      el?.findAllElements(name).firstOrNull?.innerText.trim() ?? defaultVal;

  double _double(String? value) => double.tryParse(value ?? '0') ?? 0.0;
}
