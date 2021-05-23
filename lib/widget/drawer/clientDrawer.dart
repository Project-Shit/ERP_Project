import 'package:erp/constants.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: PrimaryColor,
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
                  color: TextColor,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: TextColor,
                    fontSize: 20,
                  ),
                ),
                onTap: () {},
              ),
            ),
            ListTileTheme(
              child: ListTile(
                leading: Icon(
                  Icons.account_circle_outlined,
                  color: TextColor,
                ),
                title: Text(
                  'User Name',
                  style: TextStyle(
                    color: TextColor,
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
                  color: TextColor,
                ),
                title: Text(
                  'Log Out',
                  style: TextStyle(
                    color: TextColor,
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