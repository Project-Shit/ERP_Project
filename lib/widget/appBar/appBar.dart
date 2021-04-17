import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 50,
      ),
          child: Row(
            children: [
              Image.asset('assets/logo.png'),
            ],
          ),
    ));
  }
}
