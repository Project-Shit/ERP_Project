// @dart=2.9
import 'package:erp/Client/Application/application.dart';
import 'package:erp/Client/LogIn/logIn.dart';
import 'package:flutter/material.dart';
import 'package:erp/constants.dart';

// Custom AppBar for the client's system
class ClientAppBar extends StatefulWidget {
  final String userName;

  ClientAppBar({this.userName});

  @override
  State<ClientAppBar> createState() => _ClientAppBarState();
}

class _ClientAppBarState extends State<ClientAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: darkBlue.withOpacity(0.3),
        child: Padding(
          padding: EdgeInsets.only(
            left: 120,
            right: 120,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.fill,
                  height: 140,
                ),
              ),
              Spacer(
                flex: 2,
              ),
              appButton(
                'Home',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Application(
                        title: widget.userName,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                widget.userName,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                width: 20,
              ),
              appButton(
                'Log Out',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LogIn(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
