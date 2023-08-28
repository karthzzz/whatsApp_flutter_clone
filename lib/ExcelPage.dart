//a flutter page which can read excel file and display the data in the excel file

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';

class Excel_page extends StatefulWidget {
  @override
  _Excel_pageState createState() => _Excel_pageState();
}

class _Excel_pageState extends State<Excel_page> {
  String _filePath = '';
  List<List<String>> _excelData = [];

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
    );

    if (result != null) {
      setState(() {
        _filePath = result.files.single.path!;
      });
      await _readExcel();
    }
  }

  Future<void> _readExcel() async {
    var bytes = File(_filePath).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);

    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table]!.rows) {
        List<String> rowData = [];
        for (var cell in row) {
          if (cell?.value != null) {
            rowData.add(cell!.value.toString());
          } else {
            rowData.add('');
          }
        }
        _excelData.add(rowData);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Excel File Reader'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _pickFile,
              child: Text('Pick Excel File'),
            ),
            SizedBox(height: 20),
            Text('File Path: $_filePath'),
            SizedBox(height: 20),
            if (_excelData.isNotEmpty)
              Column(
                children: [
                  Text('Excel Data:'),
                  for (var row in _excelData)
                    Text(row.join(', ')),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
