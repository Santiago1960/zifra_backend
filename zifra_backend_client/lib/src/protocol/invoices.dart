/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'invoice_detail.dart' as _i2;
import 'pago.dart' as _i3;
import 'invoice_info_adicional.dart' as _i4;
import 'projects.dart' as _i5;

abstract class Invoices implements _i1.SerializableModel {
  Invoices._({
    this.id,
    required this.razonSocial,
    required this.nombreComercial,
    required this.ruc,
    required this.claveAcceso,
    required this.codDoc,
    required this.estab,
    required this.ptoEmi,
    required this.secuencial,
    required this.dirMatriz,
    required this.fechaEmision,
    required this.dirEstablecimiento,
    required this.contribuyenteEspecial,
    required this.obligadoContabilidad,
    required this.tipoIdentificacionComprador,
    required this.razonSocialComprador,
    required this.identificacionComprador,
    required this.totalSinImpuestos,
    required this.totalDescuento,
    required this.baseImponibleIvaCero,
    required this.baseImponibleIva,
    required this.valorIVA,
    required this.valorDevolucionIva,
    required this.propina,
    required this.importeTotal,
    this.detalles,
    this.pagos,
    this.infoAdicional,
    required this.numeroAutorizacion,
    required this.fechaAutorizacion,
    required this.estaSeleccionada,
    required this.certificada,
    this.categoryId,
    required this.projectId,
    this.project,
  });

  factory Invoices({
    int? id,
    required String razonSocial,
    required String nombreComercial,
    required String ruc,
    required String claveAcceso,
    required String codDoc,
    required String estab,
    required String ptoEmi,
    required String secuencial,
    required String dirMatriz,
    required String fechaEmision,
    required String dirEstablecimiento,
    required String contribuyenteEspecial,
    required String obligadoContabilidad,
    required String tipoIdentificacionComprador,
    required String razonSocialComprador,
    required String identificacionComprador,
    required double totalSinImpuestos,
    required double totalDescuento,
    required double baseImponibleIvaCero,
    required double baseImponibleIva,
    required double valorIVA,
    required double valorDevolucionIva,
    required double propina,
    required double importeTotal,
    List<_i2.InvoiceDetail>? detalles,
    List<_i3.Pago>? pagos,
    List<_i4.InvoiceInfoAdicional>? infoAdicional,
    required String numeroAutorizacion,
    required String fechaAutorizacion,
    required bool estaSeleccionada,
    required bool certificada,
    int? categoryId,
    required int projectId,
    _i5.Projects? project,
  }) = _InvoicesImpl;

  factory Invoices.fromJson(Map<String, dynamic> jsonSerialization) {
    return Invoices(
      id: jsonSerialization['id'] as int?,
      razonSocial: jsonSerialization['razonSocial'] as String,
      nombreComercial: jsonSerialization['nombreComercial'] as String,
      ruc: jsonSerialization['ruc'] as String,
      claveAcceso: jsonSerialization['claveAcceso'] as String,
      codDoc: jsonSerialization['codDoc'] as String,
      estab: jsonSerialization['estab'] as String,
      ptoEmi: jsonSerialization['ptoEmi'] as String,
      secuencial: jsonSerialization['secuencial'] as String,
      dirMatriz: jsonSerialization['dirMatriz'] as String,
      fechaEmision: jsonSerialization['fechaEmision'] as String,
      dirEstablecimiento: jsonSerialization['dirEstablecimiento'] as String,
      contribuyenteEspecial:
          jsonSerialization['contribuyenteEspecial'] as String,
      obligadoContabilidad: jsonSerialization['obligadoContabilidad'] as String,
      tipoIdentificacionComprador:
          jsonSerialization['tipoIdentificacionComprador'] as String,
      razonSocialComprador: jsonSerialization['razonSocialComprador'] as String,
      identificacionComprador:
          jsonSerialization['identificacionComprador'] as String,
      totalSinImpuestos:
          (jsonSerialization['totalSinImpuestos'] as num).toDouble(),
      totalDescuento: (jsonSerialization['totalDescuento'] as num).toDouble(),
      baseImponibleIvaCero:
          (jsonSerialization['baseImponibleIvaCero'] as num).toDouble(),
      baseImponibleIva:
          (jsonSerialization['baseImponibleIva'] as num).toDouble(),
      valorIVA: (jsonSerialization['valorIVA'] as num).toDouble(),
      valorDevolucionIva:
          (jsonSerialization['valorDevolucionIva'] as num).toDouble(),
      propina: (jsonSerialization['propina'] as num).toDouble(),
      importeTotal: (jsonSerialization['importeTotal'] as num).toDouble(),
      detalles: (jsonSerialization['detalles'] as List?)
          ?.map((e) => _i2.InvoiceDetail.fromJson((e as Map<String, dynamic>)))
          .toList(),
      pagos: (jsonSerialization['pagos'] as List?)
          ?.map((e) => _i3.Pago.fromJson((e as Map<String, dynamic>)))
          .toList(),
      infoAdicional: (jsonSerialization['infoAdicional'] as List?)
          ?.map((e) =>
              _i4.InvoiceInfoAdicional.fromJson((e as Map<String, dynamic>)))
          .toList(),
      numeroAutorizacion: jsonSerialization['numeroAutorizacion'] as String,
      fechaAutorizacion: jsonSerialization['fechaAutorizacion'] as String,
      estaSeleccionada: jsonSerialization['estaSeleccionada'] as bool,
      certificada: jsonSerialization['certificada'] as bool,
      categoryId: jsonSerialization['categoryId'] as int?,
      projectId: jsonSerialization['projectId'] as int,
      project: jsonSerialization['project'] == null
          ? null
          : _i5.Projects.fromJson(
              (jsonSerialization['project'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String razonSocial;

  String nombreComercial;

  String ruc;

  String claveAcceso;

  String codDoc;

  String estab;

  String ptoEmi;

  String secuencial;

  String dirMatriz;

  String fechaEmision;

  String dirEstablecimiento;

  String contribuyenteEspecial;

  String obligadoContabilidad;

  String tipoIdentificacionComprador;

  String razonSocialComprador;

  String identificacionComprador;

  double totalSinImpuestos;

  double totalDescuento;

  double baseImponibleIvaCero;

  double baseImponibleIva;

  double valorIVA;

  double valorDevolucionIva;

  double propina;

  double importeTotal;

  List<_i2.InvoiceDetail>? detalles;

  List<_i3.Pago>? pagos;

  List<_i4.InvoiceInfoAdicional>? infoAdicional;

  String numeroAutorizacion;

  String fechaAutorizacion;

  bool estaSeleccionada;

  bool certificada;

  int? categoryId;

  int projectId;

  _i5.Projects? project;

  /// Returns a shallow copy of this [Invoices]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Invoices copyWith({
    int? id,
    String? razonSocial,
    String? nombreComercial,
    String? ruc,
    String? claveAcceso,
    String? codDoc,
    String? estab,
    String? ptoEmi,
    String? secuencial,
    String? dirMatriz,
    String? fechaEmision,
    String? dirEstablecimiento,
    String? contribuyenteEspecial,
    String? obligadoContabilidad,
    String? tipoIdentificacionComprador,
    String? razonSocialComprador,
    String? identificacionComprador,
    double? totalSinImpuestos,
    double? totalDescuento,
    double? baseImponibleIvaCero,
    double? baseImponibleIva,
    double? valorIVA,
    double? valorDevolucionIva,
    double? propina,
    double? importeTotal,
    List<_i2.InvoiceDetail>? detalles,
    List<_i3.Pago>? pagos,
    List<_i4.InvoiceInfoAdicional>? infoAdicional,
    String? numeroAutorizacion,
    String? fechaAutorizacion,
    bool? estaSeleccionada,
    bool? certificada,
    int? categoryId,
    int? projectId,
    _i5.Projects? project,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'razonSocial': razonSocial,
      'nombreComercial': nombreComercial,
      'ruc': ruc,
      'claveAcceso': claveAcceso,
      'codDoc': codDoc,
      'estab': estab,
      'ptoEmi': ptoEmi,
      'secuencial': secuencial,
      'dirMatriz': dirMatriz,
      'fechaEmision': fechaEmision,
      'dirEstablecimiento': dirEstablecimiento,
      'contribuyenteEspecial': contribuyenteEspecial,
      'obligadoContabilidad': obligadoContabilidad,
      'tipoIdentificacionComprador': tipoIdentificacionComprador,
      'razonSocialComprador': razonSocialComprador,
      'identificacionComprador': identificacionComprador,
      'totalSinImpuestos': totalSinImpuestos,
      'totalDescuento': totalDescuento,
      'baseImponibleIvaCero': baseImponibleIvaCero,
      'baseImponibleIva': baseImponibleIva,
      'valorIVA': valorIVA,
      'valorDevolucionIva': valorDevolucionIva,
      'propina': propina,
      'importeTotal': importeTotal,
      if (detalles != null)
        'detalles': detalles?.toJson(valueToJson: (v) => v.toJson()),
      if (pagos != null) 'pagos': pagos?.toJson(valueToJson: (v) => v.toJson()),
      if (infoAdicional != null)
        'infoAdicional': infoAdicional?.toJson(valueToJson: (v) => v.toJson()),
      'numeroAutorizacion': numeroAutorizacion,
      'fechaAutorizacion': fechaAutorizacion,
      'estaSeleccionada': estaSeleccionada,
      'certificada': certificada,
      if (categoryId != null) 'categoryId': categoryId,
      'projectId': projectId,
      if (project != null) 'project': project?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _InvoicesImpl extends Invoices {
  _InvoicesImpl({
    int? id,
    required String razonSocial,
    required String nombreComercial,
    required String ruc,
    required String claveAcceso,
    required String codDoc,
    required String estab,
    required String ptoEmi,
    required String secuencial,
    required String dirMatriz,
    required String fechaEmision,
    required String dirEstablecimiento,
    required String contribuyenteEspecial,
    required String obligadoContabilidad,
    required String tipoIdentificacionComprador,
    required String razonSocialComprador,
    required String identificacionComprador,
    required double totalSinImpuestos,
    required double totalDescuento,
    required double baseImponibleIvaCero,
    required double baseImponibleIva,
    required double valorIVA,
    required double valorDevolucionIva,
    required double propina,
    required double importeTotal,
    List<_i2.InvoiceDetail>? detalles,
    List<_i3.Pago>? pagos,
    List<_i4.InvoiceInfoAdicional>? infoAdicional,
    required String numeroAutorizacion,
    required String fechaAutorizacion,
    required bool estaSeleccionada,
    required bool certificada,
    int? categoryId,
    required int projectId,
    _i5.Projects? project,
  }) : super._(
          id: id,
          razonSocial: razonSocial,
          nombreComercial: nombreComercial,
          ruc: ruc,
          claveAcceso: claveAcceso,
          codDoc: codDoc,
          estab: estab,
          ptoEmi: ptoEmi,
          secuencial: secuencial,
          dirMatriz: dirMatriz,
          fechaEmision: fechaEmision,
          dirEstablecimiento: dirEstablecimiento,
          contribuyenteEspecial: contribuyenteEspecial,
          obligadoContabilidad: obligadoContabilidad,
          tipoIdentificacionComprador: tipoIdentificacionComprador,
          razonSocialComprador: razonSocialComprador,
          identificacionComprador: identificacionComprador,
          totalSinImpuestos: totalSinImpuestos,
          totalDescuento: totalDescuento,
          baseImponibleIvaCero: baseImponibleIvaCero,
          baseImponibleIva: baseImponibleIva,
          valorIVA: valorIVA,
          valorDevolucionIva: valorDevolucionIva,
          propina: propina,
          importeTotal: importeTotal,
          detalles: detalles,
          pagos: pagos,
          infoAdicional: infoAdicional,
          numeroAutorizacion: numeroAutorizacion,
          fechaAutorizacion: fechaAutorizacion,
          estaSeleccionada: estaSeleccionada,
          certificada: certificada,
          categoryId: categoryId,
          projectId: projectId,
          project: project,
        );

  /// Returns a shallow copy of this [Invoices]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Invoices copyWith({
    Object? id = _Undefined,
    String? razonSocial,
    String? nombreComercial,
    String? ruc,
    String? claveAcceso,
    String? codDoc,
    String? estab,
    String? ptoEmi,
    String? secuencial,
    String? dirMatriz,
    String? fechaEmision,
    String? dirEstablecimiento,
    String? contribuyenteEspecial,
    String? obligadoContabilidad,
    String? tipoIdentificacionComprador,
    String? razonSocialComprador,
    String? identificacionComprador,
    double? totalSinImpuestos,
    double? totalDescuento,
    double? baseImponibleIvaCero,
    double? baseImponibleIva,
    double? valorIVA,
    double? valorDevolucionIva,
    double? propina,
    double? importeTotal,
    Object? detalles = _Undefined,
    Object? pagos = _Undefined,
    Object? infoAdicional = _Undefined,
    String? numeroAutorizacion,
    String? fechaAutorizacion,
    bool? estaSeleccionada,
    bool? certificada,
    Object? categoryId = _Undefined,
    int? projectId,
    Object? project = _Undefined,
  }) {
    return Invoices(
      id: id is int? ? id : this.id,
      razonSocial: razonSocial ?? this.razonSocial,
      nombreComercial: nombreComercial ?? this.nombreComercial,
      ruc: ruc ?? this.ruc,
      claveAcceso: claveAcceso ?? this.claveAcceso,
      codDoc: codDoc ?? this.codDoc,
      estab: estab ?? this.estab,
      ptoEmi: ptoEmi ?? this.ptoEmi,
      secuencial: secuencial ?? this.secuencial,
      dirMatriz: dirMatriz ?? this.dirMatriz,
      fechaEmision: fechaEmision ?? this.fechaEmision,
      dirEstablecimiento: dirEstablecimiento ?? this.dirEstablecimiento,
      contribuyenteEspecial:
          contribuyenteEspecial ?? this.contribuyenteEspecial,
      obligadoContabilidad: obligadoContabilidad ?? this.obligadoContabilidad,
      tipoIdentificacionComprador:
          tipoIdentificacionComprador ?? this.tipoIdentificacionComprador,
      razonSocialComprador: razonSocialComprador ?? this.razonSocialComprador,
      identificacionComprador:
          identificacionComprador ?? this.identificacionComprador,
      totalSinImpuestos: totalSinImpuestos ?? this.totalSinImpuestos,
      totalDescuento: totalDescuento ?? this.totalDescuento,
      baseImponibleIvaCero: baseImponibleIvaCero ?? this.baseImponibleIvaCero,
      baseImponibleIva: baseImponibleIva ?? this.baseImponibleIva,
      valorIVA: valorIVA ?? this.valorIVA,
      valorDevolucionIva: valorDevolucionIva ?? this.valorDevolucionIva,
      propina: propina ?? this.propina,
      importeTotal: importeTotal ?? this.importeTotal,
      detalles: detalles is List<_i2.InvoiceDetail>?
          ? detalles
          : this.detalles?.map((e0) => e0.copyWith()).toList(),
      pagos: pagos is List<_i3.Pago>?
          ? pagos
          : this.pagos?.map((e0) => e0.copyWith()).toList(),
      infoAdicional: infoAdicional is List<_i4.InvoiceInfoAdicional>?
          ? infoAdicional
          : this.infoAdicional?.map((e0) => e0.copyWith()).toList(),
      numeroAutorizacion: numeroAutorizacion ?? this.numeroAutorizacion,
      fechaAutorizacion: fechaAutorizacion ?? this.fechaAutorizacion,
      estaSeleccionada: estaSeleccionada ?? this.estaSeleccionada,
      certificada: certificada ?? this.certificada,
      categoryId: categoryId is int? ? categoryId : this.categoryId,
      projectId: projectId ?? this.projectId,
      project: project is _i5.Projects? ? project : this.project?.copyWith(),
    );
  }
}
