import 'package:flutter/material.dart';

// Colors
// ignore: non_constant_identifier_names
Color PrimaryColor = Colors.white;
// ignore: non_constant_identifier_names
Color SecondaryColor = Color(0xFF1D1D1D);
// ignore: non_constant_identifier_names
Color TextColor = Colors.black;
// ignore: non_constant_identifier_names
Color HoverColor = Color(0xFF00B9FF);

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

Widget labelButton(String title, VoidCallback onTap) {
  // ignore: deprecated_member_use
  return FlatButton(
    child: Text(
      title,
      style: TextStyle(
        color: SecondaryColor,
        fontSize: 20,
      ),
    ),
    height: 40,
    hoverColor: PrimaryColor,
    onPressed: onTap,
  );
}
