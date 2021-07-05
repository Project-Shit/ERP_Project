// @dart=2.9
import 'dart:convert';
import 'package:erp/Client/Accounting/Company/company.dart';
import 'package:erp/Client/Accounting/Company/companyModel.dart';
import 'package:erp/constants.dart';
import 'package:erp/widget/chatButton/chatButton.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CompanyDataTable extends StatefulWidget {
  @override
  _CompanyDataTableState createState() => _CompanyDataTableState();
}

class _CompanyDataTableState extends State<CompanyDataTable> {
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
        preferredSize: Size(width, 60),
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Company()));
            },
          ),
          automaticallyImplyLeading: false,
          elevation: 0,
          iconTheme: IconThemeData(
            color: textFill,
          ),
          backgroundColor: secondaryColor,
          title: Image.asset(
            'assets/logo.png',
            height: 50,
          ),
          centerTitle: true,
        ),
      ),
      body: Center(
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
      floatingActionButton: ChatButton(),
    );
  }
}
