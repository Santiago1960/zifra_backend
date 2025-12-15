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

abstract class InvoiceInfoAdicional implements _i1.SerializableModel {
  InvoiceInfoAdicional._({
    this.id,
    required this.clave,
    required this.valor,
    required this.invoiceId,
    this.invoice,
  });

  factory InvoiceInfoAdicional({
    int? id,
    required String clave,
    required String valor,
    required int invoiceId,
    _i2.Invoices? invoice,
  }) = _InvoiceInfoAdicionalImpl;

  factory InvoiceInfoAdicional.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return InvoiceInfoAdicional(
      id: jsonSerialization['id'] as int?,
      clave: jsonSerialization['clave'] as String,
      valor: jsonSerialization['valor'] as String,
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

  String clave;

  String valor;

  int invoiceId;

  _i2.Invoices? invoice;

  /// Returns a shallow copy of this [InvoiceInfoAdicional]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  InvoiceInfoAdicional copyWith({
    int? id,
    String? clave,
    String? valor,
    int? invoiceId,
    _i2.Invoices? invoice,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'clave': clave,
      'valor': valor,
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

class _InvoiceInfoAdicionalImpl extends InvoiceInfoAdicional {
  _InvoiceInfoAdicionalImpl({
    int? id,
    required String clave,
    required String valor,
    required int invoiceId,
    _i2.Invoices? invoice,
  }) : super._(
          id: id,
          clave: clave,
          valor: valor,
          invoiceId: invoiceId,
          invoice: invoice,
        );

  /// Returns a shallow copy of this [InvoiceInfoAdicional]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  InvoiceInfoAdicional copyWith({
    Object? id = _Undefined,
    String? clave,
    String? valor,
    int? invoiceId,
    Object? invoice = _Undefined,
  }) {
    return InvoiceInfoAdicional(
      id: id is int? ? id : this.id,
      clave: clave ?? this.clave,
      valor: valor ?? this.valor,
      invoiceId: invoiceId ?? this.invoiceId,
      invoice: invoice is _i2.Invoices? ? invoice : this.invoice?.copyWith(),
    );
  }
}
