import 'package:flutter/material.dart';
import 'package:erp/constants.dart';

class ClientAppBar extends StatelessWidget {
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
            Text(
              'Company Name',
              style: TextStyle(
                fontSize: 30,
                color: TextColor,
              ),
            ),
            Spacer(
              flex: 2,
            ),
            appButton(
              'Home',
              () {},
            ),
            SizedBox(
              width: 20,
            ),
            appButton(
              'User Name',
              () {},
            ),
            SizedBox(
              width: 20,
            ),
            appButton(
              'Log Out',
              () {},
            ),
          ],
        ),
      ),
    );
  }
}
