import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class IncomingDispatch {
  IncomingDispatch(
      this.id,
      this.receiveDate,
      this.number,
      this.sender,
      this.symNumber,
      this.docDate,
      this.name,
      this.receiver,
      this.note,
      this.boxId,
      this.warehouseId);
  final int id;
  final String receiveDate;
  final String number;
  final String sender;
  final String symNumber;
  final String docDate;
  final String name;
  final String receiver;
  final String note;
  final String boxId;
  final String warehouseId;

  DataGridRow getDataGridRow() {
    return DataGridRow(cells: [
      DataGridCell<int>(columnName: "id", value: id),
      DataGridCell<String>(columnName: "Ngày nhận", value: receiveDate),
      DataGridCell<String>(columnName: "Số văn bản", value: number),
      DataGridCell<String>(columnName: "Người gửi", value: sender),
      DataGridCell<String>(columnName: "Số ký hiệu", value: symNumber),
      DataGridCell<String>(columnName: "Ngày văn bản", value: docDate),
      DataGridCell<String>(columnName: "Tên văn bản", value: name),
      DataGridCell<String>(columnName: "Nơi nhận", value: receiver),
      // DataGridCell<String>(columnName: "Ghi chú", value: note),
      // DataGridCell<String>(columnName: "Từ khóa", value: keyword),
      // DataGridCell<String>(columnName: "Mã thùng", value: boxId),
      // DataGridCell<String>(columnName: "Mã kho", value: warehouseId)
    ]);
  }
}
