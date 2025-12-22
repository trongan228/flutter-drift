import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  final List<_ChartData> columnData = [
    _ChartData('2019', 3500),
    _ChartData('2020', 2800),
    _ChartData('2021', 3400),
    _ChartData('2022', 3200),
    _ChartData('2023', 4000),
    _ChartData('2024', 4500),
  ];

  final List<_PieData> pieData = [
    _PieData('Công văn đến', 12543),
    _PieData('Công văn đi', 5310),
    _PieData('Công văn đi không tên loại', 2345),
  ];
  final List<_PieData> pieData2 = [
    _PieData('Công văn đến', 12543),
    _PieData('Công văn đi', 5310),
    _PieData('Công văn đi không tên loại', 2345),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thông kê văn bản Công ty')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text('Thống kê số lượng văn bản qua các năm',
                style: TextStyle(fontSize: 18)),
            SizedBox(
              height: 300,
              child: SfCartesianChart(
                primaryXAxis: const CategoryAxis(),
                series: <CartesianSeries>[
                  ColumnSeries<_ChartData, String>(
                    dataSource: columnData,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text('Thống kê tỉ lệ văn bản qua các năm',
                style: TextStyle(fontSize: 18)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 300,
                  child: SfCircularChart(
                    series: <PieSeries<_PieData, String>>[
                      PieSeries<_PieData, String>(
                        dataSource: pieData,
                        xValueMapper: (_PieData data, _) => data.x,
                        yValueMapper: (_PieData data, _) => data.y,
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: SfCircularChart(
                    series: <PieSeries<_PieData, String>>[
                      PieSeries<_PieData, String>(
                        dataSource: pieData2,
                        xValueMapper: (_PieData data, _) => data.x,
                        yValueMapper: (_PieData data, _) => data.y,
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  final String x;
  final double y;
  _ChartData(this.x, this.y);
}

class _PieData {
  final String x;
  final double y;
  _PieData(this.x, this.y);
}
