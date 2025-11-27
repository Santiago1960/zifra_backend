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
import 'invoices.dart' as _i2;

abstract class Projects
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = ProjectsTable();

  static const db = ProjectsRepository._();

  @override
  int? id;

  String cliente;

  String nombre;

  DateTime fechaCreacion;

  bool isClosed;

  String? rucBeneficiario;

  List<_i2.Invoices>? invoices;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'cliente': cliente,
      'nombre': nombre,
      'fechaCreacion': fechaCreacion.toJson(),
      'isClosed': isClosed,
      if (rucBeneficiario != null) 'rucBeneficiario': rucBeneficiario,
      if (invoices != null)
        'invoices': invoices?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static ProjectsInclude include({_i2.InvoicesIncludeList? invoices}) {
    return ProjectsInclude._(invoices: invoices);
  }

  static ProjectsIncludeList includeList({
    _i1.WhereExpressionBuilder<ProjectsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectsTable>? orderByList,
    ProjectsInclude? include,
  }) {
    return ProjectsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Projects.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Projects.t),
      include: include,
    );
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

class ProjectsTable extends _i1.Table<int?> {
  ProjectsTable({super.tableRelation}) : super(tableName: 'projects') {
    cliente = _i1.ColumnString(
      'cliente',
      this,
    );
    nombre = _i1.ColumnString(
      'nombre',
      this,
    );
    fechaCreacion = _i1.ColumnDateTime(
      'fechaCreacion',
      this,
    );
    isClosed = _i1.ColumnBool(
      'isClosed',
      this,
    );
    rucBeneficiario = _i1.ColumnString(
      'rucBeneficiario',
      this,
    );
  }

  late final _i1.ColumnString cliente;

  late final _i1.ColumnString nombre;

  late final _i1.ColumnDateTime fechaCreacion;

  late final _i1.ColumnBool isClosed;

  late final _i1.ColumnString rucBeneficiario;

  _i2.InvoicesTable? ___invoices;

  _i1.ManyRelation<_i2.InvoicesTable>? _invoices;

  _i2.InvoicesTable get __invoices {
    if (___invoices != null) return ___invoices!;
    ___invoices = _i1.createRelationTable(
      relationFieldName: '__invoices',
      field: Projects.t.id,
      foreignField: _i2.Invoices.t.$_projectsInvoicesProjectsId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.InvoicesTable(tableRelation: foreignTableRelation),
    );
    return ___invoices!;
  }

  _i1.ManyRelation<_i2.InvoicesTable> get invoices {
    if (_invoices != null) return _invoices!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'invoices',
      field: Projects.t.id,
      foreignField: _i2.Invoices.t.$_projectsInvoicesProjectsId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.InvoicesTable(tableRelation: foreignTableRelation),
    );
    _invoices = _i1.ManyRelation<_i2.InvoicesTable>(
      tableWithRelations: relationTable,
      table: _i2.InvoicesTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _invoices!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        cliente,
        nombre,
        fechaCreacion,
        isClosed,
        rucBeneficiario,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'invoices') {
      return __invoices;
    }
    return null;
  }
}

class ProjectsInclude extends _i1.IncludeObject {
  ProjectsInclude._({_i2.InvoicesIncludeList? invoices}) {
    _invoices = invoices;
  }

  _i2.InvoicesIncludeList? _invoices;

  @override
  Map<String, _i1.Include?> get includes => {'invoices': _invoices};

  @override
  _i1.Table<int?> get table => Projects.t;
}

class ProjectsIncludeList extends _i1.IncludeList {
  ProjectsIncludeList._({
    _i1.WhereExpressionBuilder<ProjectsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Projects.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Projects.t;
}

class ProjectsRepository {
  const ProjectsRepository._();

  final attach = const ProjectsAttachRepository._();

  final attachRow = const ProjectsAttachRowRepository._();

  final detach = const ProjectsDetachRepository._();

  final detachRow = const ProjectsDetachRowRepository._();

  /// Returns a list of [Projects]s matching the given query parameters.
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
  Future<List<Projects>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProjectsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectsTable>? orderByList,
    _i1.Transaction? transaction,
    ProjectsInclude? include,
  }) async {
    return session.db.find<Projects>(
      where: where?.call(Projects.t),
      orderBy: orderBy?.call(Projects.t),
      orderByList: orderByList?.call(Projects.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Projects] matching the given query parameters.
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
  Future<Projects?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectsTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProjectsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProjectsTable>? orderByList,
    _i1.Transaction? transaction,
    ProjectsInclude? include,
  }) async {
    return session.db.findFirstRow<Projects>(
      where: where?.call(Projects.t),
      orderBy: orderBy?.call(Projects.t),
      orderByList: orderByList?.call(Projects.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Projects] by its [id] or null if no such row exists.
  Future<Projects?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ProjectsInclude? include,
  }) async {
    return session.db.findById<Projects>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Projects]s in the list and returns the inserted rows.
  ///
  /// The returned [Projects]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Projects>> insert(
    _i1.Session session,
    List<Projects> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Projects>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Projects] and returns the inserted row.
  ///
  /// The returned [Projects] will have its `id` field set.
  Future<Projects> insertRow(
    _i1.Session session,
    Projects row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Projects>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Projects]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Projects>> update(
    _i1.Session session,
    List<Projects> rows, {
    _i1.ColumnSelections<ProjectsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Projects>(
      rows,
      columns: columns?.call(Projects.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Projects]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Projects> updateRow(
    _i1.Session session,
    Projects row, {
    _i1.ColumnSelections<ProjectsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Projects>(
      row,
      columns: columns?.call(Projects.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Projects]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Projects>> delete(
    _i1.Session session,
    List<Projects> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Projects>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Projects].
  Future<Projects> deleteRow(
    _i1.Session session,
    Projects row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Projects>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Projects>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProjectsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Projects>(
      where: where(Projects.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProjectsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Projects>(
      where: where?.call(Projects.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ProjectsAttachRepository {
  const ProjectsAttachRepository._();

  /// Creates a relation between this [Projects] and the given [Invoices]s
  /// by setting each [Invoices]'s foreign key `_projectsInvoicesProjectsId` to refer to this [Projects].
  Future<void> invoices(
    _i1.Session session,
    Projects projects,
    List<_i2.Invoices> invoices, {
    _i1.Transaction? transaction,
  }) async {
    if (invoices.any((e) => e.id == null)) {
      throw ArgumentError.notNull('invoices.id');
    }
    if (projects.id == null) {
      throw ArgumentError.notNull('projects.id');
    }

    var $invoices = invoices
        .map((e) => _i2.InvoicesImplicit(
              e,
              $_projectsInvoicesProjectsId: projects.id,
            ))
        .toList();
    await session.db.update<_i2.Invoices>(
      $invoices,
      columns: [_i2.Invoices.t.$_projectsInvoicesProjectsId],
      transaction: transaction,
    );
  }
}

class ProjectsAttachRowRepository {
  const ProjectsAttachRowRepository._();

  /// Creates a relation between this [Projects] and the given [Invoices]
  /// by setting the [Invoices]'s foreign key `_projectsInvoicesProjectsId` to refer to this [Projects].
  Future<void> invoices(
    _i1.Session session,
    Projects projects,
    _i2.Invoices invoices, {
    _i1.Transaction? transaction,
  }) async {
    if (invoices.id == null) {
      throw ArgumentError.notNull('invoices.id');
    }
    if (projects.id == null) {
      throw ArgumentError.notNull('projects.id');
    }

    var $invoices = _i2.InvoicesImplicit(
      invoices,
      $_projectsInvoicesProjectsId: projects.id,
    );
    await session.db.updateRow<_i2.Invoices>(
      $invoices,
      columns: [_i2.Invoices.t.$_projectsInvoicesProjectsId],
      transaction: transaction,
    );
  }
}

class ProjectsDetachRepository {
  const ProjectsDetachRepository._();

  /// Detaches the relation between this [Projects] and the given [Invoices]
  /// by setting the [Invoices]'s foreign key `_projectsInvoicesProjectsId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> invoices(
    _i1.Session session,
    List<_i2.Invoices> invoices, {
    _i1.Transaction? transaction,
  }) async {
    if (invoices.any((e) => e.id == null)) {
      throw ArgumentError.notNull('invoices.id');
    }

    var $invoices = invoices
        .map((e) => _i2.InvoicesImplicit(
              e,
              $_projectsInvoicesProjectsId: null,
            ))
        .toList();
    await session.db.update<_i2.Invoices>(
      $invoices,
      columns: [_i2.Invoices.t.$_projectsInvoicesProjectsId],
      transaction: transaction,
    );
  }
}

class ProjectsDetachRowRepository {
  const ProjectsDetachRowRepository._();

  /// Detaches the relation between this [Projects] and the given [Invoices]
  /// by setting the [Invoices]'s foreign key `_projectsInvoicesProjectsId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> invoices(
    _i1.Session session,
    _i2.Invoices invoices, {
    _i1.Transaction? transaction,
  }) async {
    if (invoices.id == null) {
      throw ArgumentError.notNull('invoices.id');
    }

    var $invoices = _i2.InvoicesImplicit(
      invoices,
      $_projectsInvoicesProjectsId: null,
    );
    await session.db.updateRow<_i2.Invoices>(
      $invoices,
      columns: [_i2.Invoices.t.$_projectsInvoicesProjectsId],
      transaction: transaction,
    );
  }
}
