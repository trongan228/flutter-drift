import 'package:flutter/material.dart';
import 'package:flutter_drift/database.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class IncomingDispatchDataSource extends DataGridSource {
  /// Helps to hold the new value of all editable widgets.
  dynamic newCellValue;

  /// Helps to control the editable text in the [TextField] widget.
  TextEditingController editingController = TextEditingController();
  IncomingDispatchDataSource({required List<IncomingDispatch> docs}) {
    _docs = docs
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: "id", value: e.id),
              DataGridCell<String>(
                  columnName: "Ngày nhận", value: e.receiveDate),
              DataGridCell<String>(columnName: "Số đến", value: e.number),
              DataGridCell<String>(columnName: "Nơi gửi", value: e.sender),
              DataGridCell<String>(
                  columnName: "Số ký hiệu", value: e.symNumber),

              DataGridCell<String>(
                  columnName: "Ngày văn bản", value: e.docDate),
              DataGridCell<String>(columnName: "Tên văn bản", value: e.name),
              DataGridCell<String>(columnName: "Nơi nhận", value: e.receiver),
              DataGridCell<String>(
                  columnName: "Số thùng", value: e.warehouseId),
              // DataGridCell<String>(columnName: "Mã kho", value: e.warehouseId)
            ]))
        .toList();
  }

  List<DataGridRow> _docs = [];
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
  }
}
