import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_drift/models/document_table.dart';
import 'package:flutter_drift/models/incoming_dispatch_table.dart';
import 'package:flutter_drift/models/outcoming_dispatch_table.dart';
part 'database.g.dart';

// 2. Định nghĩa Database class
@DriftDatabase(tables: [Documents, IncomingDispatchs, OutcomingDispatchs])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  Future<List<Document>> pageDocumentItems() async {
    List<Document> list = await (select(documents)..limit(10000)).get();
    return list;
  }

  Future<List<Document>> getAllDocument() async {
    List<Document> list = await (select(documents)).get();
    return list;
  }

  Future<int> getMaxIdDocument() async {
    final query = selectOnly(documents)..addColumns([documents.id.max()]);
    final result = await query.getSingle();
    return result.read(documents.id.max()) ?? 0;
  }

  Future<int> getMaxIdOutcomingDispatch() async {
    final query = selectOnly(outcomingDispatchs)
      ..addColumns([outcomingDispatchs.id.max()]);
    final result = await query.getSingle();
    return result.read(outcomingDispatchs.id.max()) ?? 0;
  }

  Future<int> getMaxIdIncomingDispatch() async {
    final query = selectOnly(incomingDispatchs)
      ..addColumns([incomingDispatchs.id.max()]);
    final result = await query.getSingle();
    return result.read(incomingDispatchs.id.max()) ?? 0;
  }

  Future<void> insertAllDocument(List<Document> list) async {
    await batch((batch) {
      batch.insertAll(documents, list);
    });
  }

  Future<void> insertAllOutDispatch(List<OutcomingDispatch> list) async {
    await batch((batch) {
      batch.insertAll(outcomingDispatchs, list);
    });
  }

  Future<void> insertAllInDispatch(List<IncomingDispatch> list) async {
    await batch((batch) {
      batch.insertAll(incomingDispatchs, list);
    });
  }

  Future<List<OutcomingDispatch>> getAllOutcomingDispatch() async {
    List<OutcomingDispatch> list = await (select(outcomingDispatchs)).get();
    return list;
  }

  Future<List<IncomingDispatch>> getAllIncomingDispatch() async {
    List<IncomingDispatch> list = await (select(incomingDispatchs)).get();
    return list;
  }

  Future<List<Document>> searchDocument(String textSearch) async {
    List<Document> list = await (select(documents)
          ..where((d) => d.name.like('%$textSearch%')))
        .get();
    List<Document> list2 = await (select(documents)
          ..where((d) => d.number.like('%$textSearch%')))
        .get();

    return list + list2;
  }

  Future<List<Document>> filterDocument(int? year, String searchText) async {
    String yearStr = year == 0 || year == null ? "" : year.toString();
    if (yearStr.isEmpty && searchText.isEmpty) {
      return getAllDocument();
    }
    List<Document> list = await (select(documents)
          ..where(
              (d) => d.date.like('%$yearStr%') & d.name.like('%$searchText%')))
        .get();
    List<Document> list2 = await (select(documents)
          ..where((d) =>
              d.date.like('%$yearStr%') & d.number.like('%$searchText%')))
        .get();
    return list + list2;
  }

  Future<List<OutcomingDispatch>> filterOut(
      int? year, String searchText) async {
    String yearStr = year == 0 || year == null ? "" : year.toString();
    if (yearStr.isEmpty && searchText.isEmpty) {
      return getAllOutcomingDispatch();
    }
    List<OutcomingDispatch> list = await (select(outcomingDispatchs)
          ..where((d) =>
              d.docDate.like('%$yearStr%') & d.name.like('%$searchText%')))
        .get();
    List<OutcomingDispatch> list2 = await (select(outcomingDispatchs)
          ..where((d) =>
              d.docDate.like('%$yearStr%') & d.number.like('%$searchText%')))
        .get();
    return list + list2;
  }

  Future<List<IncomingDispatch>> filterIn(int? year, String searchText) async {
    String yearStr = year == 0 || year == null ? "" : year.toString();
    if (yearStr.isEmpty && searchText.isEmpty) {
      return getAllIncomingDispatch();
    }
    List<IncomingDispatch> list = await (select(incomingDispatchs)
          ..where((d) =>
              d.docDate.like('%$yearStr%') & d.name.like('%$searchText%')))
        .get();
    List<IncomingDispatch> list2 = await (select(incomingDispatchs)
          ..where((d) =>
              d.docDate.like('%$yearStr%') & d.number.like('%$searchText%')))
        .get();
    return list + list2;
  }

  Future updateDocument(Document document) async {
    await (update(documents)..where((d) => d.id.equals(document.id)))
        .write(DocumentsCompanion(
      number: Value(document.number),
      date: Value(document.date),
      name: Value(document.name),
      signer: Value(document.signer),
      receiver: Value(document.receiver),
      note: Value(document.note),
      boxId: Value(document.boxId),
      warehouseId: Value(document.warehouseId),
    ));
  }

  Future deleteDocumentsByIds(List<int> id) async {
    await (delete(documents)..where((d) => d.id.isIn(id))).go();
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }
}

// LazyDatabase _openConnection() {
//   return LazyDatabase(() async {
//     final dbFolder = await getApplicationSupportDirectory();
//     final file = File(p.join(dbFolder.path, 'my_database.db'));
//     return NativeDatabase(file);
//   });
// }
