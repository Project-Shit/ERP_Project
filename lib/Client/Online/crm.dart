// @dart=2.9
import 'dart:convert';
import 'package:erp/Client/Online/crmModel.dart';
import 'package:erp/constants.dart';
import 'package:erp/widget/chat/chatButton.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class crmData extends StatefulWidget {
  @override
  _crmDataState createState() => _crmDataState();
}

class _crmDataState extends State<crmData> {
  List<crmModel> model = [];
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _address = TextEditingController();

  apply() async {
    try {
      data = {
        "command": "insert into crm(name,phone,address)"
            "values('${_name.text}','${_phone.text}','${_address.text}' )"
      };
      response = await http.post(Uri.parse(setData), body: data);
    } catch (e) {
      print(e);
    }
  }

  delete() async {
    try {
      data = {"command": " DELETE FROM crm where phone = '${_phone.text}'"};
      response = await http.post(Uri.parse(setData), body: data);
    } catch (e) {
      print(e);
    }
  }

  Future fetchRecords() async {
    try {
      data = {"command": "SELECT * FROM  crm"};
      http.post(Uri.parse(getData), body: data).then((http.Response response) {
        var fetchDecode = jsonDecode(response.body);
        fetchDecode.forEach((crm) {
          setState(() {
            model.add(new crmModel(
              id: crm['id'],
              name: crm['name'],
              phone: crm['phone'],
              address: crm['address'],
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
                                Text(data.phone),
                              ),
                              new DataCell(
                                Text(data.address),
                              ),
                            ],
                          ))
                      .toList(),
                ),
                textField(_name, width * 0.6, 40.0, false, 'Name'),
                SizedBox(
                  height: 30,
                ),
                textField(_phone, width * 0.6, 40.0, false, 'Phone'),
                SizedBox(
                  height: 30,
                ),
                textField(_address, width * 0.6, 40.0, false, 'Address'),
                SizedBox(
                  height: 30,
                ),
                actionButtons('Add', () {
                  setState(() {
                    model = [];
                  });
                  apply();
                  fetchRecords();
                }, Colors.blue.shade600),
                SizedBox(
                  height: 15,
                ),
                actionButtons('Delete', () {
                  setState(() {
                    model = [];
                  });
                  delete();
                  fetchRecords();
                }, Colors.red.shade600),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: ChatButton(),
    );
  }
}
