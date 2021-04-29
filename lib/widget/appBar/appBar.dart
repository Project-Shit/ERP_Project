import 'package:flutter/material.dart';
import 'package:erb/constants.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 90,
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
              'Apps',
              () {},
            ),
            SizedBox(
              width: 20,
            ),
            appButton(
              'Pricing',
              () {},
            ),
            SizedBox(
              width: 20,
            ),
            appButton(
              'Support',
              () {},
            ),
            SizedBox(
              width: 20,
            ),
            appButton(
              'Sign In',
              () {},
            ),
          ],
        ),
      ),
    );
  }
}
