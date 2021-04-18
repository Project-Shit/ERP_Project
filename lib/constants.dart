import 'package:flutter/material.dart';

// Colors
// ignore: non_constant_identifier_names
Color PrimaryColor = Colors.white;
// ignore: non_constant_identifier_names
Color TextColor = Colors.black;
// ignore: non_constant_identifier_names
Color HoverColor = Colors.blue.shade700;

// Custom Button
Widget appButton(String title, VoidCallback onTap) {
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
