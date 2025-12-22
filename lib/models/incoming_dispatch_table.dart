import 'package:drift/drift.dart';

class IncomingDispatchs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get receiveDate => text().nullable()();
  TextColumn get number => text().nullable()();
  TextColumn get sender => text().nullable()();
  TextColumn get symNumber => text().nullable()();
  TextColumn get docDate => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get receiver => text().nullable()();
  TextColumn get note => text().nullable()();
  TextColumn get boxId => text().nullable()();
  TextColumn get warehouseId => text().nullable()();
}
