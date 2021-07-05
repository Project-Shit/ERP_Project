// @dart=2.9
import 'dart:convert';
import 'package:erp/Client/Users/users.dart';
import 'package:erp/Client/Users/usersModel.dart';
import 'package:erp/constants.dart';
import 'package:erp/widget/chat/chatButton.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersDataTable extends StatefulWidget {
  @override
  _UsersDataTableState createState() => _UsersDataTableState();
}

class _UsersDataTableState extends State<UsersDataTable> {
  List<UsersModel> model = [];

  Future fetchRecords() async {
    try {
      data = {"command": "SELECT * FROM users where name <> '' order by id"};
      http.post(Uri.parse(getData), body: data).then((http.Response response) {
        var fetchDecode = jsonDecode(response.body);
        fetchDecode.forEach((user) {
          setState(() {
            model.add(new UsersModel(
              id: user['id'],
              name: user['name'],
              ssin: user['ssin'],
              social: user['socialNumber'],
              phone: user['phone'],
              email: user['email'],
              password: user['password'],
              address: user['address'],
              department: user['department'],
              type: user['userType'],
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => Users()));
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
                    DataColumn(label: Text('SSIN')),
                    DataColumn(label: Text('Social Number')),
                    DataColumn(label: Text('Phone')),
                    DataColumn(label: Text('Email')),
                    DataColumn(label: Text('Password')),
                    DataColumn(label: Text('Address')),
                    DataColumn(label: Text('Department')),
                    DataColumn(label: Text('User Type')),
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
                                Text(data.ssin),
                              ),
                              new DataCell(
                                Text(data.social),
                              ),
                              new DataCell(
                                Text(data.phone),
                              ),
                              new DataCell(
                                Text(data.email),
                              ),
                              new DataCell(
                                Text(data.password),
                              ),
                              new DataCell(
                                Text(data.address),
                              ),
                              new DataCell(
                                Text(data.department),
                              ),
                              new DataCell(
                                Text(data.type),
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
