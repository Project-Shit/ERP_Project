// @dart=2.9
import 'dart:convert';
import 'package:erp/Client/Crm/clientModel.dart';
import 'package:erp/constants.dart';
import 'package:erp/widget/chat/chatButton.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:erp/Client/Application/application.dart';

class CRM extends StatefulWidget {
  const CRM({Key key}) : super(key: key);

  @override
  _CRMState createState() => _CRMState();
}

class _CRMState extends State<CRM> {

  List<CrmModel> model = [];

  Future fetchRecords() async {
    try {
      data = {"command": "SELECT * FROM clients ORDER BY ID"};
      http.post(Uri.parse(getData), body: data).then((http.Response response) {
        var fetchDecode = jsonDecode(response.body);
        fetchDecode.forEach((client) {
          setState(() {
            model.add(new CrmModel(
              id: client['id'],
              name: client['name'],
              category: client['category'],
              email: client['email'],
              phone: client['phone'],
              address: client['address'],
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => Application()));
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
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Category')),
                    DataColumn(label: Text('Email')),
                    DataColumn(label: Text('Phone')),
                    DataColumn(label: Text('Address')),
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
                        Text(data.category),
                      ),
                      new DataCell(
                        Text(data.email),
                      ),
                      new DataCell(
                        Text(data.phone),
                      ),
                      new DataCell(
                        Text(data.address),
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
