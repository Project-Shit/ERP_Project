// @dart=2.9
import 'dart:convert';
import 'package:erp/Client/Accounting/Salary/salaryModel.dart';
import 'package:erp/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SalaryDataTable extends StatefulWidget {
  @override
  _SalaryDataTableState createState() => _SalaryDataTableState();
}

class _SalaryDataTableState extends State<SalaryDataTable> {
  List<SalaryModel> model = [];

  Future fetchRecords() async {
    try {
      data = {"command": "SELECT * FROM users ORDER BY ID"};
      http.post(Uri.parse(getData), body: data).then((http.Response response) {
        var fetchDecode = jsonDecode(response.body);
        fetchDecode.forEach((salary) {
          setState(() {
            model.add(new SalaryModel(
              id: salary['id'],
              name: salary['name'],
              department: salary['department'],
              salary: salary['salary'],
              insurance: salary['insurance'],
              tax: salary['tax'],
              deduction: salary['deduction'],
              netSalary: salary['netSalary'],
            ));
          });
        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    fetchRecords();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, 60),
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          iconTheme: IconThemeData(
            color: textColor,
          ),
          backgroundColor: primaryColor,
          title: Image.asset(
            'assets/logo.png',
            height: 70,
          ),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DataTable(
                columns: [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Department')),
                  DataColumn(label: Text('Salary')),
                  DataColumn(label: Text('Insurance')),
                  DataColumn(label: Text('Tax')),
                  DataColumn(label: Text('Deduction')),
                  DataColumn(label: Text('Net Salary')),
                ],
                rows: model
                    .map((data) => DataRow(
                          cells: [
                            new DataCell(
                              Text(data.id),
                            ),
                            new DataCell(
                              Text(data.name),
                            ),
                            new DataCell(
                              Text(data.department),
                            ),
                            new DataCell(
                              Text(data.salary),
                            ),
                            new DataCell(
                              Text(data.insurance),
                            ),
                            new DataCell(
                              Text(data.tax),
                            ),
                            new DataCell(
                              Text(data.deduction),
                            ),
                            new DataCell(
                              Text(data.netSalary),
                            ),
                          ],
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
