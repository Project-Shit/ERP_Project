// @dart=2.9
import 'package:erp/Client/Database/usersModel.dart';
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
  String message1 = 'Applied';
  String message2 = 'Deleted';
  TextEditingController _search = TextEditingController();
  TextEditingController _id = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _department = TextEditingController();
  TextEditingController _userType = TextEditingController();
  var url = 'http://192.168.1.104/ERP/erp.php';
  var url2 = 'http://192.168.1.104/ERP/call.php';
  var data, response;


  Future<List<UserModel>> getUsers() async {
    data = {"select * from users"};
    final response = await http.get(Uri.parse(url2));
    return userModelFromJson(response.body);
  }


  // function to change values of a record
  _applyUser() async {
    try {
      data = {
        "command": "update users set name = '${_name.text}', phone = '${_phone.text}',"
            " email = '${_email.text}' , pass = '${_pass.text}', address = '${_address.text}',"
            "department = '${_department.text}', userType = '${_userType.text}' where id = ${_id.text}"
      };
      response = await http.post(Uri.parse(url), body: data);
      if (200 == response.statusCode) {
        return message1 = 'Applied';
      } else {
        return message1 = 'Couldn\'t Apply';
      }
    } catch (e) {
      return message1 = 'Applied';
    }
  }

  // function to set record to null values
  _delete() async {
    try {
      data = {
        "command": "update users set name = '', phone = '',"
            " email = '' , pass = '', address = '',"
            "department = '', userType = '' where id = ${_id.text}"
      };
      response = await http.post(Uri.parse(url), body: data);
      if (200 == response.statusCode) {
        return message2 = 'Deleted';
      } else {
        return message2 = 'Couldn\'t Delete';
      }
    } catch (e) {
      return message2 = 'Deleted';
    }
  }

  // function to change password field text's visibility
  void hidePassword() {
    setState(() {
      password = !password;
    });
  }

  // function to clear all text fields
  void clear() {
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
                        // implementing a container to implement a search box
                        Container(
                          width: width,
                          height: 40,
                          child: TextFormField(
                            controller: _search,
                            style: TextStyle(
                              color: textColor,
                            ),
                            decoration: InputDecoration(
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(
                                  right: 10,
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.search),
                                  onPressed: () {},
                                ),
                              ),
                              fillColor: secondaryColor,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  new Radius.circular(
                                    10.0,
                                  ),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(
                                  new Radius.circular(
                                    10.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
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
                                textField(_id, width * 0.49, 40.0, true),
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
                                passwordField(_pass, width * 0.49, 40.0, password,
                                    true, hidePassword),
                                SizedBox(
                                  height: 15,
                                ),
                                textField(_address, width * 0.49, 40.0, true),
                                SizedBox(
                                  height: 15,
                                ),
                                textField(_department, width * 0.49, 40.0, true),
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
                              showToast(message1,position: ToastPosition.top);
                              clear();
                            }, Colors.green),
                            SizedBox(
                              width: 80,
                            ),
                            actionButtons('Delete', () {
                              _delete();
                              showToast(message2,position: ToastPosition.top);
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
