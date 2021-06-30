// @dart=2.9
import 'dart:convert';
import 'package:erp/Client/Application/application.dart';
import 'package:erp/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

class LogInMobile extends StatefulWidget {
  @override
  _LogInMobileState createState() => _LogInMobileState();
}

class _LogInMobileState extends State<LogInMobile> {
  final _mailController = TextEditingController();
  final _passController = TextEditingController();
  bool password = true;
  String userName = '';

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
        Alert(
          context: context,
          title: 'Incorrect Email or Password',
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
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Media Query object for responsive layout
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primaryColor,
      // implementing the client's AppBar
      appBar: PreferredSize(
        preferredSize: Size(width, 60),
        child: AppBar(
          automaticallyImplyLeading: false,
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
      // implementing th body with scroll View and container widget
      body: WillPopScope(
        // ignore: missing_return
        onWillPop: () {},
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: height * 0.1,
              bottom: 20,
            ),
            child: Container(
              width: width,
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
                padding: EdgeInsets.only(
                  top: 50,
                  bottom: 50,
                  left: 20,
                  right: 20,
                ),
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
                    passwordField(_passController, width, 45.0, password, false,
                        hidePassword),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: width * 0.6,
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
