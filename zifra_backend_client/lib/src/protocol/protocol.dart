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
import 'category.dart' as _i3;
import 'invoice_detail.dart' as _i4;
import 'invoice_info_adicional.dart' as _i5;
import 'invoices.dart' as _i6;
import 'pago.dart' as _i7;
import 'project_exception.dart' as _i8;
import 'projects.dart' as _i9;
import 'sri_download_result.dart' as _i10;
import 'sri_period.dart' as _i11;
import 'sri_period_result.dart' as _i12;
import 'package:zifra_backend_client/src/protocol/category.dart' as _i13;
import 'package:zifra_backend_client/src/protocol/invoices.dart' as _i14;
import 'package:zifra_backend_client/src/protocol/projects.dart' as _i15;
import 'package:zifra_backend_client/src/protocol/sri_period.dart' as _i16;
export 'greeting.dart';
export 'category.dart';
export 'invoice_detail.dart';
export 'invoice_info_adicional.dart';
export 'invoices.dart';
export 'pago.dart';
export 'project_exception.dart';
export 'projects.dart';
export 'sri_download_result.dart';
export 'sri_period.dart';
export 'sri_period_result.dart';
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
    if (t == _i3.Category) {
      return _i3.Category.fromJson(data) as T;
    }
    if (t == _i4.InvoiceDetail) {
      return _i4.InvoiceDetail.fromJson(data) as T;
    }
    if (t == _i5.InvoiceInfoAdicional) {
      return _i5.InvoiceInfoAdicional.fromJson(data) as T;
    }
    if (t == _i6.Invoices) {
      return _i6.Invoices.fromJson(data) as T;
    }
    if (t == _i7.Pago) {
      return _i7.Pago.fromJson(data) as T;
    }
    if (t == _i8.ProjectException) {
      return _i8.ProjectException.fromJson(data) as T;
    }
    if (t == _i9.Projects) {
      return _i9.Projects.fromJson(data) as T;
    }
    if (t == _i10.SriDownloadResult) {
      return _i10.SriDownloadResult.fromJson(data) as T;
    }
    if (t == _i11.SriPeriod) {
      return _i11.SriPeriod.fromJson(data) as T;
    }
    if (t == _i12.SriPeriodResult) {
      return _i12.SriPeriodResult.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Greeting?>()) {
      return (data != null ? _i2.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Category?>()) {
      return (data != null ? _i3.Category.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.InvoiceDetail?>()) {
      return (data != null ? _i4.InvoiceDetail.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.InvoiceInfoAdicional?>()) {
      return (data != null ? _i5.InvoiceInfoAdicional.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i6.Invoices?>()) {
      return (data != null ? _i6.Invoices.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Pago?>()) {
      return (data != null ? _i7.Pago.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.ProjectException?>()) {
      return (data != null ? _i8.ProjectException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Projects?>()) {
      return (data != null ? _i9.Projects.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.SriDownloadResult?>()) {
      return (data != null ? _i10.SriDownloadResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.SriPeriod?>()) {
      return (data != null ? _i11.SriPeriod.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.SriPeriodResult?>()) {
      return (data != null ? _i12.SriPeriodResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i4.InvoiceDetail>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i4.InvoiceDetail>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i7.Pago>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i7.Pago>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i5.InvoiceInfoAdicional>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i5.InvoiceInfoAdicional>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i6.Invoices>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i6.Invoices>(e)).toList()
          : null) as T;
    }
    if (t == List<_i12.SriPeriodResult>) {
      return (data as List)
          .map((e) => deserialize<_i12.SriPeriodResult>(e))
          .toList() as T;
    }
    if (t == List<_i13.Category>) {
      return (data as List).map((e) => deserialize<_i13.Category>(e)).toList()
          as T;
    }
    if (t == List<_i14.Invoices>) {
      return (data as List).map((e) => deserialize<_i14.Invoices>(e)).toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i15.Projects>) {
      return (data as List).map((e) => deserialize<_i15.Projects>(e)).toList()
          as T;
    }
    if (t == List<_i16.SriPeriod>) {
      return (data as List).map((e) => deserialize<_i16.SriPeriod>(e)).toList()
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
    if (data is _i3.Category) {
      return 'Category';
    }
    if (data is _i4.InvoiceDetail) {
      return 'InvoiceDetail';
    }
    if (data is _i5.InvoiceInfoAdicional) {
      return 'InvoiceInfoAdicional';
    }
    if (data is _i6.Invoices) {
      return 'Invoices';
    }
    if (data is _i7.Pago) {
      return 'Pago';
    }
    if (data is _i8.ProjectException) {
      return 'ProjectException';
    }
    if (data is _i9.Projects) {
      return 'Projects';
    }
    if (data is _i10.SriDownloadResult) {
      return 'SriDownloadResult';
    }
    if (data is _i11.SriPeriod) {
      return 'SriPeriod';
    }
    if (data is _i12.SriPeriodResult) {
      return 'SriPeriodResult';
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
    if (dataClassName == 'Category') {
      return deserialize<_i3.Category>(data['data']);
    }
    if (dataClassName == 'InvoiceDetail') {
      return deserialize<_i4.InvoiceDetail>(data['data']);
    }
    if (dataClassName == 'InvoiceInfoAdicional') {
      return deserialize<_i5.InvoiceInfoAdicional>(data['data']);
    }
    if (dataClassName == 'Invoices') {
      return deserialize<_i6.Invoices>(data['data']);
    }
    if (dataClassName == 'Pago') {
      return deserialize<_i7.Pago>(data['data']);
    }
    if (dataClassName == 'ProjectException') {
      return deserialize<_i8.ProjectException>(data['data']);
    }
    if (dataClassName == 'Projects') {
      return deserialize<_i9.Projects>(data['data']);
    }
    if (dataClassName == 'SriDownloadResult') {
      return deserialize<_i10.SriDownloadResult>(data['data']);
    }
    if (dataClassName == 'SriPeriod') {
      return deserialize<_i11.SriPeriod>(data['data']);
    }
    if (dataClassName == 'SriPeriodResult') {
      return deserialize<_i12.SriPeriodResult>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
