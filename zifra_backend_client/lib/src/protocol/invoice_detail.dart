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
import 'invoices.dart' as _i2;

abstract class InvoiceDetail implements _i1.SerializableModel {
  InvoiceDetail._({
    this.id,
    required this.invoiceId,
    this.invoice,
    required this.codigoPrincipal,
    required this.descripcion,
    required this.cantidad,
    required this.precioUnitario,
    required this.descuento,
    required this.precioTotalSinImpuesto,
  });

  factory InvoiceDetail({
    int? id,
    required int invoiceId,
    _i2.Invoices? invoice,
    required String codigoPrincipal,
    required String descripcion,
    required double cantidad,
    required double precioUnitario,
    required double descuento,
    required double precioTotalSinImpuesto,
  }) = _InvoiceDetailImpl;

  factory InvoiceDetail.fromJson(Map<String, dynamic> jsonSerialization) {
    return InvoiceDetail(
      id: jsonSerialization['id'] as int?,
      invoiceId: jsonSerialization['invoiceId'] as int,
      invoice: jsonSerialization['invoice'] == null
          ? null
          : _i2.Invoices.fromJson(
              (jsonSerialization['invoice'] as Map<String, dynamic>)),
      codigoPrincipal: jsonSerialization['codigoPrincipal'] as String,
      descripcion: jsonSerialization['descripcion'] as String,
      cantidad: (jsonSerialization['cantidad'] as num).toDouble(),
      precioUnitario: (jsonSerialization['precioUnitario'] as num).toDouble(),
      descuento: (jsonSerialization['descuento'] as num).toDouble(),
      precioTotalSinImpuesto:
          (jsonSerialization['precioTotalSinImpuesto'] as num).toDouble(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int invoiceId;

  _i2.Invoices? invoice;

  String codigoPrincipal;

  String descripcion;

  double cantidad;

  double precioUnitario;

  double descuento;

  double precioTotalSinImpuesto;

  /// Returns a shallow copy of this [InvoiceDetail]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  InvoiceDetail copyWith({
    int? id,
    int? invoiceId,
    _i2.Invoices? invoice,
    String? codigoPrincipal,
    String? descripcion,
    double? cantidad,
    double? precioUnitario,
    double? descuento,
    double? precioTotalSinImpuesto,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'invoiceId': invoiceId,
      if (invoice != null) 'invoice': invoice?.toJson(),
      'codigoPrincipal': codigoPrincipal,
      'descripcion': descripcion,
      'cantidad': cantidad,
      'precioUnitario': precioUnitario,
      'descuento': descuento,
      'precioTotalSinImpuesto': precioTotalSinImpuesto,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _InvoiceDetailImpl extends InvoiceDetail {
  _InvoiceDetailImpl({
    int? id,
    required int invoiceId,
    _i2.Invoices? invoice,
    required String codigoPrincipal,
    required String descripcion,
    required double cantidad,
    required double precioUnitario,
    required double descuento,
    required double precioTotalSinImpuesto,
  }) : super._(
          id: id,
          invoiceId: invoiceId,
          invoice: invoice,
          codigoPrincipal: codigoPrincipal,
          descripcion: descripcion,
          cantidad: cantidad,
          precioUnitario: precioUnitario,
          descuento: descuento,
          precioTotalSinImpuesto: precioTotalSinImpuesto,
        );

  /// Returns a shallow copy of this [InvoiceDetail]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  InvoiceDetail copyWith({
    Object? id = _Undefined,
    int? invoiceId,
    Object? invoice = _Undefined,
    String? codigoPrincipal,
    String? descripcion,
    double? cantidad,
    double? precioUnitario,
    double? descuento,
    double? precioTotalSinImpuesto,
  }) {
    return InvoiceDetail(
      id: id is int? ? id : this.id,
      invoiceId: invoiceId ?? this.invoiceId,
      invoice: invoice is _i2.Invoices? ? invoice : this.invoice?.copyWith(),
      codigoPrincipal: codigoPrincipal ?? this.codigoPrincipal,
      descripcion: descripcion ?? this.descripcion,
      cantidad: cantidad ?? this.cantidad,
      precioUnitario: precioUnitario ?? this.precioUnitario,
      descuento: descuento ?? this.descuento,
      precioTotalSinImpuesto:
          precioTotalSinImpuesto ?? this.precioTotalSinImpuesto,
    );
  }
}
