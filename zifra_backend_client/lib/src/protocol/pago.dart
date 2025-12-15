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

abstract class Pago implements _i1.SerializableModel {
  Pago._({
    this.id,
    required this.formaPago,
    required this.total,
    required this.plazo,
    required this.unidadTiempo,
    required this.invoiceId,
    this.invoice,
  });

  factory Pago({
    int? id,
    required String formaPago,
    required double total,
    required double plazo,
    required String unidadTiempo,
    required int invoiceId,
    _i2.Invoices? invoice,
  }) = _PagoImpl;

  factory Pago.fromJson(Map<String, dynamic> jsonSerialization) {
    return Pago(
      id: jsonSerialization['id'] as int?,
      formaPago: jsonSerialization['formaPago'] as String,
      total: (jsonSerialization['total'] as num).toDouble(),
      plazo: (jsonSerialization['plazo'] as num).toDouble(),
      unidadTiempo: jsonSerialization['unidadTiempo'] as String,
      invoiceId: jsonSerialization['invoiceId'] as int,
      invoice: jsonSerialization['invoice'] == null
          ? null
          : _i2.Invoices.fromJson(
              (jsonSerialization['invoice'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String formaPago;

  double total;

  double plazo;

  String unidadTiempo;

  int invoiceId;

  _i2.Invoices? invoice;

  /// Returns a shallow copy of this [Pago]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Pago copyWith({
    int? id,
    String? formaPago,
    double? total,
    double? plazo,
    String? unidadTiempo,
    int? invoiceId,
    _i2.Invoices? invoice,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'formaPago': formaPago,
      'total': total,
      'plazo': plazo,
      'unidadTiempo': unidadTiempo,
      'invoiceId': invoiceId,
      if (invoice != null) 'invoice': invoice?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PagoImpl extends Pago {
  _PagoImpl({
    int? id,
    required String formaPago,
    required double total,
    required double plazo,
    required String unidadTiempo,
    required int invoiceId,
    _i2.Invoices? invoice,
  }) : super._(
          id: id,
          formaPago: formaPago,
          total: total,
          plazo: plazo,
          unidadTiempo: unidadTiempo,
          invoiceId: invoiceId,
          invoice: invoice,
        );

  /// Returns a shallow copy of this [Pago]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Pago copyWith({
    Object? id = _Undefined,
    String? formaPago,
    double? total,
    double? plazo,
    String? unidadTiempo,
    int? invoiceId,
    Object? invoice = _Undefined,
  }) {
    return Pago(
      id: id is int? ? id : this.id,
      formaPago: formaPago ?? this.formaPago,
      total: total ?? this.total,
      plazo: plazo ?? this.plazo,
      unidadTiempo: unidadTiempo ?? this.unidadTiempo,
      invoiceId: invoiceId ?? this.invoiceId,
      invoice: invoice is _i2.Invoices? ? invoice : this.invoice?.copyWith(),
    );
  }
}
