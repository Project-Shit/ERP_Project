// @dart=2.9
import 'dart:convert';

import 'package:erp/Client/Application/application.dart';
import 'package:erp/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oktoast/oktoast.dart';

class LogInDesktop extends StatefulWidget {
  @override
  _LogInDesktopState createState() => _LogInDesktopState();
}

class _LogInDesktopState extends State<LogInDesktop> {
  final _mailController = TextEditingController();
  final _passController = TextEditingController();
  bool password = true;
  bool status = true;
  String userName = '';
  var logInAPI = 'http://192.168.1.104/ERP/logIn.php';
  var data, response;

  // function to change password field text's visibility
  void hidePassword() {
    setState(() {
      password = !password;
    });
  }

  // function to log In
  logIn() async {
    try {
      data = {
        "mail": _mailController.text,
        "pass": _passController.text,
      };
      response = await http.post(Uri.parse(logInAPI), body: data);
      var user = json.decode(response.body);
      if (user == 'Success') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Application()));
      } else {
        showToast('Incorrect Email or Password', position: ToastPosition.top);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return OKToast(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width, 60),
          child: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
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
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.4,
                  height: 400,
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
                    padding: EdgeInsets.all(50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        labelText('Email'),
                        SizedBox(
                          height: 15,
                        ),
                        textField(_mailController, width, 45.0, true),
                        SizedBox(
                          height: 20,
                        ),
                        labelText('Password'),
                        SizedBox(
                          height: 15,
                        ),
                        passwordField(_passController, width, 45.0, password,
                            false, hidePassword),
                        SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: width * 0.2,
                              height: 60,
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                ),
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: textColor,
                                  ),
                                ),
                                onPressed: () {
                                  logIn();
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
