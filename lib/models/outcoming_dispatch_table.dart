import 'package:drift/drift.dart';

class OutcomingDispatchs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get number => text().nullable()();
  TextColumn get docDate => text().nullable()();
  TextColumn get name => text().nullable()();
  TextColumn get signer => text().nullable()();
  TextColumn get receiver => text().nullable()();
  IntColumn get quantity => integer().nullable()();
  TextColumn get boxId => text().nullable()();
  TextColumn get warehouseId => text().nullable()();
}
