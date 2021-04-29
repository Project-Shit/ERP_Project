import 'package:erb/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:erb/constants.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:page_transition/page_transition.dart';

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
