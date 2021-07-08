// @dart=2.9
import 'package:erp/Client/Application/application.dart';
import 'package:erp/Client/LogIn/logIn.dart';
import 'package:flutter/material.dart';
import 'package:erp/constants.dart';

// Custom AppBar for the client's system
class ClientAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: secondaryColor,
        child: Padding(
          padding: EdgeInsets.only(
            left: 90,
            right: 90,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/logo.png',
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
                      builder: (context) => Application(),
                    ),
                  );
                },
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