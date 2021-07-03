// @dart=2.9
import 'package:erp/Client/Application/application.dart';
import 'package:flutter/material.dart';
import 'package:erp/constants.dart';

// Custom AppBar for the client's system
class ClientAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 0,
          right: 0,
        ),
        child: Container(
          color: Colors.white,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              'Company Name',
              style: TextStyle(

                fontSize: 30,
                color: textColor,
              ),
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
            appButton('Product',() {} ),
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
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    )
    );
  }
}
