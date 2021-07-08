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
      data = {"command": "select id from users order by id"};
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
            color: primaryColor,
          ),
          backgroundColor: secondaryColor,
          title: Image.asset(
            'assets/logo.png',
            height: 50,
          ),
          centerTitle: true,
        ),
      ),
      // calling the client's custom Drawer
      drawer: ClientDrawer(),
      // implementing th body with scroll View and container widget
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
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
                top: 30,
                bottom: 30,
                left: 20,
                right: 20,
              ),
              // implementing a column widget to add custom widgets labels, text field,
              // drop down list, password field and sizedBox between them.
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 55.0,
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
                  textField(_name, width, 50.0, false,'Name'),
                  SizedBox(
                    height: 20,
                  ),
                  textField(_ssin, width, 50.0, false,'SSIN'),
                  SizedBox(
                    height: 20,
                  ),
                  textField(_social, width, 50.0, false,'Social Number'),
                  SizedBox(
                    height: 20,
                  ),
                  textField(_phone, width, 50.0, false,'Phone Number'),
                  SizedBox(
                    height: 20,
                  ),
                  textField(_email, width, 50.0, false,'Email'),
                  SizedBox(
                    height: 20,
                  ),
                  passwordField(
                      _pass, width, 50.0, password, true, hidePassword),
                  SizedBox(
                    height: 20,
                  ),
                  textField(_address, width, 50.0, false,'Address'),
                  SizedBox(
                    height: 20,
                  ),
                  textField(_department, width, 50.0, false,'Department'),
                  SizedBox(
                    height: 20,
                  ),
                  textField(_userType, width, 50.0, false,'User Type'),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
