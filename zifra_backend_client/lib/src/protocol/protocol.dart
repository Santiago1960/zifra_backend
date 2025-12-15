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
import 'greeting.dart' as _i2;
import 'invoice_detail.dart' as _i3;
import 'invoice_info_adicional.dart' as _i4;
import 'invoices.dart' as _i5;
import 'pago.dart' as _i6;
import 'project_exception.dart' as _i7;
import 'projects.dart' as _i8;
import 'package:zifra_backend_client/src/protocol/invoices.dart' as _i9;
import 'package:zifra_backend_client/src/protocol/projects.dart' as _i10;
export 'greeting.dart';
export 'invoice_detail.dart';
export 'invoice_info_adicional.dart';
export 'invoices.dart';
export 'pago.dart';
export 'project_exception.dart';
export 'projects.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Greeting) {
      return _i2.Greeting.fromJson(data) as T;
    }
    if (t == _i3.InvoiceDetail) {
      return _i3.InvoiceDetail.fromJson(data) as T;
    }
    if (t == _i4.InvoiceInfoAdicional) {
      return _i4.InvoiceInfoAdicional.fromJson(data) as T;
    }
    if (t == _i5.Invoices) {
      return _i5.Invoices.fromJson(data) as T;
    }
    if (t == _i6.Pago) {
      return _i6.Pago.fromJson(data) as T;
    }
    if (t == _i7.ProjectException) {
      return _i7.ProjectException.fromJson(data) as T;
    }
    if (t == _i8.Projects) {
      return _i8.Projects.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Greeting?>()) {
      return (data != null ? _i2.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.InvoiceDetail?>()) {
      return (data != null ? _i3.InvoiceDetail.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.InvoiceInfoAdicional?>()) {
      return (data != null ? _i4.InvoiceInfoAdicional.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i5.Invoices?>()) {
      return (data != null ? _i5.Invoices.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Pago?>()) {
      return (data != null ? _i6.Pago.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.ProjectException?>()) {
      return (data != null ? _i7.ProjectException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Projects?>()) {
      return (data != null ? _i8.Projects.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i3.InvoiceDetail>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i3.InvoiceDetail>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i6.Pago>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i6.Pago>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i4.InvoiceInfoAdicional>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i4.InvoiceInfoAdicional>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i5.Invoices>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i5.Invoices>(e)).toList()
          : null) as T;
    }
    if (t == List<_i9.Invoices>) {
      return (data as List).map((e) => deserialize<_i9.Invoices>(e)).toList()
          as T;
    }
    if (t == List<_i10.Projects>) {
      return (data as List).map((e) => deserialize<_i10.Projects>(e)).toList()
          as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Greeting) {
      return 'Greeting';
    }
    if (data is _i3.InvoiceDetail) {
      return 'InvoiceDetail';
    }
    if (data is _i4.InvoiceInfoAdicional) {
      return 'InvoiceInfoAdicional';
    }
    if (data is _i5.Invoices) {
      return 'Invoices';
    }
    if (data is _i6.Pago) {
      return 'Pago';
    }
    if (data is _i7.ProjectException) {
      return 'ProjectException';
    }
    if (data is _i8.Projects) {
      return 'Projects';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i2.Greeting>(data['data']);
    }
    if (dataClassName == 'InvoiceDetail') {
      return deserialize<_i3.InvoiceDetail>(data['data']);
    }
    if (dataClassName == 'InvoiceInfoAdicional') {
      return deserialize<_i4.InvoiceInfoAdicional>(data['data']);
    }
    if (dataClassName == 'Invoices') {
      return deserialize<_i5.Invoices>(data['data']);
    }
    if (dataClassName == 'Pago') {
      return deserialize<_i6.Pago>(data['data']);
    }
    if (dataClassName == 'ProjectException') {
      return deserialize<_i7.ProjectException>(data['data']);
    }
    if (dataClassName == 'Projects') {
      return deserialize<_i8.Projects>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
