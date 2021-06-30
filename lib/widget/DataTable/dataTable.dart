// @dart=2.9
import 'dart:convert';
import 'package:erp/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyTableTest extends StatefulWidget {
  @override
  _MyTableTestState createState() => _MyTableTestState();
}

class _MyTableTestState extends State<MyTableTest> {

  // ignore: deprecated_member_use
  List _ids = List();
  // ignore: deprecated_member_use
  List _name = List();
  // ignore: deprecated_member_use
  List _salary = List();
  // function to set id data to drop list
  Future idList() async {
    try {
      data = {"command": "select id,name,salary from users order by id"};
      http.post(Uri.parse(getData), body: data).then((http.Response response) {
        var fetchDecode = jsonDecode(response.body);
        fetchDecode.forEach((users) {
          setState(() {
            _ids.add(users['id']);
            _name.add(users['name']);
            _salary.add(users['salary']);
          });
        });
      });
    } catch (e) {
      print(e);
    }
  }

  dataBody() {
    return DataTable(
          columns: [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Salary')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text(_ids[0])),
              DataCell(Text(_name[0])),
              DataCell(Text(_salary[0])),
            ]),
            DataRow(cells: [
              DataCell(Text(_ids[1])),
              DataCell(Text(_name[1])),
              DataCell(Text(_salary[1])),
            ]),

          ],
    );
  }


  @override
  void initState() {
    super.initState();
    idList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 500,
        height: 500,
        child: dataBody(),
      ),
    );
  }
}
