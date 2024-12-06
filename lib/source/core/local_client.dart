import 'package:drift/drift.dart';
import 'package:drift_demo/source/core/database/tables/user_table.dart';

import '../models/user_model.dart';
import 'database/local_database.dart';

class LocalClient{
  final LocalDatabase db;

  LocalClient({required this.db});
  
  Future<List<T>> getAllRecords<T>({required TableInfo table}) async {
    final records = await db.select(table).get();
    return records.map((e) => e as T).toList();
  }

  Future<T?> getRecordByCondition<T>({
    required TableInfo table,
    required Expression<bool> Function(dynamic tbl) condition,
    required T Function(dynamic row) fromRow,
  }) async {
    final response = await (db.select(table)..where(condition)).getSingleOrNull();
    if (response == null) return null;
    return fromRow(response);
  }

  Future<int> addRecord<T>({
    required TableInfo table,
    required Insertable Function(T details) dataMapper,
    required T details,
  }) async {
    final data = dataMapper(details);
    final response = await db.into(table).insert(data);
    print("New record added with ID: $response");
    return response;
  }

  Future<void> updateRecord<T>({
    required TableInfo table,
    required Expression<bool> Function(dynamic tbl) condition,
    required UpdateCompanion Function(T details) dataMapper,
    required T details,
  }) async {
    final data = dataMapper(details);
    final response = await (db.update(table)..where(condition)).write(data);
    print("Record updated: $response");
  }

  Future<void> deleteRecord<T>({
    required TableInfo table,
    required Expression<bool> Function(dynamic tbl) condition,
  }) async {
    final count = await (db.delete(table)..where(condition)).go();
    print("Records deleted: $count");
  }

  Future<void> deleteAllRecords({required TableInfo table}) async {
    final count = await db.delete(table).go();
    print("All records deleted from ${table.actualTableName}: $count");
  }
}