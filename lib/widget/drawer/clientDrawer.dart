// @dart=2.9
import 'package:erp/Client/Application/application.dart';
import 'package:erp/Client/LogIn/logIn.dart';
import 'package:erp/constants.dart';
import 'package:flutter/material.dart';

// custom Drawer Widget for the Client System
class ClientDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: primaryColor,
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Image.asset(
                  'assets/logo.png',
                ),
              ),
              decoration: BoxDecoration(
                color: secondaryColor,
              ),
            ),
            ListTileTheme(
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: textColor,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Application(),
                    ),
                  );
                },
              ),
            ),
            ListTileTheme(
              child: ListTile(
                leading: Icon(
                  Icons.account_circle_outlined,
                  color: textColor,
                ),
                title: Text(
                  'User Name',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                  ),
                ),
                onTap: () {},
              ),
            ),
            ListTileTheme(
              child: ListTile(
                leading: Icon(
                  Icons.input_sharp,
                  color: textColor,
                ),
                title: Text(
                  'Log Out',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LogIn(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
