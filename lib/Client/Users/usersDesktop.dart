// @dart=2.9
import 'dart:convert';
import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oktoast/oktoast.dart';

class UsersDesktop extends StatefulWidget {
  @override
  _UsersDesktopState createState() => _UsersDesktopState();
}

// adding user page for the client's system
class _UsersDesktopState extends State<UsersDesktop> {
  // objects implementation
  bool password = true;
  bool message1 = true;
  bool message2 = true;
  TextEditingController _searchController = TextEditingController();
  TextEditingController _id = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _department = TextEditingController();
  TextEditingController _userType = TextEditingController();

  // ignore: deprecated_member_use
  List _locations = List();
  String _selectedLocation;
  var url = 'http://192.168.1.104/ERP/setAPI.php';
  var url2 = 'http://192.168.1.104/ERP/getAPI.php';
  var data, response;

  // function to change values of a record
  _applyUser() async {
    data = {
      "command": "update users set name = '${_name.text}', phone = '${_phone.text}',"
          " email = '${_email.text}' , pass = '${_pass.text}', address = '${_address.text}',"
          "department = '${_department.text}', userType = '${_userType.text}' where id = ${_id.text}"
    };
    response = await http.post(Uri.parse(url), body: data);
    if (200 == response.statusCode) {
      return message1;
    } else {
      return !message1;
    }
  }

  // function to set record to null values
  _delete() async {
    data = {
      "command": "update users set name = '', phone = '',"
          " email = '' , pass = '', address = '',"
          "department = '', userType = '' where id = ${_id.text}"
    };
    response = await http.post(Uri.parse(url), body: data);
    if (200 == response.statusCode) {
      return message2;
    } else {
      return !message2;
    }
  }

  // function to change password field text's visibility
  hidePassword() {
    setState(() {
      password = !password;
    });
  }

  // function to clear all text fields
  clear() {
    setState(() {
      _id.text = '';
      _name.text = '';
      _phone.text = '';
      _email.text = '';
      _pass.text = '';
      _address.text = '';
      _department.text = '';
      _userType.text = '';
    });
  }

  // function to fetch data from database
  Future<Null> fetchData() async {
    try {
      data = {
        "command":
            "select * from users where id = '${_searchController.text}' or id = '${_selectedLocation.toString()}'"
      };
      return await http
          .post(Uri.parse(url2), body: data)
          .then((http.Response response) {
        final List fetchData = json.decode(response.body);
        fetchData.forEach((user) {
          setState(() {
            _id.text = user['id'];
            _name.text = user['name'];
            _phone.text = user['phone'];
            _email.text = user['email'];
            _pass.text = user['pass'];
            _address.text = user['address'];
            _department.text = user['department'];
            _userType.text = user['userType'];
          });
        });
      });
    } catch (e) {
      showToast('Database Crash', position: ToastPosition.top);
    }
  }

  Future dropList() async {
    try {
      data = {"command": "select id from users"};
      http.post(Uri.parse(url2), body: data).then((http.Response response) {
        var fetchDecode = jsonDecode(response.body);
        fetchDecode.forEach((users) {
          setState(() {
            _locations.add(users['id']);
          });
        });
      });
    } catch (e) {
      showToast('Database Crash', position: ToastPosition.top);
    }
  }

  @override
  void initState() {
    super.initState();
    dropList();
  }

  @override
  Widget build(BuildContext context) {
    // Media Query object for responsive layout
    final width = MediaQuery.of(context).size.width;
    return OKToast(
      child: Scaffold(
        // calling the client's custom AppBar
        appBar: PreferredSize(
          preferredSize: Size(width, 70),
          child: ClientAppBar(),
        ),
        // implementing th body with scroll View and row widget
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 30,
              bottom: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // implementing a container to make the outline border design
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        50.0,
                      ),
                      border: Border.all(
                        color: textColor,
                        width: 2,
                      )),
                  width: width * 0.7,
                  height: 620,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 70,
                      right: 70,
                    ),
                    // implementing a column widget to align the rest of the widget
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // implementing a column to call custom label widget with sizedBox between them
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                labelText('ID'),
                                SizedBox(
                                  height: 30,
                                ),
                                labelText('Name'),
                                SizedBox(
                                  height: 30,
                                ),
                                labelText('Phone'),
                                SizedBox(
                                  height: 30,
                                ),
                                labelText('Email'),
                                SizedBox(
                                  height: 30,
                                ),
                                labelText('Password'),
                                SizedBox(
                                  height: 30,
                                ),
                                labelText('Address'),
                                SizedBox(
                                  height: 30,
                                ),
                                labelText('Department'),
                                SizedBox(
                                  height: 30,
                                ),
                                labelText('User Type'),
                              ],
                            ),
                            SizedBox(
                              width: width * 0.04,
                            ),
                            // implementing a column to call custom drop down list, text field and
                            // password field widget with sizedBox between them.
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: width * 0.49,
                                  height: 50.0,
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: secondaryColor,
                                    ),
                                    value: _selectedLocation,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedLocation = newValue;
                                        fetchData();
                                      });
                                    },
                                    items: _locations.map((location) {
                                      return DropdownMenuItem(
                                        child: new Text(location),
                                        value: location,
                                      );
                                    }).toList(),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                textField(_name, width * 0.49, 40.0, true),
                                SizedBox(
                                  height: 15,
                                ),
                                textField(_phone, width * 0.49, 40.0, true),
                                SizedBox(
                                  height: 15,
                                ),
                                textField(_email, width * 0.49, 40.0, true),
                                SizedBox(
                                  height: 15,
                                ),
                                passwordField(_pass, width * 0.49, 40.0,
                                    password, true, hidePassword),
                                SizedBox(
                                  height: 15,
                                ),
                                textField(_address, width * 0.49, 40.0, true),
                                SizedBox(
                                  height: 15,
                                ),
                                textField(
                                    _department, width * 0.49, 40.0, true),
                                SizedBox(
                                  height: 15,
                                ),
                                textField(_userType, width * 0.49, 40.0, true),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        // implementing a row widget to call custom buttons and align them.
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            actionButtons('Apply', () {
                              _applyUser();
                              showToast(
                                  message1 ? 'Applied' : 'Couldn\'t Apply',
                                  position: ToastPosition.top);
                              clear();
                            }, Colors.green),
                            SizedBox(
                              width: 80,
                            ),
                            actionButtons('Delete', () {
                              _delete();
                              showToast(
                                  message2 ? 'Deleted' : 'Couldn\'t Delete',
                                  position: ToastPosition.top);
                              clear();
                            }, Colors.red.shade900),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
