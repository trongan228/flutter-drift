import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class OutcomingDispatch {
  OutcomingDispatch(this.id, this.number, this.docDate, this.name, this.signer,
      this.receiver, this.quantity, this.boxId, this.warehouseId);
  final int id;
  final String number;
  final String docDate;
  final String name;
  final String signer;
  final String receiver;
  final int quantity;
  final String boxId;
  final String warehouseId;

  DataGridRow getDataGridRow() {
    return DataGridRow(cells: [
      DataGridCell<int>(columnName: "id", value: id),
      DataGridCell<String>(columnName: "Số văn bản", value: number),
      DataGridCell<String>(columnName: "Ngày văn bản", value: docDate),
      DataGridCell<String>(columnName: "Tên văn bản", value: name),
      DataGridCell<String>(columnName: "Người ký", value: signer),
      DataGridCell<String>(columnName: "Nơi nhận", value: receiver),
      DataGridCell<int>(columnName: "Số lượng", value: quantity),
      // DataGridCell<String>(columnName: "Từ khóa", value: keyword),
      // DataGridCell<String>(columnName: "Mã thùng", value: boxId),
      // DataGridCell<String>(columnName: "Mã kho", value: warehouseId)
    ]);
  }
}
