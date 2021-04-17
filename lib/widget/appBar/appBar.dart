import 'package:flutter/material.dart';
import 'package:erb/constants.dart';

Widget _appBarButton(String title, VoidCallback onTap) {
  // ignore: deprecated_member_use
  return FlatButton(
    child: Text(
      title,
      style: TextStyle(
        color: TextColor,
        fontSize: 20,
      ),
    ),
    hoverColor: HoverColor,
    onPressed: onTap,
    height: 70,
  );
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 100,
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
            _appBarButton(
              'Apps',
              () {},
            ),
            SizedBox(
              width: 20,
            ),
            _appBarButton(
              'Pricing',
              () {},
            ),
            SizedBox(
              width: 20,
            ),
            _appBarButton(
              'Support',
              () {},
            ),
            SizedBox(
              width: 20,
            ),
            _appBarButton(
              'Sign In',
              () {},
            ),
          ],
        ),
      ),
    );
  }
}
