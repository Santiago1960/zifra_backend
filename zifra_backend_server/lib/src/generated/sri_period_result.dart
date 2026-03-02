/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class SriPeriodResult
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  SriPeriodResult._({
    required this.year,
    required this.month,
    required this.descargadas,
    required this.duplicadas,
    required this.errores,
  });

  factory SriPeriodResult({
    required int year,
    required int month,
    required int descargadas,
    required int duplicadas,
    required int errores,
  }) = _SriPeriodResultImpl;

  factory SriPeriodResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return SriPeriodResult(
      year: jsonSerialization['year'] as int,
      month: jsonSerialization['month'] as int,
      descargadas: jsonSerialization['descargadas'] as int,
      duplicadas: jsonSerialization['duplicadas'] as int,
      errores: jsonSerialization['errores'] as int,
    );
  }

  int year;

  int month;

  int descargadas;

  int duplicadas;

  int errores;

  /// Returns a shallow copy of this [SriPeriodResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SriPeriodResult copyWith({
    int? year,
    int? month,
    int? descargadas,
    int? duplicadas,
    int? errores,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'month': month,
      'descargadas': descargadas,
      'duplicadas': duplicadas,
      'errores': errores,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'year': year,
      'month': month,
      'descargadas': descargadas,
      'duplicadas': duplicadas,
      'errores': errores,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _SriPeriodResultImpl extends SriPeriodResult {
  _SriPeriodResultImpl({
    required int year,
    required int month,
    required int descargadas,
    required int duplicadas,
    required int errores,
  }) : super._(
          year: year,
          month: month,
          descargadas: descargadas,
          duplicadas: duplicadas,
          errores: errores,
        );

  /// Returns a shallow copy of this [SriPeriodResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SriPeriodResult copyWith({
    int? year,
    int? month,
    int? descargadas,
    int? duplicadas,
    int? errores,
  }) {
    return SriPeriodResult(
      year: year ?? this.year,
      month: month ?? this.month,
      descargadas: descargadas ?? this.descargadas,
      duplicadas: duplicadas ?? this.duplicadas,
      errores: errores ?? this.errores,
    );
  }
}
