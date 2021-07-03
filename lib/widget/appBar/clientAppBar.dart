// @dart=2.9
import 'package:erp/Client/Application/application.dart';
import 'package:erp/Client/LogIn/logIn.dart';
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
<<<<<<< HEAD
            SizedBox(
              width: 20,
            ),
            Text(
              'Company Name',
              style: TextStyle(

                fontSize: 30,
                color: textColor,
              ),
=======
            Image.asset(
              'assets/logo.png',
>>>>>>> 39b4ebd0cbf4e0f615e9f88f7fe117b712887113
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
<<<<<<< HEAD
            appButton('Product',() {} ),
            SizedBox(
              width: 20,
            ),
            appButton(
              'User Name',
              () {},
            ),
=======
            labelText('UserName'),
>>>>>>> 39b4ebd0cbf4e0f615e9f88f7fe117b712887113
            SizedBox(
              width: 20,
            ),
            appButton(
              'Log Out',
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LogIn(),
                  ),
                );
              },
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