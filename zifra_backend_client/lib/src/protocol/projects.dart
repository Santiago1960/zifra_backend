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

abstract class Projects implements _i1.SerializableModel {
  Projects._({
    this.id,
    required this.cliente,
    required this.nombre,
    required this.fechaCreacion,
    required this.isClosed,
    this.rucBeneficiario,
    this.invoices,
  });

  factory Projects({
    int? id,
    required String cliente,
    required String nombre,
    required DateTime fechaCreacion,
    required bool isClosed,
    String? rucBeneficiario,
    List<_i2.Invoices>? invoices,
  }) = _ProjectsImpl;

  factory Projects.fromJson(Map<String, dynamic> jsonSerialization) {
    return Projects(
      id: jsonSerialization['id'] as int?,
      cliente: jsonSerialization['cliente'] as String,
      nombre: jsonSerialization['nombre'] as String,
      fechaCreacion: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['fechaCreacion']),
      isClosed: jsonSerialization['isClosed'] as bool,
      rucBeneficiario: jsonSerialization['rucBeneficiario'] as String?,
      invoices: (jsonSerialization['invoices'] as List?)
          ?.map((e) => _i2.Invoices.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String cliente;

  String nombre;

  DateTime fechaCreacion;

  bool isClosed;

  String? rucBeneficiario;

  List<_i2.Invoices>? invoices;

  /// Returns a shallow copy of this [Projects]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Projects copyWith({
    int? id,
    String? cliente,
    String? nombre,
    DateTime? fechaCreacion,
    bool? isClosed,
    String? rucBeneficiario,
    List<_i2.Invoices>? invoices,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'cliente': cliente,
      'nombre': nombre,
      'fechaCreacion': fechaCreacion.toJson(),
      'isClosed': isClosed,
      if (rucBeneficiario != null) 'rucBeneficiario': rucBeneficiario,
      if (invoices != null)
        'invoices': invoices?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProjectsImpl extends Projects {
  _ProjectsImpl({
    int? id,
    required String cliente,
    required String nombre,
    required DateTime fechaCreacion,
    required bool isClosed,
    String? rucBeneficiario,
    List<_i2.Invoices>? invoices,
  }) : super._(
          id: id,
          cliente: cliente,
          nombre: nombre,
          fechaCreacion: fechaCreacion,
          isClosed: isClosed,
          rucBeneficiario: rucBeneficiario,
          invoices: invoices,
        );

  /// Returns a shallow copy of this [Projects]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Projects copyWith({
    Object? id = _Undefined,
    String? cliente,
    String? nombre,
    DateTime? fechaCreacion,
    bool? isClosed,
    Object? rucBeneficiario = _Undefined,
    Object? invoices = _Undefined,
  }) {
    return Projects(
      id: id is int? ? id : this.id,
      cliente: cliente ?? this.cliente,
      nombre: nombre ?? this.nombre,
      fechaCreacion: fechaCreacion ?? this.fechaCreacion,
      isClosed: isClosed ?? this.isClosed,
      rucBeneficiario:
          rucBeneficiario is String? ? rucBeneficiario : this.rucBeneficiario,
      invoices: invoices is List<_i2.Invoices>?
          ? invoices
          : this.invoices?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
