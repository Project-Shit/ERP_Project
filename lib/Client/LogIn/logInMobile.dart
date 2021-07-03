// @dart=2.9
import 'package:erp/constants.dart';
import 'package:flutter/material.dart';

class LogInMobile extends StatefulWidget {
  @override
  _LogInMobileState createState() => _LogInMobileState();
}

class _LogInMobileState extends State<LogInMobile> {
  final _mailController = TextEditingController();
  final _passController = TextEditingController();
  bool password = true;

  // function to change password field text's visibility
  void hidePassword() {
    setState(() {
      password = !password;
    });
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
      body: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: height * 0.15,
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
                        onPressed: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
