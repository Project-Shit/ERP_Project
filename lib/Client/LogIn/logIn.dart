// @dart=2.9
import 'dart:convert';
import 'package:erp/Client/Application/application.dart';
import 'package:erp/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _mail = TextEditingController();
  final _pass = TextEditingController();
  final _phone = TextEditingController();
  final _restore = TextEditingController();
  bool password = true;

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
        "command":
            "select * from users where email = '${_mail.text}' and password = '${_pass.text}'"
      };
      response = await http.post(Uri.parse(conditionAPI), body: data);
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

  Future<Null> check() async {
    try {
      data = {
        "command":
            "select * from users where email = '${_mail.text}' and phone = '${_phone.text}'"
      };
      return await http
          .post(Uri.parse(getData), body: data)
          .then((http.Response response) {
        final List fetchData = json.decode(response.body);
        fetchData.forEach((user) {
          setState(() {
            _restore.text = user['password'];
          });
        });
        restore();
      });
    } catch (e) {
      print(e);
    }
  }

  restore() async {
    try {
      data = {
        "email": _mail.text,
        "restore": _restore.text,
      };
      response = await http.post(Uri.parse(mail), body: data);
      Navigator.pop(context);
      _mail.text = '';
    } catch (e) {
      print(e);
    }
  }

  forgetPassword() {
    Alert(
      context: context,
      title: 'Enter your Email and Phone Number\nto Restore your Password',
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          textField(_mail, 400, 35.0, false, 'Email'),
          SizedBox(
            height: 20,
          ),
          textField(_phone, 400, 35.0, false, 'Phone Number'),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            check();
          },
          child: Text(
            "Send",
            style: TextStyle(
              color: textFill,
              fontSize: 20,
            ),
          ),
          color: darkBlue,
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('log.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: WillPopScope(
          // ignore: missing_return
          onWillPop: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 120,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.fill,
                      height: 170,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  textField(_mail, width * 0.3, 45.0, false, 'Email'),
                  SizedBox(
                    height: 15,
                  ),
                  passwordField(
                      _pass, width * 0.3, 45.0, password, false, hidePassword),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: width * 0.3,
                    height: 60,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      color: darkBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 30,
                          color: textFill,
                        ),
                      ),
                      onPressed: () {
                        logIn();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  labelButton('Forget Password', () {
                    forgetPassword();
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
