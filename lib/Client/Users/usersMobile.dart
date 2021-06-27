// @dart=2.9
import 'dart:convert';
import 'package:erp/constants.dart';
import 'package:erp/widget/drawer/clientDrawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersMobile extends StatefulWidget {
  @override
  _UsersMobileState createState() => _UsersMobileState();
}

// viewing all user page for the client's system
class _UsersMobileState extends State<UsersMobile> {
  // objects implementation
  // ignore: deprecated_member_use
  List _locations = List();
  String _selectedLocation;
  bool password = true;
  TextEditingController _name = TextEditingController();
  TextEditingController _ssin = TextEditingController();
  TextEditingController _social = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _department = TextEditingController();
  TextEditingController _userType = TextEditingController();
  var setDate = 'http://192.168.1.104/ERP/setAPI.php';
  var getData = 'http://192.168.1.104/ERP/getAPI.php';
  var data, response;

  // function to change password field text's visibility
  void hidePassword() {
    setState(() {
      password = !password;
    });
  }

  // function to fetch data from database
  Future<Null> fetchData() async {
    try {
      data = {
        "command":
            "select * from users where id = '${_selectedLocation.toString()}'"
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
            _userType.text = user['userType'];
          });
        });
      });
    } catch (e) {
      print(e);
    }
  }

  // function to set data to drop list
  Future idList() async {
    try {
      data = {"command": "select id from users"};
      http.post(Uri.parse(getData), body: data).then((http.Response response) {
        var fetchDecode = jsonDecode(response.body);
        fetchDecode.forEach((users) {
          setState(() {
            _locations.add(users['id']);
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
      backgroundColor: primaryColor,
      // implementing the client's AppBar
      appBar: PreferredSize(
        preferredSize: Size(width, 60),
        child: AppBar(
          iconTheme: IconThemeData(
            color: textColor,
          ),
          backgroundColor: primaryColor,
          title: Text(
            'Company Name',
            style: TextStyle(
              color: textColor,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),
      ),
      // calling the client's custom Drawer
      drawer: ClientDrawer(),
      // implementing th body with scroll View and container widget
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                50.0,
              ),
              border: Border.all(
                color: textColor,
                width: 2,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 50,
                bottom: 50,
                left: 20,
                right: 20,
              ),
              // implementing a column widget to add custom widgets labels, text field,
              // drop down list, password field and sizedBox between them.
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  labelText('ID'),
                  Container(
                    width: width,
                    height: 55.0,
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
                          child: Text(location),
                          value: location,
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Name'),
                  textField(_name, width, 50.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('SSIN'),
                  textField(_ssin, width, 50.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Social Number'),
                  textField(_social, width, 50.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Phone'),
                  textField(_phone, width, 50.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Email'),
                  textField(_email, width, 50.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Password'),
                  passwordField(
                      _pass, width, 50.0, password, true, hidePassword),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Address'),
                  textField(_address, width, 50.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Department'),
                  textField(_department, width, 50.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('User Type'),
                  textField(_userType, width, 50.0, false),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
