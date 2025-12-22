import 'dart:io';

import 'package:drift/drift.dart' hide Column, Table;
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drift/database.dart';
import 'package:flutter_drift/models/document_data.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.database});
  final AppDatabase database;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedYear;
  final List<int> years = [
    0,
    2017,
    2018,
    2019,
    2020,
    2021,
    2022,
    2023,
    2024,
    2025
  ];
  late DocumentDataSource _documentDataSource;
  late Future<List<Document>> _documentFuture;
  final TextEditingController _textSearchController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _signerController = TextEditingController();
  final TextEditingController _receiverController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
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
        _dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _documentFuture = getDocument();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _textSearchController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  void _updateTable() {
    setState(() {
      _documentFuture = getDocument();
    });
    _dataGridController.selectedRows.clear();
  }

  void _insertDocument() {
    DocumentsCompanion document = DocumentsCompanion(
      number: Value(_numberController.text),
      date: Value(_dateController.text),
      name: Value(_nameController.text),
      signer: Value(_signerController.text),
      receiver: Value(_receiverController.text),
      note: Value(_noteController.text),
    );
    widget.database.into(widget.database.documents).insert(document);
    _updateTable();
  }

  void convertExceltoJson(String path) async {
    var file = File(path);
    var bytes = file.readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    List<Map<String, dynamic>> jsonData = [];

    for (var table in excel.tables.keys) {
      var sheet = excel.tables[table];
      if (sheet == null) continue;
      List<String> headers =
          sheet.rows.first.map((e) => e?.value.toString() ?? '').toList();
      for (var row in sheet.rows.skip(1)) {
        Map<String, dynamic> rowData = {};
        for (int i = 0; i < headers.length; i++) {
          rowData[headers[i]] = row[i]?.value;
        }
        jsonData.add(rowData);
      }
    }
    int maxId = await widget.database.getMaxIdDocument();
    List<Document> documents = jsonData.map((data) {
      maxId += 1;
      return Document(
        id: maxId,
        number: data['Số văn bản']?.toString() ?? '',
        date: data['Ngày văn bản']?.toString() ?? '',
        name: data['Tên văn bản']?.toString() ?? '',
        signer: data['Người ký']?.toString() ?? '',
        receiver: data['Nơi nhận']?.toString() ?? '',
        note: data['Ghi chú']?.toString() ?? '',
        warehouseId: data['Số thùng']?.toString() ?? '',
      );
    }).toList();
    await widget.database.insertAllDocument(documents);
    _updateTable();
  }

  void _exportToExcel() async {
    var excel = Excel.createExcel();
    Sheet sheetObject = excel['Văn bản'];

    // Add header row
    List<String> headers = [
      'ID',
      'Số văn bản',
      'Ngày văn bản',
      'Tên văn bản',
      'Người ký',
      'Nơi nhận',
      'Số thùng',
      'Ghi chú'
    ];
    sheetObject.appendRow(headers);

    // Add data rows
    final docs = await getDocument();
    for (var doc in docs) {
      List<dynamic> row = [
        doc.id,
        doc.number,
        doc.date,
        doc.name,
        doc.signer,
        doc.receiver,
        doc.warehouseId,
        doc.note
      ];
      sheetObject.appendRow(row);
    }

    // Save the file
    String outputFile =
        'Documents_${DateTime.now().millisecondsSinceEpoch}.xlsx';
    List<int>? fileBytes = excel.encode();
    if (fileBytes != null) {
      File(outputFile)
        ..createSync(recursive: true)
        ..writeAsBytesSync(fileBytes);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('File saved to $outputFile')),
      );
    }
  }

  Future<List<Document>> getDocument() async {
    List<Document> docs = await widget.database
        .filterDocument(selectedYear, _textSearchController.text);
    return docs;
  }

  Future<List<Document>> getDocumentByDate(DateTime selected) async {
    if (_textSearchController.text.isNotEmpty) {
      List<Document> docs =
          await widget.database.searchDocument(_textSearchController.text);
      return docs;
    }
    List<Document> docs = await widget.database.getAllDocument();
    return docs;
  }

  Future<void> _deleteDocument() async {
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
                            child: Text(year == 0 ? "Tất cả" : year.toString()),
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
                            title: const Text("Thêm mới văn bản"),
                            content: SizedBox(
                              height: 300,
                              width: 400,
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      controller: _numberController,
                                      decoration: const InputDecoration(
                                        labelText: 'Số văn bản',
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Vui lòng nhập số văn bản';
                                        }
                                        return null;
                                      },
                                    ),
                                    TextFormField(
                                      controller: _dateController,
                                      decoration: const InputDecoration(
                                        labelText: 'Ngày văn bản',
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
                                      controller: _signerController,
                                      decoration: const InputDecoration(
                                        labelText: 'Người ký',
                                      ),
                                    ),
                                    TextFormField(
                                      controller: _receiverController,
                                      decoration: const InputDecoration(
                                        labelText: 'Nơi nhận',
                                      ),
                                    ),
                                    TextFormField(
                                      controller: _noteController,
                                      decoration: const InputDecoration(
                                        labelText: 'Ghi chú',
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
                  const SizedBox(width: 10),
                  CupertinoButton(
                      color: Colors.redAccent,
                      child: const Text("Xóa",
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        _deleteDocument();
                      }),
                  const SizedBox(width: 10),
                  CupertinoButton(
                    color: Colors.green,
                    child: const Text("Import Excel",
                        style: TextStyle(color: Colors.white)),
                    onPressed: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['xlsx', 'xls'],
                      );
                      convertExceltoJson(result!.files.single.path!);
                    },
                  ),
                  const SizedBox(width: 10),
                  CupertinoButton(
                      color: Colors.orange,
                      child: const Text("Xuất Excel",
                          style: TextStyle(color: Colors.white)),
                      onPressed: () {
                        _exportToExcel();
                      }),
                ],
              ),
            ),
            FutureBuilder<List<Document>>(
                future: _documentFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No data available'));
                  } else {
                    _documentDataSource =
                        DocumentDataSource(docs: snapshot.data!);
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Text(
                              'Số lượng bản ghi: ${snapshot.data!.length}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: SfDataGridTheme(
                              data: const SfDataGridThemeData(
                                headerColor: Color(0xff009889),
                                gridLineColor: Colors.grey,
                                gridLineStrokeWidth: 0.5,
                              ),
                              child: SfDataGrid(
                                  source: _documentDataSource,
                                  columnWidthMode: ColumnWidthMode.fill,
                                  rowHeight: 50,
                                  allowSorting: true,
                                  allowMultiColumnSorting: true,
                                  allowEditing: true,
                                  selectionMode: SelectionMode.multiple,
                                  navigationMode: GridNavigationMode.cell,
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
                                        columnName: "Số văn bản",
                                        width: 200,
                                        label: Container(
                                          padding: const EdgeInsets.all(16.0),
                                          alignment: Alignment.center,
                                          child: const Text('Số văn bản'),
                                        )),
                                    GridColumn(
                                        columnName: "Ngày văn bản",
                                        width: 120,
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
                                        columnName: "Người ký",
                                        width: 200,
                                        label: Container(
                                          padding: const EdgeInsets.all(16.0),
                                          alignment: Alignment.center,
                                          child: const Text('Người ký'),
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
                                        width: 150,
                                        label: Container(
                                          padding: const EdgeInsets.all(16.0),
                                          alignment: Alignment.center,
                                          child: const Text('Số thùng'),
                                        )),
                                    GridColumn(
                                        columnName: "Ghi chú",
                                        width: 100,
                                        label: Container(
                                          padding: const EdgeInsets.all(16.0),
                                          alignment: Alignment.center,
                                          child: const Text('Note'),
                                        )),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                })
          ],
        ));
  }
}
