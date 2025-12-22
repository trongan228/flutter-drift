import 'package:drift/drift.dart' hide Column, Table;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drift/database.dart';
import 'package:flutter_drift/models/incoming_dispatch_data.dart';
import 'package:flutter_drift/models/outcoming_dispatch_data.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class IndispatchPage extends StatefulWidget {
  const IndispatchPage({super.key, required this.database});
  final AppDatabase database;
  @override
  State<IndispatchPage> createState() => _IndispatchPageState();
}

class _IndispatchPageState extends State<IndispatchPage> {
  int? selectedYear;
  final List<int> years = List.generate(20, (index) => 2010 + index);
  late IncomingDispatchDataSource _outDataSource;
  late Future<List<IncomingDispatch>> _incomingFuture;
  final TextEditingController _textSearchController = TextEditingController();

  final TextEditingController _receivedateController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _senderController = TextEditingController();
  final TextEditingController _symNumberController = TextEditingController();

  final TextEditingController _docDateController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _receiverController = TextEditingController();
  final TextEditingController _boxController = TextEditingController();
  final DataGridController _dataGridController = DataGridController();

  final _formKey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _receivedateController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _selectDocDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _docDateController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _receivedateController.text = "${DateTime.now().toLocal()}".split(' ')[0];
    _docDateController.text = "${DateTime.now().toLocal()}".split(' ')[0];
    _incomingFuture = getData();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _textSearchController.dispose();
    _docDateController.dispose();
    super.dispose();
  }

  void _updateTable() {
    setState(() {
      _incomingFuture = getData();
    });
    _dataGridController.selectedRows.clear();
  }

  void _insertDocument() {
    IncomingDispatchsCompanion incomingDispatch = IncomingDispatchsCompanion(
      receiveDate: Value(_receivedateController.text),
      number: Value(_numberController.text),
      sender: Value(_senderController.text),
      symNumber: Value(_symNumberController.text),
      docDate: Value(_docDateController.text),
      name: Value(_nameController.text),
      receiver: Value(_receiverController.text),
      boxId: Value(_boxController.text),
    );
    widget.database
        .into(widget.database.incomingDispatchs)
        .insert(incomingDispatch);
    _updateTable();
  }

  void _deleteSelectedDocuments() async {
    final selectedRows = _dataGridController.selectedRows;
    if (selectedRows.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Vui lòng chọn ít nhất một văn bản để xóa')),
      );
      return;
    }

    final idsToDelete = selectedRows.map((row) {
      final idCell =
          row.getCells().firstWhere((cell) => cell.columnName == 'id');
      return idCell.value as int;
    }).toList();
    print(idsToDelete);
    await widget.database.deleteDocumentsByIds(idsToDelete);
    _updateTable();
    _updateTable();
  }

  Future<List<IncomingDispatch>> getData() async {
    // if (_textSearchController.text.isNotEmpty) {
    //   print(_textSearchController.text);
    //   List<OutcomingDispatch> docs =
    //       await widget.database.searchDocument(_textSearchController.text);
    //   return docs;
    // }
    List<IncomingDispatch> docs =
        await widget.database.filterIn(selectedYear, _textSearchController.text);
    return docs;
  }

  Future<List<IncomingDispatch>> getDocumentByDate(DateTime selected) async {
    // if (_textSearchController.text.isNotEmpty) {
    //   print(_textSearchController.text);
    //   List<OutcomingDispatch> docs =
    //       await widget.database.searchDocument(_textSearchController.text);
    //   return docs;
    // }
    List<IncomingDispatch> docs =
        await widget.database.getAllIncomingDispatch();
    return docs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
              // width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 100,
                      child: DropdownButton<int>(
                        value: selectedYear,
                        hint: const Text("Chọn năm"),
                        items: years.map((int year) {
                          return DropdownMenuItem<int>(
                            value: year,
                            child: Text(year.toString()),
                          );
                        }).toList(),
                        onChanged: (value) =>
                            setState(() => selectedYear = value),
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 500,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Tìm kiếm theo theo số, tên,...',
                      ),
                      controller: _textSearchController,
                      onSubmitted: (value) {
                        _updateTable();
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  CupertinoButton(
                      color: Colors.red,
                      onPressed: _updateTable,
                      child: const Text(
                        "Tìm kiếm",
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(width: 10),
                  CupertinoButton(
                    color: Colors.blue,
                    child: const Text("Thêm mới",
                        style: TextStyle(color: Colors.white)),
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Thêm mới văn bản đến"),
                            content: SizedBox(
                              height: 500,
                              width: 400,
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      controller: _receivedateController,
                                      decoration: const InputDecoration(
                                        labelText: 'Ngày nhận văn bản',
                                        suffixIcon: Icon(Icons.calendar_today),
                                      ),
                                      onTap: () => _selectDate(context),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Vui lòng nhập ngày văn bản';
                                        }
                                        return null;
                                      },
                                    ),
                                    TextFormField(
                                      controller: _numberController,
                                      decoration: const InputDecoration(
                                        labelText: 'Số đến văn bản',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Vui lòng nhập số văn bản';
                                        }
                                        return null;
                                      },
                                    ),
                                    TextFormField(
                                      controller: _senderController,
                                      decoration: const InputDecoration(
                                        labelText: 'Nơi gửi',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Vui lòng nhập nơi gửi';
                                        }
                                        return null;
                                      },
                                    ),
                                    TextFormField(
                                      controller: _symNumberController,
                                      decoration: const InputDecoration(
                                        labelText: 'Số ký hiệu',
                                      ),
                                    ),
                                    TextFormField(
                                      controller: _docDateController,
                                      decoration: const InputDecoration(
                                        labelText: 'Ngày tháng văn bản',
                                        suffixIcon: Icon(Icons.calendar_today),
                                      ),
                                      onTap: () => _selectDocDate(context),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Vui lòng nhập ngày văn bản';
                                        }
                                        return null;
                                      },
                                    ),
                                    TextFormField(
                                      controller: _nameController,
                                      decoration: const InputDecoration(
                                        labelText: 'Tên văn bản',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Vui lòng nhập tên văn bản';
                                        }
                                        return null;
                                      },
                                    ),

                                    TextFormField(
                                      controller: _receiverController,
                                      decoration: const InputDecoration(
                                        labelText: 'Đơn vị nhận nhận',
                                      ),
                                    ),
                                    TextFormField(
                                      controller: _boxController,
                                      decoration: const InputDecoration(
                                        labelText: 'Số thùng',
                                      ),
                                    ),
                                    // Add more fields as necessary
                                  ],
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Hủy'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Handle save logic here
                                  if (_formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Processing Data')),
                                    );
                                    _insertDocument();
                                    Navigator.of(context).pop();
                                  }
                                },
                                child: const Text('Lưu'),
                              )
                            ],
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CupertinoButton(
                      color: Colors.purple,
                      onPressed: _updateTable,
                      child: const Text(
                        "Xóa đã chọn",
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(width: 10),
                  CupertinoButton(
                      color: Colors.green,
                      onPressed: _updateTable,
                      child: const Text(
                        "Import Excel",
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(width: 10),
                  CupertinoButton(
                      color: Colors.orange,
                      child: const Text("Xuất Excel",
                          style: TextStyle(color: Colors.white)),
                      onPressed: () async {
                        // _exportToExcel();
                      })
                ],
              ),
            ),
            FutureBuilder<List<IncomingDispatch>>(
                future: _incomingFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No data available'));
                  } else {
                    _outDataSource =
                        IncomingDispatchDataSource(docs: snapshot.data!);
                    return SizedBox(
                      height: 600,
                      child: SfDataGridTheme(
                        data: const SfDataGridThemeData(
                          headerColor: Color(0xff009889),
                          gridLineColor: Colors.grey,
                          gridLineStrokeWidth: 0.5,
                        ),
                        child: SfDataGrid(
                            source: _outDataSource,
                            columnWidthMode: ColumnWidthMode.fill,
                            rowHeight: 50,
                            allowSorting: true,
                            allowMultiColumnSorting: true,
                            allowEditing: true,
                            selectionMode: SelectionMode.multiple,
                            controller: _dataGridController,
                            columns: <GridColumn>[
                              GridColumn(
                                  columnName: "id",
                                  allowEditing: false,
                                  width: 100,
                                  label: Container(
                                    padding: const EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: const Text('ID'),
                                  )),
                              GridColumn(
                                  columnName: 'Ngày nhận',
                                  label: Container(
                                    padding: const EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: const Text('Ngày nhận'),
                                  )),
                              GridColumn(
                                  columnName: "Số đến",
                                  width: 100,
                                  label: Container(
                                    padding: const EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: const Text('Số đến'),
                                  )),
                              GridColumn(
                                  columnName: "Nơi gửi",
                                  label: Container(
                                    padding: const EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: const Text('Nơi gửi'),
                                  )),
                              GridColumn(
                                  columnName: "Số ký hiệu",
                                  label: Container(
                                    padding: const EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: const Text('Số ký hiệu'),
                                  )),
                              GridColumn(
                                  columnName: "Ngày văn bản",
                                  width: 100,
                                  label: Container(
                                    padding: const EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: const Text('Ngày văn bản'),
                                  )),
                              GridColumn(
                                  columnName: "Tên văn bản",
                                  // width: 500,
                                  label: Container(
                                    padding: const EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: const Text('Tên văn bản'),
                                  )),
                              GridColumn(
                                  columnName: "Nơi nhận",
                                  width: 200,
                                  label: Container(
                                    padding: const EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: const Text('Nơi nhận'),
                                  )),
                              GridColumn(
                                  columnName: "Số thùng",
                                  width: 200,
                                  label: Container(
                                    padding: const EdgeInsets.all(16.0),
                                    alignment: Alignment.center,
                                    child: const Text('Số thùng'),
                                  )),
                            ]),
                      ),
                    );
                  }
                })
          ],
        ));
  }
}
