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

abstract class SriPeriod
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  SriPeriod._({
    required this.year,
    required this.month,
  });

  factory SriPeriod({
    required int year,
    required int month,
  }) = _SriPeriodImpl;

  factory SriPeriod.fromJson(Map<String, dynamic> jsonSerialization) {
    return SriPeriod(
      year: jsonSerialization['year'] as int,
      month: jsonSerialization['month'] as int,
    );
  }

  int year;

  int month;

  /// Returns a shallow copy of this [SriPeriod]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SriPeriod copyWith({
    int? year,
    int? month,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'month': month,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'year': year,
      'month': month,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _SriPeriodImpl extends SriPeriod {
  _SriPeriodImpl({
    required int year,
    required int month,
  }) : super._(
          year: year,
          month: month,
        );

  /// Returns a shallow copy of this [SriPeriod]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SriPeriod copyWith({
    int? year,
    int? month,
  }) {
    return SriPeriod(
      year: year ?? this.year,
      month: month ?? this.month,
    );
  }
}
