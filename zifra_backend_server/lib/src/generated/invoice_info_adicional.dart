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

abstract class InvoiceInfoAdicional
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = InvoiceInfoAdicionalTable();

  static const db = InvoiceInfoAdicionalRepository._();

  @override
  int? id;

  String clave;

  String valor;

  int invoiceId;

  _i2.Invoices? invoice;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'clave': clave,
      'valor': valor,
      'invoiceId': invoiceId,
      if (invoice != null) 'invoice': invoice?.toJsonForProtocol(),
    };
  }

  static InvoiceInfoAdicionalInclude include({_i2.InvoicesInclude? invoice}) {
    return InvoiceInfoAdicionalInclude._(invoice: invoice);
  }

  static InvoiceInfoAdicionalIncludeList includeList({
    _i1.WhereExpressionBuilder<InvoiceInfoAdicionalTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<InvoiceInfoAdicionalTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<InvoiceInfoAdicionalTable>? orderByList,
    InvoiceInfoAdicionalInclude? include,
  }) {
    return InvoiceInfoAdicionalIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(InvoiceInfoAdicional.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(InvoiceInfoAdicional.t),
      include: include,
    );
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

class InvoiceInfoAdicionalTable extends _i1.Table<int?> {
  InvoiceInfoAdicionalTable({super.tableRelation})
      : super(tableName: 'invoice_info_adicional') {
    clave = _i1.ColumnString(
      'clave',
      this,
    );
    valor = _i1.ColumnString(
      'valor',
      this,
    );
    invoiceId = _i1.ColumnInt(
      'invoiceId',
      this,
    );
  }

  late final _i1.ColumnString clave;

  late final _i1.ColumnString valor;

  late final _i1.ColumnInt invoiceId;

  _i2.InvoicesTable? _invoice;

  _i2.InvoicesTable get invoice {
    if (_invoice != null) return _invoice!;
    _invoice = _i1.createRelationTable(
      relationFieldName: 'invoice',
      field: InvoiceInfoAdicional.t.invoiceId,
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
        clave,
        valor,
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

class InvoiceInfoAdicionalInclude extends _i1.IncludeObject {
  InvoiceInfoAdicionalInclude._({_i2.InvoicesInclude? invoice}) {
    _invoice = invoice;
  }

  _i2.InvoicesInclude? _invoice;

  @override
  Map<String, _i1.Include?> get includes => {'invoice': _invoice};

  @override
  _i1.Table<int?> get table => InvoiceInfoAdicional.t;
}

class InvoiceInfoAdicionalIncludeList extends _i1.IncludeList {
  InvoiceInfoAdicionalIncludeList._({
    _i1.WhereExpressionBuilder<InvoiceInfoAdicionalTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(InvoiceInfoAdicional.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => InvoiceInfoAdicional.t;
}

class InvoiceInfoAdicionalRepository {
  const InvoiceInfoAdicionalRepository._();

  final attachRow = const InvoiceInfoAdicionalAttachRowRepository._();

  /// Returns a list of [InvoiceInfoAdicional]s matching the given query parameters.
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
  Future<List<InvoiceInfoAdicional>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<InvoiceInfoAdicionalTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<InvoiceInfoAdicionalTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<InvoiceInfoAdicionalTable>? orderByList,
    _i1.Transaction? transaction,
    InvoiceInfoAdicionalInclude? include,
  }) async {
    return session.db.find<InvoiceInfoAdicional>(
      where: where?.call(InvoiceInfoAdicional.t),
      orderBy: orderBy?.call(InvoiceInfoAdicional.t),
      orderByList: orderByList?.call(InvoiceInfoAdicional.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [InvoiceInfoAdicional] matching the given query parameters.
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
  Future<InvoiceInfoAdicional?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<InvoiceInfoAdicionalTable>? where,
    int? offset,
    _i1.OrderByBuilder<InvoiceInfoAdicionalTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<InvoiceInfoAdicionalTable>? orderByList,
    _i1.Transaction? transaction,
    InvoiceInfoAdicionalInclude? include,
  }) async {
    return session.db.findFirstRow<InvoiceInfoAdicional>(
      where: where?.call(InvoiceInfoAdicional.t),
      orderBy: orderBy?.call(InvoiceInfoAdicional.t),
      orderByList: orderByList?.call(InvoiceInfoAdicional.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [InvoiceInfoAdicional] by its [id] or null if no such row exists.
  Future<InvoiceInfoAdicional?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    InvoiceInfoAdicionalInclude? include,
  }) async {
    return session.db.findById<InvoiceInfoAdicional>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [InvoiceInfoAdicional]s in the list and returns the inserted rows.
  ///
  /// The returned [InvoiceInfoAdicional]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<InvoiceInfoAdicional>> insert(
    _i1.Session session,
    List<InvoiceInfoAdicional> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<InvoiceInfoAdicional>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [InvoiceInfoAdicional] and returns the inserted row.
  ///
  /// The returned [InvoiceInfoAdicional] will have its `id` field set.
  Future<InvoiceInfoAdicional> insertRow(
    _i1.Session session,
    InvoiceInfoAdicional row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<InvoiceInfoAdicional>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [InvoiceInfoAdicional]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<InvoiceInfoAdicional>> update(
    _i1.Session session,
    List<InvoiceInfoAdicional> rows, {
    _i1.ColumnSelections<InvoiceInfoAdicionalTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<InvoiceInfoAdicional>(
      rows,
      columns: columns?.call(InvoiceInfoAdicional.t),
      transaction: transaction,
    );
  }

  /// Updates a single [InvoiceInfoAdicional]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<InvoiceInfoAdicional> updateRow(
    _i1.Session session,
    InvoiceInfoAdicional row, {
    _i1.ColumnSelections<InvoiceInfoAdicionalTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<InvoiceInfoAdicional>(
      row,
      columns: columns?.call(InvoiceInfoAdicional.t),
      transaction: transaction,
    );
  }

  /// Deletes all [InvoiceInfoAdicional]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<InvoiceInfoAdicional>> delete(
    _i1.Session session,
    List<InvoiceInfoAdicional> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<InvoiceInfoAdicional>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [InvoiceInfoAdicional].
  Future<InvoiceInfoAdicional> deleteRow(
    _i1.Session session,
    InvoiceInfoAdicional row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<InvoiceInfoAdicional>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<InvoiceInfoAdicional>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<InvoiceInfoAdicionalTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<InvoiceInfoAdicional>(
      where: where(InvoiceInfoAdicional.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<InvoiceInfoAdicionalTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<InvoiceInfoAdicional>(
      where: where?.call(InvoiceInfoAdicional.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class InvoiceInfoAdicionalAttachRowRepository {
  const InvoiceInfoAdicionalAttachRowRepository._();

  /// Creates a relation between the given [InvoiceInfoAdicional] and [Invoices]
  /// by setting the [InvoiceInfoAdicional]'s foreign key `invoiceId` to refer to the [Invoices].
  Future<void> invoice(
    _i1.Session session,
    InvoiceInfoAdicional invoiceInfoAdicional,
    _i2.Invoices invoice, {
    _i1.Transaction? transaction,
  }) async {
    if (invoiceInfoAdicional.id == null) {
      throw ArgumentError.notNull('invoiceInfoAdicional.id');
    }
    if (invoice.id == null) {
      throw ArgumentError.notNull('invoice.id');
    }

    var $invoiceInfoAdicional =
        invoiceInfoAdicional.copyWith(invoiceId: invoice.id);
    await session.db.updateRow<InvoiceInfoAdicional>(
      $invoiceInfoAdicional,
      columns: [InvoiceInfoAdicional.t.invoiceId],
      transaction: transaction,
    );
  }
}
