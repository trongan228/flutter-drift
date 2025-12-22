import 'package:flutter/material.dart';
import 'package:flutter_drift/database.dart';
//import 'package:flutter_drift/models/document.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DocumentDataSource extends DataGridSource {
  /// Helps to hold the new value of all editable widgets.
  dynamic newCellValue;

  /// Helps to control the editable text in the [TextField] widget.
  TextEditingController editingController = TextEditingController();
  DocumentDataSource({required List<Document> docs}) {
    _docs = docs
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: "id", value: e.id),
              DataGridCell<String>(columnName: "Số văn bản", value: e.number),
              DataGridCell<String>(columnName: "Ngày văn bản", value: e.date),
              DataGridCell<String>(columnName: "Tên văn bản", value: e.name),
              DataGridCell<String>(columnName: "Người ký", value: e.signer),
              DataGridCell<String>(columnName: "Nơi nhận", value: e.receiver),
              DataGridCell<String>(
                  columnName: "Số thùng", value: e.warehouseId),
              DataGridCell<String>(columnName: "Ghi chú", value: e.note),
              // DataGridCell<String>(columnName: "Từ khóa", value: e.keyword),
              // DataGridCell<String>(columnName: "Mã thùng", value: e.boxId),
              // DataGridCell<String>(columnName: "Mã kho", value: e.warehouseId)
            ]))
        .toList();
  }
  List<DataGridRow> _docs = [];
  //List<Document> _documents = [];
  @override
  List<DataGridRow> get rows => _docs;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Tooltip(
        message: '${dataGridCell.value}',
        child: Container(
          alignment: (dataGridCell.columnName == 'id' ||
                  dataGridCell.columnName == 'Số văn bản')
              ? Alignment.centerRight
              : Alignment.centerLeft,
          padding: const EdgeInsets.all(16.0),
          child: Text(dataGridCell.value?.toString() ?? ""),
        ),
      );
    }).toList());
  }

  @override
  Future<void> onCellSubmit(DataGridRow dataGridRow,
      RowColumnIndex rowColumnIndex, GridColumn column) async {
    final dynamic oldValue = dataGridRow
            .getCells()
            .firstWhere((DataGridCell dataGridCell) =>
                dataGridCell.columnName == column.columnName)
            .value ??
        '';
    final int dataRowIndex = _docs.indexOf(dataGridRow);
    if (newCellValue == null || oldValue == newCellValue) {
      return;
    }
    if (column.columnName == 'Số văn bản') {
      _docs[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(
              columnName: column.columnName, value: newCellValue);
    }
    if (column.columnName == 'Ngày văn bản') {
      _docs[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(
              columnName: column.columnName, value: newCellValue);
    }
    if (column.columnName == 'Tên văn bản') {
      _docs[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(
              columnName: column.columnName, value: newCellValue);
    }
    if (column.columnName == 'Người ký') {
      _docs[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(
              columnName: column.columnName, value: newCellValue);
    }
    if (column.columnName == 'Nơi nhận') {
      _docs[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(
              columnName: column.columnName, value: newCellValue);
    }
    if (column.columnName == 'Số thùng') {
      _docs[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(
              columnName: column.columnName, value: newCellValue);
    }
    if (column.columnName == 'Ghi chú') {
      _docs[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(
              columnName: column.columnName, value: newCellValue);
    }
  }

  @override
  Widget? buildEditWidget(DataGridRow dataGridRow,
      RowColumnIndex rowColumnIndex, GridColumn column, CellSubmit submitCell) {
    final String displayText = dataGridRow
            .getCells()
            .firstWhere((DataGridCell dataGridCell) =>
                dataGridCell.columnName == column.columnName)
            .value
            ?.toString() ??
        '';
    return Container(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          autofocus: true,
          controller: editingController..text = displayText,
          textAlign:
              (column.columnName == 'id' || column.columnName == 'Số văn bản')
                  ? TextAlign.right
                  : TextAlign.left,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(0),
          ),
          onChanged: (String value) {
            newCellValue = value;
          },
          onSubmitted: (String value) {
            newCellValue = value;
            submitCell();
          },
        ));
  }
}
