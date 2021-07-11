// @dart=2.9
import 'dart:convert';
import 'package:erp/Client/Online/crmModel.dart';
import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:erp/widget/chat/chatButton.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CRMData extends StatefulWidget {
  @override
  _CRMDataState createState() => _CRMDataState();
}

class _CRMDataState extends State<CRMData> {
  List<crmModel> model = [];
  TextEditingController _name = TextEditingController();
  TextEditingController _category = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _address = TextEditingController();

  apply() async {
    try {
      data = {
        "command": "insert into client(name,category,email,phone,address)"
            "values('${_name.text}','${_category.text}','${_email.text}','${_phone.text}','${_address.text}')"
      };
      response = await http.post(Uri.parse(setData), body: data);
    } catch (e) {
      print(e);
    }
    fetchRecords();
  }

  delete() async {
    try {
      data = {"command": " DELETE FROM client where phone = '${_phone.text}'"};
      response = await http.post(Uri.parse(setData), body: data);
    } catch (e) {
      print(e);
    }
    fetchRecords();
  }

  Future fetchRecords() async {
    setState(() {
      model = [];
    });
    try {
      data = {"command": "SELECT * FROM  client"};
      http.post(Uri.parse(getData), body: data).then((http.Response response) {
        var fetchDecode = jsonDecode(response.body);
        fetchDecode.forEach((client) {
          setState(() {
            model.add(new crmModel(
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
        preferredSize: Size(width, 70),
        child: ClientAppBar(),
      ),
      body: Container(
        color: darkBlue,
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DataTable(
                    columns: [
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('category')),
                      DataColumn(label: Text('email')),
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
                  SizedBox(
                    height: 50,
                  ),
                  textField(_name, width * 0.6, 40.0, false, 'Name'),
                  SizedBox(
                    height: 30,
                  ),
                  textField(_category, width * 0.6, 40.0, false, 'Category'),
                  SizedBox(
                    height: 30,
                  ),
                  textField(_email, width * 0.6, 40.0, false, 'Email'),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      actionButtons('Add', () {
                        setState(() {
                          model = [];
                        });
                        apply();
                        fetchRecords();
                      }, Colors.green.shade600),
                      SizedBox(
                        width: 15,
                      ),
                      actionButtons('Delete', () {
                        setState(() {
                          model = [];
                        });
                        delete();
                        fetchRecords();
                      }, Colors.blue.shade600),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: ChatButton(),
    );
  }
}
