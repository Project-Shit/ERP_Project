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

  forgetPassword(){
    Alert(
      context: context,
      title: 'Enter Your Email to Send Verification Code',
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          textField(_mail, 400, 35.0, false,'Email'),
          SizedBox(
            height: 20,
          ),
          textField(_phone, 400, 35.0, false,'Phone Number'),
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
          color: hoverColor,
        )
      ],
    ).show();
  }


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, 60),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          iconTheme: IconThemeData(
            color: textColor,
          ),
          backgroundColor: secondaryColor,
          title: Image.asset(
            'assets/logo.png',
            height: 50,
          ),
          centerTitle: true,
        ),
      ),
      body: WillPopScope(
        // ignore: missing_return
        onWillPop: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
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
                    padding: EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        textField(_mail, width * 0.3, 45.0, false,'Email'),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        passwordField(_pass, width * 0.3, 60.0, password,
                            false, hidePassword),

                        labelButton('Forget Password',(){
                          forgetPassword();
                        }),
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
