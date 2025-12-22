/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'invoice_detail.dart' as _i2;
import 'pago.dart' as _i3;
import 'invoice_info_adicional.dart' as _i4;
import 'projects.dart' as _i5;

abstract class Invoices
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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
  }) : _projectsInvoicesProjectsId = null;

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
    return InvoicesImplicit._(
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
      $_projectsInvoicesProjectsId:
          jsonSerialization['_projectsInvoicesProjectsId'] as int?,
    );
  }

  static final t = InvoicesTable();

  static const db = InvoicesRepository._();

  @override
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

  final int? _projectsInvoicesProjectsId;

  @override
  _i1.Table<int?> get table => t;

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
      if (_projectsInvoicesProjectsId != null)
        '_projectsInvoicesProjectsId': _projectsInvoicesProjectsId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
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
        'detalles': detalles?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (pagos != null)
        'pagos': pagos?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (infoAdicional != null)
        'infoAdicional':
            infoAdicional?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'numeroAutorizacion': numeroAutorizacion,
      'fechaAutorizacion': fechaAutorizacion,
      'estaSeleccionada': estaSeleccionada,
      'certificada': certificada,
      if (categoryId != null) 'categoryId': categoryId,
      'projectId': projectId,
      if (project != null) 'project': project?.toJsonForProtocol(),
    };
  }

  static InvoicesInclude include({
    _i2.InvoiceDetailIncludeList? detalles,
    _i3.PagoIncludeList? pagos,
    _i4.InvoiceInfoAdicionalIncludeList? infoAdicional,
    _i5.ProjectsInclude? project,
  }) {
    return InvoicesInclude._(
      detalles: detalles,
      pagos: pagos,
      infoAdicional: infoAdicional,
      project: project,
    );
  }

  static InvoicesIncludeList includeList({
    _i1.WhereExpressionBuilder<InvoicesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<InvoicesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<InvoicesTable>? orderByList,
    InvoicesInclude? include,
  }) {
    return InvoicesIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Invoices.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Invoices.t),
      include: include,
    );
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
    return InvoicesImplicit._(
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
      $_projectsInvoicesProjectsId: this._projectsInvoicesProjectsId,
    );
  }
}

class InvoicesImplicit extends _InvoicesImpl {
  InvoicesImplicit._({
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
    int? $_projectsInvoicesProjectsId,
  })  : _projectsInvoicesProjectsId = $_projectsInvoicesProjectsId,
        super(
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

  factory InvoicesImplicit(
    Invoices invoices, {
    int? $_projectsInvoicesProjectsId,
  }) {
    return InvoicesImplicit._(
      id: invoices.id,
      razonSocial: invoices.razonSocial,
      nombreComercial: invoices.nombreComercial,
      ruc: invoices.ruc,
      claveAcceso: invoices.claveAcceso,
      codDoc: invoices.codDoc,
      estab: invoices.estab,
      ptoEmi: invoices.ptoEmi,
      secuencial: invoices.secuencial,
      dirMatriz: invoices.dirMatriz,
      fechaEmision: invoices.fechaEmision,
      dirEstablecimiento: invoices.dirEstablecimiento,
      contribuyenteEspecial: invoices.contribuyenteEspecial,
      obligadoContabilidad: invoices.obligadoContabilidad,
      tipoIdentificacionComprador: invoices.tipoIdentificacionComprador,
      razonSocialComprador: invoices.razonSocialComprador,
      identificacionComprador: invoices.identificacionComprador,
      totalSinImpuestos: invoices.totalSinImpuestos,
      totalDescuento: invoices.totalDescuento,
      baseImponibleIvaCero: invoices.baseImponibleIvaCero,
      baseImponibleIva: invoices.baseImponibleIva,
      valorIVA: invoices.valorIVA,
      valorDevolucionIva: invoices.valorDevolucionIva,
      propina: invoices.propina,
      importeTotal: invoices.importeTotal,
      detalles: invoices.detalles,
      pagos: invoices.pagos,
      infoAdicional: invoices.infoAdicional,
      numeroAutorizacion: invoices.numeroAutorizacion,
      fechaAutorizacion: invoices.fechaAutorizacion,
      estaSeleccionada: invoices.estaSeleccionada,
      certificada: invoices.certificada,
      categoryId: invoices.categoryId,
      projectId: invoices.projectId,
      project: invoices.project,
      $_projectsInvoicesProjectsId: $_projectsInvoicesProjectsId,
    );
  }

  @override
  final int? _projectsInvoicesProjectsId;
}

class InvoicesTable extends _i1.Table<int?> {
  InvoicesTable({super.tableRelation}) : super(tableName: 'invoices') {
    razonSocial = _i1.ColumnString(
      'razonSocial',
      this,
    );
    nombreComercial = _i1.ColumnString(
      'nombreComercial',
      this,
    );
    ruc = _i1.ColumnString(
      'ruc',
      this,
    );
    claveAcceso = _i1.ColumnString(
      'claveAcceso',
      this,
    );
    codDoc = _i1.ColumnString(
      'codDoc',
      this,
    );
    estab = _i1.ColumnString(
      'estab',
      this,
    );
    ptoEmi = _i1.ColumnString(
      'ptoEmi',
      this,
    );
    secuencial = _i1.ColumnString(
      'secuencial',
      this,
    );
    dirMatriz = _i1.ColumnString(
      'dirMatriz',
      this,
    );
    fechaEmision = _i1.ColumnString(
      'fechaEmision',
      this,
    );
    dirEstablecimiento = _i1.ColumnString(
      'dirEstablecimiento',
      this,
    );
    contribuyenteEspecial = _i1.ColumnString(
      'contribuyenteEspecial',
      this,
    );
    obligadoContabilidad = _i1.ColumnString(
      'obligadoContabilidad',
      this,
    );
    tipoIdentificacionComprador = _i1.ColumnString(
      'tipoIdentificacionComprador',
      this,
    );
    razonSocialComprador = _i1.ColumnString(
      'razonSocialComprador',
      this,
    );
    identificacionComprador = _i1.ColumnString(
      'identificacionComprador',
      this,
    );
    totalSinImpuestos = _i1.ColumnDouble(
      'totalSinImpuestos',
      this,
    );
    totalDescuento = _i1.ColumnDouble(
      'totalDescuento',
      this,
    );
    baseImponibleIvaCero = _i1.ColumnDouble(
      'baseImponibleIvaCero',
      this,
    );
    baseImponibleIva = _i1.ColumnDouble(
      'baseImponibleIva',
      this,
    );
    valorIVA = _i1.ColumnDouble(
      'valorIVA',
      this,
    );
    valorDevolucionIva = _i1.ColumnDouble(
      'valorDevolucionIva',
      this,
    );
    propina = _i1.ColumnDouble(
      'propina',
      this,
    );
    importeTotal = _i1.ColumnDouble(
      'importeTotal',
      this,
    );
    numeroAutorizacion = _i1.ColumnString(
      'numeroAutorizacion',
      this,
    );
    fechaAutorizacion = _i1.ColumnString(
      'fechaAutorizacion',
      this,
    );
    estaSeleccionada = _i1.ColumnBool(
      'estaSeleccionada',
      this,
    );
    certificada = _i1.ColumnBool(
      'certificada',
      this,
    );
    categoryId = _i1.ColumnInt(
      'categoryId',
      this,
    );
    projectId = _i1.ColumnInt(
      'projectId',
      this,
    );
    $_projectsInvoicesProjectsId = _i1.ColumnInt(
      '_projectsInvoicesProjectsId',
      this,
    );
  }

  late final _i1.ColumnString razonSocial;

  late final _i1.ColumnString nombreComercial;

  late final _i1.ColumnString ruc;

  late final _i1.ColumnString claveAcceso;

  late final _i1.ColumnString codDoc;

  late final _i1.ColumnString estab;

  late final _i1.ColumnString ptoEmi;

  late final _i1.ColumnString secuencial;

  late final _i1.ColumnString dirMatriz;

  late final _i1.ColumnString fechaEmision;

  late final _i1.ColumnString dirEstablecimiento;

  late final _i1.ColumnString contribuyenteEspecial;

  late final _i1.ColumnString obligadoContabilidad;

  late final _i1.ColumnString tipoIdentificacionComprador;

  late final _i1.ColumnString razonSocialComprador;

  late final _i1.ColumnString identificacionComprador;

  late final _i1.ColumnDouble totalSinImpuestos;

  late final _i1.ColumnDouble totalDescuento;

  late final _i1.ColumnDouble baseImponibleIvaCero;

  late final _i1.ColumnDouble baseImponibleIva;

  late final _i1.ColumnDouble valorIVA;

  late final _i1.ColumnDouble valorDevolucionIva;

  late final _i1.ColumnDouble propina;

  late final _i1.ColumnDouble importeTotal;

  _i2.InvoiceDetailTable? ___detalles;

  _i1.ManyRelation<_i2.InvoiceDetailTable>? _detalles;

  _i3.PagoTable? ___pagos;

  _i1.ManyRelation<_i3.PagoTable>? _pagos;

  _i4.InvoiceInfoAdicionalTable? ___infoAdicional;

  _i1.ManyRelation<_i4.InvoiceInfoAdicionalTable>? _infoAdicional;

  late final _i1.ColumnString numeroAutorizacion;

  late final _i1.ColumnString fechaAutorizacion;

  late final _i1.ColumnBool estaSeleccionada;

  late final _i1.ColumnBool certificada;

  late final _i1.ColumnInt categoryId;

  late final _i1.ColumnInt projectId;

  _i5.ProjectsTable? _project;

  late final _i1.ColumnInt $_projectsInvoicesProjectsId;

  _i2.InvoiceDetailTable get __detalles {
    if (___detalles != null) return ___detalles!;
    ___detalles = _i1.createRelationTable(
      relationFieldName: '__detalles',
      field: Invoices.t.id,
      foreignField: _i2.InvoiceDetail.t.invoiceId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.InvoiceDetailTable(tableRelation: foreignTableRelation),
    );
    return ___detalles!;
  }

  _i3.PagoTable get __pagos {
    if (___pagos != null) return ___pagos!;
    ___pagos = _i1.createRelationTable(
      relationFieldName: '__pagos',
      field: Invoices.t.id,
      foreignField: _i3.Pago.t.invoiceId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PagoTable(tableRelation: foreignTableRelation),
    );
    return ___pagos!;
  }

  _i4.InvoiceInfoAdicionalTable get __infoAdicional {
    if (___infoAdicional != null) return ___infoAdicional!;
    ___infoAdicional = _i1.createRelationTable(
      relationFieldName: '__infoAdicional',
      field: Invoices.t.id,
      foreignField: _i4.InvoiceInfoAdicional.t.invoiceId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.InvoiceInfoAdicionalTable(tableRelation: foreignTableRelation),
    );
    return ___infoAdicional!;
  }

  _i5.ProjectsTable get project {
    if (_project != null) return _project!;
    _project = _i1.createRelationTable(
      relationFieldName: 'project',
      field: Invoices.t.projectId,
      foreignField: _i5.Projects.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.ProjectsTable(tableRelation: foreignTableRelation),
    );
    return _project!;
  }

  _i1.ManyRelation<_i2.InvoiceDetailTable> get detalles {
    if (_detalles != null) return _detalles!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'detalles',
      field: Invoices.t.id,
      foreignField: _i2.InvoiceDetail.t.invoiceId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.InvoiceDetailTable(tableRelation: foreignTableRelation),
    );
    _detalles = _i1.ManyRelation<_i2.InvoiceDetailTable>(
      tableWithRelations: relationTable,
      table: _i2.InvoiceDetailTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _detalles!;
  }

  _i1.ManyRelation<_i3.PagoTable> get pagos {
    if (_pagos != null) return _pagos!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'pagos',
      field: Invoices.t.id,
      foreignField: _i3.Pago.t.invoiceId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.PagoTable(tableRelation: foreignTableRelation),
    );
    _pagos = _i1.ManyRelation<_i3.PagoTable>(
      tableWithRelations: relationTable,
      table: _i3.PagoTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _pagos!;
  }

  _i1.ManyRelation<_i4.InvoiceInfoAdicionalTable> get infoAdicional {
    if (_infoAdicional != null) return _infoAdicional!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'infoAdicional',
      field: Invoices.t.id,
      foreignField: _i4.InvoiceInfoAdicional.t.invoiceId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.InvoiceInfoAdicionalTable(tableRelation: foreignTableRelation),
    );
    _infoAdicional = _i1.ManyRelation<_i4.InvoiceInfoAdicionalTable>(
      tableWithRelations: relationTable,
      table: _i4.InvoiceInfoAdicionalTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _infoAdicional!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        razonSocial,
        nombreComercial,
        ruc,
        claveAcceso,
        codDoc,
        estab,
        ptoEmi,
        secuencial,
        dirMatriz,
        fechaEmision,
        dirEstablecimiento,
        contribuyenteEspecial,
        obligadoContabilidad,
        tipoIdentificacionComprador,
        razonSocialComprador,
        identificacionComprador,
        totalSinImpuestos,
        totalDescuento,
        baseImponibleIvaCero,
        baseImponibleIva,
        valorIVA,
        valorDevolucionIva,
        propina,
        importeTotal,
        numeroAutorizacion,
        fechaAutorizacion,
        estaSeleccionada,
        certificada,
        categoryId,
        projectId,
        $_projectsInvoicesProjectsId,
      ];

  @override
  List<_i1.Column> get managedColumns => [
        id,
        razonSocial,
        nombreComercial,
        ruc,
        claveAcceso,
        codDoc,
        estab,
        ptoEmi,
        secuencial,
        dirMatriz,
        fechaEmision,
        dirEstablecimiento,
        contribuyenteEspecial,
        obligadoContabilidad,
        tipoIdentificacionComprador,
        razonSocialComprador,
        identificacionComprador,
        totalSinImpuestos,
        totalDescuento,
        baseImponibleIvaCero,
        baseImponibleIva,
        valorIVA,
        valorDevolucionIva,
        propina,
        importeTotal,
        numeroAutorizacion,
        fechaAutorizacion,
        estaSeleccionada,
        certificada,
        categoryId,
        projectId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'detalles') {
      return __detalles;
    }
    if (relationField == 'pagos') {
      return __pagos;
    }
    if (relationField == 'infoAdicional') {
      return __infoAdicional;
    }
    if (relationField == 'project') {
      return project;
    }
    return null;
  }
}

class InvoicesInclude extends _i1.IncludeObject {
  InvoicesInclude._({
    _i2.InvoiceDetailIncludeList? detalles,
    _i3.PagoIncludeList? pagos,
    _i4.InvoiceInfoAdicionalIncludeList? infoAdicional,
    _i5.ProjectsInclude? project,
  }) {
    _detalles = detalles;
    _pagos = pagos;
    _infoAdicional = infoAdicional;
    _project = project;
  }

  _i2.InvoiceDetailIncludeList? _detalles;

  _i3.PagoIncludeList? _pagos;

  _i4.InvoiceInfoAdicionalIncludeList? _infoAdicional;

  _i5.ProjectsInclude? _project;

  @override
  Map<String, _i1.Include?> get includes => {
        'detalles': _detalles,
        'pagos': _pagos,
        'infoAdicional': _infoAdicional,
        'project': _project,
      };

  @override
  _i1.Table<int?> get table => Invoices.t;
}

class InvoicesIncludeList extends _i1.IncludeList {
  InvoicesIncludeList._({
    _i1.WhereExpressionBuilder<InvoicesTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Invoices.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Invoices.t;
}

class InvoicesRepository {
  const InvoicesRepository._();

  final attach = const InvoicesAttachRepository._();

  final attachRow = const InvoicesAttachRowRepository._();

  final detach = const InvoicesDetachRepository._();

  final detachRow = const InvoicesDetachRowRepository._();

  /// Returns a list of [Invoices]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Invoices>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<InvoicesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<InvoicesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<InvoicesTable>? orderByList,
    _i1.Transaction? transaction,
    InvoicesInclude? include,
  }) async {
    return session.db.find<Invoices>(
      where: where?.call(Invoices.t),
      orderBy: orderBy?.call(Invoices.t),
      orderByList: orderByList?.call(Invoices.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Invoices] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Invoices?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<InvoicesTable>? where,
    int? offset,
    _i1.OrderByBuilder<InvoicesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<InvoicesTable>? orderByList,
    _i1.Transaction? transaction,
    InvoicesInclude? include,
  }) async {
    return session.db.findFirstRow<Invoices>(
      where: where?.call(Invoices.t),
      orderBy: orderBy?.call(Invoices.t),
      orderByList: orderByList?.call(Invoices.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Invoices] by its [id] or null if no such row exists.
  Future<Invoices?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    InvoicesInclude? include,
  }) async {
    return session.db.findById<Invoices>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Invoices]s in the list and returns the inserted rows.
  ///
  /// The returned [Invoices]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Invoices>> insert(
    _i1.Session session,
    List<Invoices> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Invoices>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Invoices] and returns the inserted row.
  ///
  /// The returned [Invoices] will have its `id` field set.
  Future<Invoices> insertRow(
    _i1.Session session,
    Invoices row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Invoices>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Invoices]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Invoices>> update(
    _i1.Session session,
    List<Invoices> rows, {
    _i1.ColumnSelections<InvoicesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Invoices>(
      rows,
      columns: columns?.call(Invoices.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Invoices]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Invoices> updateRow(
    _i1.Session session,
    Invoices row, {
    _i1.ColumnSelections<InvoicesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Invoices>(
      row,
      columns: columns?.call(Invoices.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Invoices]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Invoices>> delete(
    _i1.Session session,
    List<Invoices> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Invoices>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Invoices].
  Future<Invoices> deleteRow(
    _i1.Session session,
    Invoices row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Invoices>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Invoices>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<InvoicesTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Invoices>(
      where: where(Invoices.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<InvoicesTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Invoices>(
      where: where?.call(Invoices.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class InvoicesAttachRepository {
  const InvoicesAttachRepository._();

  /// Creates a relation between this [Invoices] and the given [InvoiceDetail]s
  /// by setting each [InvoiceDetail]'s foreign key `invoiceId` to refer to this [Invoices].
  Future<void> detalles(
    _i1.Session session,
    Invoices invoices,
    List<_i2.InvoiceDetail> invoiceDetail, {
    _i1.Transaction? transaction,
  }) async {
    if (invoiceDetail.any((e) => e.id == null)) {
      throw ArgumentError.notNull('invoiceDetail.id');
    }
    if (invoices.id == null) {
      throw ArgumentError.notNull('invoices.id');
    }

    var $invoiceDetail =
        invoiceDetail.map((e) => e.copyWith(invoiceId: invoices.id)).toList();
    await session.db.update<_i2.InvoiceDetail>(
      $invoiceDetail,
      columns: [_i2.InvoiceDetail.t.invoiceId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Invoices] and the given [Pago]s
  /// by setting each [Pago]'s foreign key `invoiceId` to refer to this [Invoices].
  Future<void> pagos(
    _i1.Session session,
    Invoices invoices,
    List<_i3.Pago> pago, {
    _i1.Transaction? transaction,
  }) async {
    if (pago.any((e) => e.id == null)) {
      throw ArgumentError.notNull('pago.id');
    }
    if (invoices.id == null) {
      throw ArgumentError.notNull('invoices.id');
    }

    var $pago = pago.map((e) => e.copyWith(invoiceId: invoices.id)).toList();
    await session.db.update<_i3.Pago>(
      $pago,
      columns: [_i3.Pago.t.invoiceId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Invoices] and the given [InvoiceInfoAdicional]s
  /// by setting each [InvoiceInfoAdicional]'s foreign key `invoiceId` to refer to this [Invoices].
  Future<void> infoAdicional(
    _i1.Session session,
    Invoices invoices,
    List<_i4.InvoiceInfoAdicional> invoiceInfoAdicional, {
    _i1.Transaction? transaction,
  }) async {
    if (invoiceInfoAdicional.any((e) => e.id == null)) {
      throw ArgumentError.notNull('invoiceInfoAdicional.id');
    }
    if (invoices.id == null) {
      throw ArgumentError.notNull('invoices.id');
    }

    var $invoiceInfoAdicional = invoiceInfoAdicional
        .map((e) => e.copyWith(invoiceId: invoices.id))
        .toList();
    await session.db.update<_i4.InvoiceInfoAdicional>(
      $invoiceInfoAdicional,
      columns: [_i4.InvoiceInfoAdicional.t.invoiceId],
      transaction: transaction,
    );
  }
}

class InvoicesAttachRowRepository {
  const InvoicesAttachRowRepository._();

  /// Creates a relation between the given [Invoices] and [Projects]
  /// by setting the [Invoices]'s foreign key `projectId` to refer to the [Projects].
  Future<void> project(
    _i1.Session session,
    Invoices invoices,
    _i5.Projects project, {
    _i1.Transaction? transaction,
  }) async {
    if (invoices.id == null) {
      throw ArgumentError.notNull('invoices.id');
    }
    if (project.id == null) {
      throw ArgumentError.notNull('project.id');
    }

    var $invoices = invoices.copyWith(projectId: project.id);
    await session.db.updateRow<Invoices>(
      $invoices,
      columns: [Invoices.t.projectId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Invoices] and the given [InvoiceDetail]
  /// by setting the [InvoiceDetail]'s foreign key `invoiceId` to refer to this [Invoices].
  Future<void> detalles(
    _i1.Session session,
    Invoices invoices,
    _i2.InvoiceDetail invoiceDetail, {
    _i1.Transaction? transaction,
  }) async {
    if (invoiceDetail.id == null) {
      throw ArgumentError.notNull('invoiceDetail.id');
    }
    if (invoices.id == null) {
      throw ArgumentError.notNull('invoices.id');
    }

    var $invoiceDetail = invoiceDetail.copyWith(invoiceId: invoices.id);
    await session.db.updateRow<_i2.InvoiceDetail>(
      $invoiceDetail,
      columns: [_i2.InvoiceDetail.t.invoiceId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Invoices] and the given [Pago]
  /// by setting the [Pago]'s foreign key `invoiceId` to refer to this [Invoices].
  Future<void> pagos(
    _i1.Session session,
    Invoices invoices,
    _i3.Pago pago, {
    _i1.Transaction? transaction,
  }) async {
    if (pago.id == null) {
      throw ArgumentError.notNull('pago.id');
    }
    if (invoices.id == null) {
      throw ArgumentError.notNull('invoices.id');
    }

    var $pago = pago.copyWith(invoiceId: invoices.id);
    await session.db.updateRow<_i3.Pago>(
      $pago,
      columns: [_i3.Pago.t.invoiceId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Invoices] and the given [InvoiceInfoAdicional]
  /// by setting the [InvoiceInfoAdicional]'s foreign key `invoiceId` to refer to this [Invoices].
  Future<void> infoAdicional(
    _i1.Session session,
    Invoices invoices,
    _i4.InvoiceInfoAdicional invoiceInfoAdicional, {
    _i1.Transaction? transaction,
  }) async {
    if (invoiceInfoAdicional.id == null) {
      throw ArgumentError.notNull('invoiceInfoAdicional.id');
    }
    if (invoices.id == null) {
      throw ArgumentError.notNull('invoices.id');
    }

    var $invoiceInfoAdicional =
        invoiceInfoAdicional.copyWith(invoiceId: invoices.id);
    await session.db.updateRow<_i4.InvoiceInfoAdicional>(
      $invoiceInfoAdicional,
      columns: [_i4.InvoiceInfoAdicional.t.invoiceId],
      transaction: transaction,
    );
  }
}

class InvoicesDetachRepository {
  const InvoicesDetachRepository._();

  /// Detaches the relation between this [Invoices] and the given [Pago]
  /// by setting the [Pago]'s foreign key `invoiceId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> pagos(
    _i1.Session session,
    List<_i3.Pago> pago, {
    _i1.Transaction? transaction,
  }) async {
    if (pago.any((e) => e.id == null)) {
      throw ArgumentError.notNull('pago.id');
    }

    var $pago = pago.map((e) => e.copyWith(invoiceId: null)).toList();
    await session.db.update<_i3.Pago>(
      $pago,
      columns: [_i3.Pago.t.invoiceId],
      transaction: transaction,
    );
  }
}

class InvoicesDetachRowRepository {
  const InvoicesDetachRowRepository._();

  /// Detaches the relation between this [Invoices] and the given [Pago]
  /// by setting the [Pago]'s foreign key `invoiceId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> pagos(
    _i1.Session session,
    _i3.Pago pago, {
    _i1.Transaction? transaction,
  }) async {
    if (pago.id == null) {
      throw ArgumentError.notNull('pago.id');
    }

    var $pago = pago.copyWith(invoiceId: null);
    await session.db.updateRow<_i3.Pago>(
      $pago,
      columns: [_i3.Pago.t.invoiceId],
      transaction: transaction,
    );
  }
}
