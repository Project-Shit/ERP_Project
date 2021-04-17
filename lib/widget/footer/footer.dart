import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/copyright.png',
              width: 20,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              'All Right Reserved by Nerd\'s Team',
            ),
          ],
        ),
      ],
    );
  }
}
