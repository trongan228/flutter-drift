import 'package:flutter/material.dart';
import 'package:flutter_drift/screens/main_page.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = AppDatabase();
  runApp(MaterialApp(
    title: "Quản lý văn thư",
    theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
    home: MainPage(
      database: database,
    ),
  ));
  doWhenWindowReady(() {
    appWindow.maximize();
    appWindow.show();
  });
}
