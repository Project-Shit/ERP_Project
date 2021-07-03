// @dart=2.9
import 'package:erp/constants.dart';
import 'package:flutter/material.dart';

// Custom Drawer Widget for the main System
class CustomDrawer extends StatelessWidget {
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
                  width: 230,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
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
                onTap: () {},
              ),
            ),
            ListTileTheme(
              child: ListTile(
                leading: Icon(
                  Icons.widgets_outlined,
                  color: textColor,
                ),
                title: Text(
                  'Apps',
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
                  Icons.attach_money,
                  color: textColor,
                ),
                title: Text(
                  'Pricing',
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
                  Icons.support_agent,
                  color: textColor,
                ),
                title: Text(
                  'Support',
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
                  'Sign in',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                  ),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
