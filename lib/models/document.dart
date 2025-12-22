import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class Document {
  Document(
      this.id,
      this.number,
      this.date,
      this.name,
      this.signer,
      this.receiver,
      this.quantity,
      this.note,
      this.keyword,
      this.boxId,
      this.warehouseId);
  final int id;
  final String number;
  final String date;
  final String name;
  final String signer;
  final String receiver;
  final String quantity;
  final String note;
  final String keyword;
  final String boxId;
  final String warehouseId;

  DataGridRow getDataGridRow() {
    return DataGridRow(cells: [
      DataGridCell<int>(columnName: "id", value: id),
      DataGridCell<String>(columnName: "Số văn bản", value: number),
      DataGridCell<String>(columnName: "Ngày văn bản", value: date),
      DataGridCell<String>(columnName: "Tên văn bản", value: name),
      DataGridCell<String>(columnName: "Người ký", value: signer),
      DataGridCell<String>(columnName: "Nơi nhận", value: receiver),
      DataGridCell<String>(columnName: "Số lượng", value: quantity),
      DataGridCell<String>(columnName: "Ghi chú", value: note),
      // DataGridCell<String>(columnName: "Từ khóa", value: keyword),
      // DataGridCell<String>(columnName: "Mã thùng", value: boxId),
      // DataGridCell<String>(columnName: "Mã kho", value: warehouseId)
    ]);
  }
}
