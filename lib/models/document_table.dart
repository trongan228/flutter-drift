import 'package:drift/drift.dart';

class Documents extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get number => text()();
  TextColumn get date => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get signer => text().nullable()();
  TextColumn get receiver => text().nullable()();
  TextColumn get quantity => text().nullable()();
  TextColumn get note => text().nullable()();
  TextColumn get keyword => text().nullable()();
  TextColumn get boxId => text().nullable()();
  TextColumn get warehouseId => text().nullable()();
}
