import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';
import 'package:samosa/ExcelPage.dart';
import 'package:samosa/whatApp_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MaterialColor primarySwatch = MaterialColor(0xff075E54, {
      50: Color(0xffD2EBF0),
      100: Color(0xffA5D6E2),
      200: Color(0xff75C0D3),
      300: Color(0xff46AAC3),
      400: Color(0xff249BB7),
      500: Color(0xff007DAA),
      600: Color(0xff0075A5),
      700: Color(0xff00699C),
      800: Color(0xff006092),
      900: Color(0xff004B82),
    });

    return MaterialApp(
      title: 'WhatsApp',
      theme: ThemeData(
        primaryColor: Color(0xff075E54),
        primarySwatch: primarySwatch,
      ),
      debugShowCheckedModeBanner: false,
      home: WhatsAppHome(),
    );
  }
}
