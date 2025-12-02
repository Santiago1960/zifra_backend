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

abstract class Pago implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = PagoTable();

  static const db = PagoRepository._();

  @override
  int? id;

  String formaPago;

  double total;

  double plazo;

  String unidadTiempo;

  int invoiceId;

  _i2.Invoices? invoice;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'formaPago': formaPago,
      'total': total,
      'plazo': plazo,
      'unidadTiempo': unidadTiempo,
      'invoiceId': invoiceId,
      if (invoice != null) 'invoice': invoice?.toJsonForProtocol(),
    };
  }

  static PagoInclude include({_i2.InvoicesInclude? invoice}) {
    return PagoInclude._(invoice: invoice);
  }

  static PagoIncludeList includeList({
    _i1.WhereExpressionBuilder<PagoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PagoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PagoTable>? orderByList,
    PagoInclude? include,
  }) {
    return PagoIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Pago.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Pago.t),
      include: include,
    );
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

class PagoTable extends _i1.Table<int?> {
  PagoTable({super.tableRelation}) : super(tableName: 'pago') {
    formaPago = _i1.ColumnString(
      'formaPago',
      this,
    );
    total = _i1.ColumnDouble(
      'total',
      this,
    );
    plazo = _i1.ColumnDouble(
      'plazo',
      this,
    );
    unidadTiempo = _i1.ColumnString(
      'unidadTiempo',
      this,
    );
    invoiceId = _i1.ColumnInt(
      'invoiceId',
      this,
    );
  }

  late final _i1.ColumnString formaPago;

  late final _i1.ColumnDouble total;

  late final _i1.ColumnDouble plazo;

  late final _i1.ColumnString unidadTiempo;

  late final _i1.ColumnInt invoiceId;

  _i2.InvoicesTable? _invoice;

  _i2.InvoicesTable get invoice {
    if (_invoice != null) return _invoice!;
    _invoice = _i1.createRelationTable(
      relationFieldName: 'invoice',
      field: Pago.t.invoiceId,
      foreignField: _i2.Invoices.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.InvoicesTable(tableRelation: foreignTableRelation),
    );
    return _invoice!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        formaPago,
        total,
        plazo,
        unidadTiempo,
        invoiceId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'invoice') {
      return invoice;
    }
    return null;
  }
}

class PagoInclude extends _i1.IncludeObject {
  PagoInclude._({_i2.InvoicesInclude? invoice}) {
    _invoice = invoice;
  }

  _i2.InvoicesInclude? _invoice;

  @override
  Map<String, _i1.Include?> get includes => {'invoice': _invoice};

  @override
  _i1.Table<int?> get table => Pago.t;
}

class PagoIncludeList extends _i1.IncludeList {
  PagoIncludeList._({
    _i1.WhereExpressionBuilder<PagoTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Pago.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Pago.t;
}

class PagoRepository {
  const PagoRepository._();

  final attachRow = const PagoAttachRowRepository._();

  /// Returns a list of [Pago]s matching the given query parameters.
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
  Future<List<Pago>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PagoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PagoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PagoTable>? orderByList,
    _i1.Transaction? transaction,
    PagoInclude? include,
  }) async {
    return session.db.find<Pago>(
      where: where?.call(Pago.t),
      orderBy: orderBy?.call(Pago.t),
      orderByList: orderByList?.call(Pago.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Pago] matching the given query parameters.
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
  Future<Pago?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PagoTable>? where,
    int? offset,
    _i1.OrderByBuilder<PagoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PagoTable>? orderByList,
    _i1.Transaction? transaction,
    PagoInclude? include,
  }) async {
    return session.db.findFirstRow<Pago>(
      where: where?.call(Pago.t),
      orderBy: orderBy?.call(Pago.t),
      orderByList: orderByList?.call(Pago.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Pago] by its [id] or null if no such row exists.
  Future<Pago?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PagoInclude? include,
  }) async {
    return session.db.findById<Pago>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Pago]s in the list and returns the inserted rows.
  ///
  /// The returned [Pago]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Pago>> insert(
    _i1.Session session,
    List<Pago> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Pago>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Pago] and returns the inserted row.
  ///
  /// The returned [Pago] will have its `id` field set.
  Future<Pago> insertRow(
    _i1.Session session,
    Pago row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Pago>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Pago]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Pago>> update(
    _i1.Session session,
    List<Pago> rows, {
    _i1.ColumnSelections<PagoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Pago>(
      rows,
      columns: columns?.call(Pago.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Pago]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Pago> updateRow(
    _i1.Session session,
    Pago row, {
    _i1.ColumnSelections<PagoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Pago>(
      row,
      columns: columns?.call(Pago.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Pago]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Pago>> delete(
    _i1.Session session,
    List<Pago> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Pago>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Pago].
  Future<Pago> deleteRow(
    _i1.Session session,
    Pago row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Pago>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Pago>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PagoTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Pago>(
      where: where(Pago.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PagoTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Pago>(
      where: where?.call(Pago.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class PagoAttachRowRepository {
  const PagoAttachRowRepository._();

  /// Creates a relation between the given [Pago] and [Invoices]
  /// by setting the [Pago]'s foreign key `invoiceId` to refer to the [Invoices].
  Future<void> invoice(
    _i1.Session session,
    Pago pago,
    _i2.Invoices invoice, {
    _i1.Transaction? transaction,
  }) async {
    if (pago.id == null) {
      throw ArgumentError.notNull('pago.id');
    }
    if (invoice.id == null) {
      throw ArgumentError.notNull('invoice.id');
    }

    var $pago = pago.copyWith(invoiceId: invoice.id);
    await session.db.updateRow<Pago>(
      $pago,
      columns: [Pago.t.invoiceId],
      transaction: transaction,
    );
  }
}
