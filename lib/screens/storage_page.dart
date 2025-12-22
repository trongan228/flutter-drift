import 'package:flutter/material.dart';
import 'package:flutter_drift/database.dart';
import 'package:flutter_drift/models/document_data.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class StoragePage extends StatefulWidget {
  const StoragePage({super.key, required this.database});
  final AppDatabase database;

  @override
  State<StoragePage> createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  // Example data structure
  late DocumentDataSource _documentDataSource;
  late Future<List<Document>> _documentFuture;

  final List<Warehouse> warehouses = [
    Warehouse(
      name: 'Kho',
      image: 'assets/images/bin.png',
      bins: [
        Bin(
          name: 'Thùng VTVP-0050',
          image: 'assets/images/bin.png',
          boxes: [
            Box(name: 'Hộp số 1', image: 'assets/images/box.png'),
            Box(name: 'Hộp số 2', image: 'assets/images/box.png'),
            Box(name: 'Hộp số 3', image: 'assets/images/box.png'),
            Box(name: 'Hộp số 4', image: 'assets/images/box.png'),
            Box(name: 'Hộp số 5', image: 'assets/images/box.png'),
          ],
        ),
        Bin(
          name: 'Thùng VTVP-0051',
          image: 'assets/images/bin.png',
          boxes: [
            Box(name: 'Box 3', image: 'assets/images/box.png'),
          ],
        ),
      ],
    ),
    // Add more warehouses if needed
  ];

  int selectedWarehouse = 0;
  int? selectedBin;
  @override
  void initState() {
    super.initState();
    _documentFuture = getDocument();
  }

  Future<List<Document>> getDocument() async {
    // // if (_textSearchController.text.isNotEmpty) {
    // //   print(_textSearchController.text);
    // //   List<Document> docs =
    //       await widget.database.searchDocument(_textSearchController.text);
    //   return docs;
    // }
    List<Document> docs = await widget.database.getAllDocument();
    return docs;
  }

  @override
  Widget build(BuildContext context) {
    final warehouse = warehouses[selectedWarehouse];
    final bins = warehouse.bins;
    final bin = selectedBin != null ? bins[selectedBin!] : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý kho'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 300,
                child: Expanded(
                  child: SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                        // Warehouse selector
                        Row(
                          children: [
                            Image.asset(
                              warehouse.image,
                              width: 100,
                              height: 100,
                            ),
                            const SizedBox(width: 12),
                            DropdownButton<int>(
                              value: selectedWarehouse,
                              items: List.generate(
                                warehouses.length,
                                (index) => DropdownMenuItem(
                                  value: index,
                                  child: Text(warehouses[index].name),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  selectedWarehouse = value!;
                                  selectedBin = null;
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Bin selector
                        if (bins.isNotEmpty)
                          Row(
                            children: [
                              Image.asset(
                                bins[0].image,
                                width: 60,
                                height: 60,
                              ),
                              const SizedBox(width: 12),
                              DropdownButton<int>(
                                value: selectedBin,
                                hint: const Text('Chọn thùng'),
                                items: List.generate(
                                  bins.length,
                                  (index) => DropdownMenuItem(
                                    value: index,
                                    child: Text(bins[index].name),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectedBin = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        const SizedBox(height: 24),
                        // Box list
                        if (bin != null)
                          Expanded(
                            child: ListView.builder(
                              itemCount: bin.boxes.length,
                              itemBuilder: (context, index) {
                                final box = bin.boxes[index];
                                return ListTile(
                                  leading: Image.asset(
                                    box.image,
                                    width: 32,
                                    height: 32,
                                  ),
                                  title: Text(box.name),
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: FutureBuilder<List<Document>>(
                      future: _documentFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return const Center(child: Text('No data available'));
                        } else {
                          _documentDataSource =
                              DocumentDataSource(docs: snapshot.data!);
                          return SizedBox(
                            height: 600,
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
                                        columnName: "Người ký",
                                        width: 200,
                                        label: Container(
                                          padding: const EdgeInsets.all(16.0),
                                          alignment: Alignment.center,
                                          child: const Text('Người ký'),
                                        )),
                                    GridColumn(
                                        columnName: "Số thùng",
                                        width: 200,
                                        label: Container(
                                          padding: const EdgeInsets.all(16.0),
                                          alignment: Alignment.center,
                                          child: const Text('Số thùng'),
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
                                        columnName: "Ghi chú",
                                        width: 150,
                                        label: Container(
                                          padding: const EdgeInsets.all(16.0),
                                          alignment: Alignment.center,
                                          child: const Text('Ghi chú'),
                                        )),
                                  ]),
                            ),
                          );
                        }
                      }))
            ],
          )),
    );
  }
}

// Data models
class Warehouse {
  final String name;
  final String image;
  final List<Bin> bins;
  Warehouse({required this.name, required this.image, required this.bins});
}

class Bin {
  final String name;
  final String image;
  final List<Box> boxes;
  Bin({required this.name, required this.image, required this.boxes});
}

class Box {
  final String name;
  final String image;
  Box({required this.name, required this.image});
}
