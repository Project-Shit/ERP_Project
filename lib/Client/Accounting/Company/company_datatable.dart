// @dart=2.9
import 'dart:convert';
import 'package:erp/Client/Accounting/Company/company.dart';
import 'package:http/http.dart' as http;
import 'package:erp/Client/Accounting/Company/companyModel.dart';
import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:flutter/material.dart';

class CompanyTable extends StatefulWidget {
  final String userName, type;

  CompanyTable({this.userName, this.type});
  @override
  _CompanyTableState createState() => _CompanyTableState();
}

class _CompanyTableState extends State<CompanyTable> {
  List<CompanyModel> model = [];
  Future fetchRecords() async {
    try {
      data = {"command": "SELECT * FROM company ORDER BY ID"};
      http.post(Uri.parse(getData), body: data).then((http.Response response) {
        var fetchDecode = jsonDecode(response.body);
        fetchDecode.forEach((company) {
          setState(() {
            model.add(new CompanyModel(
              month: company['month'],
              year: company['year'],
              balance: company['Balance'],
              expenses: company['expenses'],
              salary: company['salary'],
              income: company['income'],
              tax: company['tax'],
              newBalance: company['newBalance'],
              profit: company['profit'],
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
        preferredSize: Size(width, 70),
        child: ClientAppBar(
          userName: widget.userName,
          type: widget.type,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      DataTable(
                        columns: [
                          DataColumn(label: Text('Month')),
                          DataColumn(label: Text('Year')),
                          DataColumn(label: Text('Balance')),
                          DataColumn(label: Text('Expenses')),
                          DataColumn(label: Text('Salary')),
                          DataColumn(label: Text('Income')),
                          DataColumn(label: Text('Tax')),
                          DataColumn(label: Text('New Balance')),
                          DataColumn(label: Text('Profit')),
                        ],
                        rows: model
                            .map((data) => DataRow(
                          cells: [
                            new DataCell(
                              Text(data.month),
                            ),
                            new DataCell(
                              Text(data.year),
                            ),
                            new DataCell(
                              Text(data.balance),
                            ),
                            new DataCell(
                              Text(data.expenses),
                            ),
                            new DataCell(
                              Text(data.salary),
                            ),
                            new DataCell(
                              Text(data.income),
                            ),
                            new DataCell(
                              Text(data.tax),
                            ),
                            new DataCell(
                              Text(data.newBalance),
                            ),
                            new DataCell(
                              Text(data.profit),
                            ),
                          ],
                        ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            actionButtons('Add', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Company(userName: widget.userName, type: widget.type,)));
            }, Colors.blue.shade600),
          ],
        ),
      ),
    );
  }
}