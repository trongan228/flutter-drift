import 'package:flutter/material.dart';
import 'package:flutter_drift/components/drawer.dart';
import 'package:flutter_drift/database.dart';
import 'package:flutter_drift/generated/assets.dart';
import 'package:flutter_drift/screens/home_page.dart';
import 'package:flutter_drift/screens/chart_page.dart';
import 'package:flutter_drift/screens/indispatch_page.dart';
import 'package:flutter_drift/screens/outdispatch_page.dart';
import 'package:flutter_drift/screens/storage_page.dart';
import 'package:flutter_svg/svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, this.jumpIndex, required this.database});
  final AppDatabase database;
  final int? jumpIndex;
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  late Map<int, Widget> listPage;

  @override
  void initState() {
    // TODO: implement initState
    if (widget.jumpIndex != null) {
      selectedIndex = widget.jumpIndex!;
    }
    final appData = widget.database;
    final homeWidget = HomePage(
      database: appData,
    );
    // const chartPage = ChartPage();
    // final storagePage = StoragePage(database: appData);
    final outcomingWidget = OutdispatchPage(
      database: appData,
    );
    final incomingWidget = IndispatchPage(database: appData);
    listPage = {0: homeWidget, 1: outcomingWidget, 2: incomingWidget};
    super.initState();
  }

  void _onItemTapped(int index) {
    if (index == 0 || index == 2 || index == 1) {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerVielott(database: widget.database),
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: Colors.red,
        title: SvgPicture.asset(Assets.iconsIcLogoWhite),
        centerTitle: true,
      ),
      bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.document_scanner_outlined),
                  activeIcon: Icon(
                    Icons.document_scanner,
                    color: Colors.red,
                  ),
                  label: "Công văn có tên loại"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.import_export_outlined),
                  activeIcon: Icon(
                    Icons.import_export,
                    color: Colors.red,
                  ),
                  label: "Công văn đi không tên loại"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.storage_outlined),
                  activeIcon: Icon(
                    Icons.storage,
                    color: Colors.red,
                  ),
                  label: "Công văn đến")
            ],
            currentIndex: selectedIndex,
            onTap: _onItemTapped,
          )),
      body: listPage[selectedIndex],
    );
  }
}
