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
                color: WidgetColor,
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
                  Icons.widgets_outlined,
                  color: TextColor,
                ),
                title: Text(
                  'Apps',
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
                  Icons.attach_money,
                  color: TextColor,
                ),
                title: Text(
                  'Pricing',
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
                  Icons.support_agent,
                  color: TextColor,
                ),
                title: Text(
                  'Support',
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
                  'Sign in',
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
