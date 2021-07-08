// @dart=2.9
import 'dart:convert';
import 'package:csc_picker/csc_picker.dart';
import 'package:erp/Client/Users/userDataTable.dart';
import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:erp/widget/chat/chatButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

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
  TextEditingController _name = TextEditingController();
  TextEditingController _ssin = TextEditingController();
  TextEditingController _social = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _street = TextEditingController();
  TextEditingController _department = TextEditingController();
  String _countryValue = "";
  String _stateValue = "";
  String _cityValue = "";

  // ignore: deprecated_member_use
  List _ids = List();

  // ignore: deprecated_member_use
  List _type = [
    'Admin',
    'Manager',
    'Employee',
  ];
  String _id, _user;

  // function to change values of a record
  applyUser() async {
    try {
      data = {
        "command": "update users set name = '${_name.text}',ssin = ${_ssin.text} "
            ",socialNumber = ${_social.text} ,phone = '${_phone.text}',email = '${_email.text}' "
            ",password = '${_pass.text}', "
            "address = '${_street.text+', '+ _cityValue.toString() +', '+ _stateValue.toString() +', '+ _countryValue.toString()}'"
            ",department = '${_department.text}',userType = '${_user.toString()}' where concat('User ',id) = '${_id.toString()}'"
      };
      response = await http.post(Uri.parse(setData), body: data);
      if (200 == response.statusCode) {
        return message1;
      } else {
        return !message1;
      }
    } catch (e) {
      print(e);
    }
  }

  // function to set record to empty values
  delete() async {
    try {
      data = {
        "command": "update users set name = '' ,ssin = '' ,socialNumber = ''"
            ",phone = '' ,email = null , password = '', address = '',"
            "department = '', userType = ''where concat('User ',id) = '${_id.toString()}'"
      };
      response = await http.post(Uri.parse(setData), body: data);
      if (200 == response.statusCode) {
        return message2;
      } else {
        return !message2;
      }
    } catch (e) {
      print(e);
    }
  }

  // function to set all text controller to ''
  clear() {
    setState(() {
      _name.text = '';
      _ssin.text = '';
      _social.text = '';
      _phone.text = '';
      _email.text = '';
      _pass.text = '';
      _address.text = "";
      _street.text = '';
      _department.text = '';
      _user = '';
    });
  }

  // function to change password field text's visibility
  hidePassword() {
    setState(() {
      password = !password;
    });
  }

  // function to fetch data from database
  Future<Null> fetchData() async {
    try {
      data = {
        "command":
            "select * from users where concat('User ',id) = '${_id.toString()}'"
      };
      return await http
          .post(Uri.parse(getData), body: data)
          .then((http.Response response) {
        final List fetchData = json.decode(response.body);
        fetchData.forEach((user) {
          setState(() {
            _name.text = user['name'];
            _ssin.text = user['ssin'];
            _social.text = user['socialNumber'];
            _phone.text = user['phone'];
            _email.text = user['email'];
            _pass.text = user['password'];
            _address.text = user['address'];
            _department.text = user['department'];
            _user = user['userType'];
          });
        });
      });
    } catch (e) {
      print(e);
    }
  }

  // function to set id data to drop list
  Future idList() async {
    try {
      data = {
        "command": "select concat('User ',id) as userid from users order by id"
      };
      http.post(Uri.parse(getData), body: data).then((http.Response response) {
        var fetchDecode = jsonDecode(response.body);
        fetchDecode.forEach((users) {
          setState(() {
            _ids.add(users['userid']);
          });
        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    idList();
  }

  @override
  Widget build(BuildContext context) {
    // Media Query object for responsive layout
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(
                    color: textColor,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 30,
                    bottom: 30,
                    left: 50,
                    right: 50,
                  ),
                  // implementing a column widget to align the rest of the widget
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // implementing a column to call custom drop down list, text field and
                          // password field widget with sizedBox between them.
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: width * 0.6,
                                height: 50.0,
                                child: DropdownButtonFormField(
                                  hint: Text('ID'),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: textFill,
                                  ),
                                  value: _id,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _id = newValue;
                                      clear();
                                      fetchData();
                                    });
                                  },
                                  items: _ids.map((location) {
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
                              textField(_name, width * 0.6, 40.0, true, 'Name'),
                              SizedBox(
                                height: 15,
                              ),
                              textField(_ssin, width * 0.6, 40.0, true, 'SSIN'),
                              SizedBox(
                                height: 15,
                              ),
                              textField(_social, width * 0.6, 40.0, true,
                                  'Social Number'),
                              SizedBox(
                                height: 15,
                              ),
                              textField(_phone, width * 0.6, 40.0, true,
                                  'Phone Number'),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _email, width * 0.6, 40.0, true, 'Email'),
                              SizedBox(
                                height: 15,
                              ),
                              passwordField(_pass, width * 0.6, 60.0, password,
                                  false, hidePassword),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: width * 0.6,
                                child: CSCPicker(
                                  showStates: true,
                                  showCities: true,
                                  flagState: CountryFlag.DISABLE,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.grey.shade300, width: 1),
                                  ),
                                  disabledDropdownDecoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.grey.shade300,
                                    border: Border.all(
                                        color: Colors.grey.shade300, width: 1),
                                  ),
                                  defaultCountry: DefaultCountry.Egypt,
                                  selectedItemStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  dropdownHeadingStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                  dropdownItemStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  dropdownDialogRadius: 10.0,
                                  searchBarRadius: 10.0,
                                  onCountryChanged: (value) {
                                    setState(() {
                                      _countryValue = value;
                                    });
                                  },
                                  onStateChanged: (value) {
                                    setState(() {
                                      _stateValue = value;
                                    });
                                  },
                                  onCityChanged: (value) {
                                    setState(() {
                                      _cityValue = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _street, width * 0.6, 40.0, true, 'Street'),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _address, width * 0.6, 40.0, true, 'Address'),
                              SizedBox(
                                height: 15,
                              ),
                              textField(_department, width * 0.6, 40.0, true,
                                  'Department'),
                              SizedBox(
                                height: 15,
                              ),
                              /*Container(
                                width: width * 0.6,
                                height: 50.0,
                                child: DropdownButtonFormField(
                                  hint: Text('User Type'),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: textFill,
                                  ),
                                  value: _user,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _user = newValue;
                                    });
                                  },
                                  items: _type.map((location) {
                                    return DropdownMenuItem(
                                      child: new Text(location),
                                      value: location,
                                    );
                                  }).toList(),
                                ),
                              ),*/
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // implementing a row widget to call custom buttons and align them.
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          actionButtons('Apply', () {
                            applyUser();
                            Alert(
                              context: context,
                              title: message1 ? 'Applied' : 'Couldn\'t Apply',
                              buttons: [
                                DialogButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "OK",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                  color: hoverColor,
                                )
                              ],
                            ).show();
                            fetchData();
                          }, Colors.green),
                          SizedBox(
                            width: 60,
                          ),
                          actionButtons('Delete', () {
                            Alert(
                              context: context,
                              title:
                                  'Are you sure you want to Delete this User',
                              buttons: [
                                DialogButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    delete();
                                  },
                                  child: Text(
                                    "Yes",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                  color: hoverColor,
                                )
                              ],
                            ).show();
                            clear();
                          }, Colors.red.shade900),
                          SizedBox(
                            width: 60,
                          ),
                          actionButtons('Data Table', () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UsersDataTable()));
                          }, Colors.blue.shade600),
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
      floatingActionButton: ChatButton(),
    );
  }
}
