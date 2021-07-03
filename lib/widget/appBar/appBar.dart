// @dart=2.9
import 'package:erp/System/home/home.dart';
import 'package:flutter/material.dart';
import 'package:erp/constants.dart';
import 'package:page_transition/page_transition.dart';

// Custom AppBar Widget for the main System
class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 90,
          right: 90,
          top: 0,
          bottom: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  child: Home(),
                  type: PageTransitionType.fade,
                  duration: Duration(milliseconds: 100),
                ),
              ),
              child: Image.asset(
                'assets/logo.png',

              ),
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
