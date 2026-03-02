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
import 'sri_period_result.dart' as _i2;

abstract class SriDownloadResult
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  SriDownloadResult._({
    required this.periods,
    required this.totalDescargadas,
    required this.totalDuplicadas,
    required this.totalErrores,
  });

  factory SriDownloadResult({
    required List<_i2.SriPeriodResult> periods,
    required int totalDescargadas,
    required int totalDuplicadas,
    required int totalErrores,
  }) = _SriDownloadResultImpl;

  factory SriDownloadResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return SriDownloadResult(
      periods: (jsonSerialization['periods'] as List)
          .map((e) => _i2.SriPeriodResult.fromJson((e as Map<String, dynamic>)))
          .toList(),
      totalDescargadas: jsonSerialization['totalDescargadas'] as int,
      totalDuplicadas: jsonSerialization['totalDuplicadas'] as int,
      totalErrores: jsonSerialization['totalErrores'] as int,
    );
  }

  List<_i2.SriPeriodResult> periods;

  int totalDescargadas;

  int totalDuplicadas;

  int totalErrores;

  /// Returns a shallow copy of this [SriDownloadResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SriDownloadResult copyWith({
    List<_i2.SriPeriodResult>? periods,
    int? totalDescargadas,
    int? totalDuplicadas,
    int? totalErrores,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'periods': periods.toJson(valueToJson: (v) => v.toJson()),
      'totalDescargadas': totalDescargadas,
      'totalDuplicadas': totalDuplicadas,
      'totalErrores': totalErrores,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'periods': periods.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'totalDescargadas': totalDescargadas,
      'totalDuplicadas': totalDuplicadas,
      'totalErrores': totalErrores,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _SriDownloadResultImpl extends SriDownloadResult {
  _SriDownloadResultImpl({
    required List<_i2.SriPeriodResult> periods,
    required int totalDescargadas,
    required int totalDuplicadas,
    required int totalErrores,
  }) : super._(
          periods: periods,
          totalDescargadas: totalDescargadas,
          totalDuplicadas: totalDuplicadas,
          totalErrores: totalErrores,
        );

  /// Returns a shallow copy of this [SriDownloadResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SriDownloadResult copyWith({
    List<_i2.SriPeriodResult>? periods,
    int? totalDescargadas,
    int? totalDuplicadas,
    int? totalErrores,
  }) {
    return SriDownloadResult(
      periods: periods ?? this.periods.map((e0) => e0.copyWith()).toList(),
      totalDescargadas: totalDescargadas ?? this.totalDescargadas,
      totalDuplicadas: totalDuplicadas ?? this.totalDuplicadas,
      totalErrores: totalErrores ?? this.totalErrores,
    );
  }
}
