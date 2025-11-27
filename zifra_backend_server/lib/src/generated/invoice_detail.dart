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

abstract class InvoiceDetail
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  InvoiceDetail._({
    this.id,
    required this.invoiceId,
    this.invoice,
    required this.codigoPrincipal,
    required this.descripcion,
    required this.cantidad,
    required this.precioUnitario,
    required this.descuento,
    required this.precioTotalSinImpuesto,
  });

  factory InvoiceDetail({
    int? id,
    required int invoiceId,
    _i2.Invoices? invoice,
    required String codigoPrincipal,
    required String descripcion,
    required double cantidad,
    required double precioUnitario,
    required double descuento,
    required double precioTotalSinImpuesto,
  }) = _InvoiceDetailImpl;

  factory InvoiceDetail.fromJson(Map<String, dynamic> jsonSerialization) {
    return InvoiceDetail(
      id: jsonSerialization['id'] as int?,
      invoiceId: jsonSerialization['invoiceId'] as int,
      invoice: jsonSerialization['invoice'] == null
          ? null
          : _i2.Invoices.fromJson(
              (jsonSerialization['invoice'] as Map<String, dynamic>)),
      codigoPrincipal: jsonSerialization['codigoPrincipal'] as String,
      descripcion: jsonSerialization['descripcion'] as String,
      cantidad: (jsonSerialization['cantidad'] as num).toDouble(),
      precioUnitario: (jsonSerialization['precioUnitario'] as num).toDouble(),
      descuento: (jsonSerialization['descuento'] as num).toDouble(),
      precioTotalSinImpuesto:
          (jsonSerialization['precioTotalSinImpuesto'] as num).toDouble(),
    );
  }

  static final t = InvoiceDetailTable();

  static const db = InvoiceDetailRepository._();

  @override
  int? id;

  int invoiceId;

  _i2.Invoices? invoice;

  String codigoPrincipal;

  String descripcion;

  double cantidad;

  double precioUnitario;

  double descuento;

  double precioTotalSinImpuesto;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [InvoiceDetail]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  InvoiceDetail copyWith({
    int? id,
    int? invoiceId,
    _i2.Invoices? invoice,
    String? codigoPrincipal,
    String? descripcion,
    double? cantidad,
    double? precioUnitario,
    double? descuento,
    double? precioTotalSinImpuesto,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'invoiceId': invoiceId,
      if (invoice != null) 'invoice': invoice?.toJson(),
      'codigoPrincipal': codigoPrincipal,
      'descripcion': descripcion,
      'cantidad': cantidad,
      'precioUnitario': precioUnitario,
      'descuento': descuento,
      'precioTotalSinImpuesto': precioTotalSinImpuesto,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'invoiceId': invoiceId,
      if (invoice != null) 'invoice': invoice?.toJsonForProtocol(),
      'codigoPrincipal': codigoPrincipal,
      'descripcion': descripcion,
      'cantidad': cantidad,
      'precioUnitario': precioUnitario,
      'descuento': descuento,
      'precioTotalSinImpuesto': precioTotalSinImpuesto,
    };
  }

  static InvoiceDetailInclude include({_i2.InvoicesInclude? invoice}) {
    return InvoiceDetailInclude._(invoice: invoice);
  }

  static InvoiceDetailIncludeList includeList({
    _i1.WhereExpressionBuilder<InvoiceDetailTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<InvoiceDetailTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<InvoiceDetailTable>? orderByList,
    InvoiceDetailInclude? include,
  }) {
    return InvoiceDetailIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(InvoiceDetail.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(InvoiceDetail.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _InvoiceDetailImpl extends InvoiceDetail {
  _InvoiceDetailImpl({
    int? id,
    required int invoiceId,
    _i2.Invoices? invoice,
    required String codigoPrincipal,
    required String descripcion,
    required double cantidad,
    required double precioUnitario,
    required double descuento,
    required double precioTotalSinImpuesto,
  }) : super._(
          id: id,
          invoiceId: invoiceId,
          invoice: invoice,
          codigoPrincipal: codigoPrincipal,
          descripcion: descripcion,
          cantidad: cantidad,
          precioUnitario: precioUnitario,
          descuento: descuento,
          precioTotalSinImpuesto: precioTotalSinImpuesto,
        );

  /// Returns a shallow copy of this [InvoiceDetail]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  InvoiceDetail copyWith({
    Object? id = _Undefined,
    int? invoiceId,
    Object? invoice = _Undefined,
    String? codigoPrincipal,
    String? descripcion,
    double? cantidad,
    double? precioUnitario,
    double? descuento,
    double? precioTotalSinImpuesto,
  }) {
    return InvoiceDetail(
      id: id is int? ? id : this.id,
      invoiceId: invoiceId ?? this.invoiceId,
      invoice: invoice is _i2.Invoices? ? invoice : this.invoice?.copyWith(),
      codigoPrincipal: codigoPrincipal ?? this.codigoPrincipal,
      descripcion: descripcion ?? this.descripcion,
      cantidad: cantidad ?? this.cantidad,
      precioUnitario: precioUnitario ?? this.precioUnitario,
      descuento: descuento ?? this.descuento,
      precioTotalSinImpuesto:
          precioTotalSinImpuesto ?? this.precioTotalSinImpuesto,
    );
  }
}

class InvoiceDetailTable extends _i1.Table<int?> {
  InvoiceDetailTable({super.tableRelation})
      : super(tableName: 'invoice_detail') {
    invoiceId = _i1.ColumnInt(
      'invoiceId',
      this,
    );
    codigoPrincipal = _i1.ColumnString(
      'codigoPrincipal',
      this,
    );
    descripcion = _i1.ColumnString(
      'descripcion',
      this,
    );
    cantidad = _i1.ColumnDouble(
      'cantidad',
      this,
    );
    precioUnitario = _i1.ColumnDouble(
      'precioUnitario',
      this,
    );
    descuento = _i1.ColumnDouble(
      'descuento',
      this,
    );
    precioTotalSinImpuesto = _i1.ColumnDouble(
      'precioTotalSinImpuesto',
      this,
    );
  }

  late final _i1.ColumnInt invoiceId;

  _i2.InvoicesTable? _invoice;

  late final _i1.ColumnString codigoPrincipal;

  late final _i1.ColumnString descripcion;

  late final _i1.ColumnDouble cantidad;

  late final _i1.ColumnDouble precioUnitario;

  late final _i1.ColumnDouble descuento;

  late final _i1.ColumnDouble precioTotalSinImpuesto;

  _i2.InvoicesTable get invoice {
    if (_invoice != null) return _invoice!;
    _invoice = _i1.createRelationTable(
      relationFieldName: 'invoice',
      field: InvoiceDetail.t.invoiceId,
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
        invoiceId,
        codigoPrincipal,
        descripcion,
        cantidad,
        precioUnitario,
        descuento,
        precioTotalSinImpuesto,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'invoice') {
      return invoice;
    }
    return null;
  }
}

class InvoiceDetailInclude extends _i1.IncludeObject {
  InvoiceDetailInclude._({_i2.InvoicesInclude? invoice}) {
    _invoice = invoice;
  }

  _i2.InvoicesInclude? _invoice;

  @override
  Map<String, _i1.Include?> get includes => {'invoice': _invoice};

  @override
  _i1.Table<int?> get table => InvoiceDetail.t;
}

class InvoiceDetailIncludeList extends _i1.IncludeList {
  InvoiceDetailIncludeList._({
    _i1.WhereExpressionBuilder<InvoiceDetailTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(InvoiceDetail.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => InvoiceDetail.t;
}

class InvoiceDetailRepository {
  const InvoiceDetailRepository._();

  final attachRow = const InvoiceDetailAttachRowRepository._();

  /// Returns a list of [InvoiceDetail]s matching the given query parameters.
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
  Future<List<InvoiceDetail>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<InvoiceDetailTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<InvoiceDetailTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<InvoiceDetailTable>? orderByList,
    _i1.Transaction? transaction,
    InvoiceDetailInclude? include,
  }) async {
    return session.db.find<InvoiceDetail>(
      where: where?.call(InvoiceDetail.t),
      orderBy: orderBy?.call(InvoiceDetail.t),
      orderByList: orderByList?.call(InvoiceDetail.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [InvoiceDetail] matching the given query parameters.
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
  Future<InvoiceDetail?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<InvoiceDetailTable>? where,
    int? offset,
    _i1.OrderByBuilder<InvoiceDetailTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<InvoiceDetailTable>? orderByList,
    _i1.Transaction? transaction,
    InvoiceDetailInclude? include,
  }) async {
    return session.db.findFirstRow<InvoiceDetail>(
      where: where?.call(InvoiceDetail.t),
      orderBy: orderBy?.call(InvoiceDetail.t),
      orderByList: orderByList?.call(InvoiceDetail.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [InvoiceDetail] by its [id] or null if no such row exists.
  Future<InvoiceDetail?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    InvoiceDetailInclude? include,
  }) async {
    return session.db.findById<InvoiceDetail>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [InvoiceDetail]s in the list and returns the inserted rows.
  ///
  /// The returned [InvoiceDetail]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<InvoiceDetail>> insert(
    _i1.Session session,
    List<InvoiceDetail> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<InvoiceDetail>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [InvoiceDetail] and returns the inserted row.
  ///
  /// The returned [InvoiceDetail] will have its `id` field set.
  Future<InvoiceDetail> insertRow(
    _i1.Session session,
    InvoiceDetail row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<InvoiceDetail>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [InvoiceDetail]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<InvoiceDetail>> update(
    _i1.Session session,
    List<InvoiceDetail> rows, {
    _i1.ColumnSelections<InvoiceDetailTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<InvoiceDetail>(
      rows,
      columns: columns?.call(InvoiceDetail.t),
      transaction: transaction,
    );
  }

  /// Updates a single [InvoiceDetail]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<InvoiceDetail> updateRow(
    _i1.Session session,
    InvoiceDetail row, {
    _i1.ColumnSelections<InvoiceDetailTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<InvoiceDetail>(
      row,
      columns: columns?.call(InvoiceDetail.t),
      transaction: transaction,
    );
  }

  /// Deletes all [InvoiceDetail]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<InvoiceDetail>> delete(
    _i1.Session session,
    List<InvoiceDetail> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<InvoiceDetail>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [InvoiceDetail].
  Future<InvoiceDetail> deleteRow(
    _i1.Session session,
    InvoiceDetail row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<InvoiceDetail>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<InvoiceDetail>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<InvoiceDetailTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<InvoiceDetail>(
      where: where(InvoiceDetail.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<InvoiceDetailTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<InvoiceDetail>(
      where: where?.call(InvoiceDetail.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class InvoiceDetailAttachRowRepository {
  const InvoiceDetailAttachRowRepository._();

  /// Creates a relation between the given [InvoiceDetail] and [Invoices]
  /// by setting the [InvoiceDetail]'s foreign key `invoiceId` to refer to the [Invoices].
  Future<void> invoice(
    _i1.Session session,
    InvoiceDetail invoiceDetail,
    _i2.Invoices invoice, {
    _i1.Transaction? transaction,
  }) async {
    if (invoiceDetail.id == null) {
      throw ArgumentError.notNull('invoiceDetail.id');
    }
    if (invoice.id == null) {
      throw ArgumentError.notNull('invoice.id');
    }

    var $invoiceDetail = invoiceDetail.copyWith(invoiceId: invoice.id);
    await session.db.updateRow<InvoiceDetail>(
      $invoiceDetail,
      columns: [InvoiceDetail.t.invoiceId],
      transaction: transaction,
    );
  }
}
