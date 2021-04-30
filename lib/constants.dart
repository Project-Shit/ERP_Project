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
// ignore: non_constant_identifier_names
Color WidgetColor = Color(0xFFECECEC);

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
    height: 100,
  );
}

Widget labelButton(String title, VoidCallback onTap) {
  // ignore: deprecated_member_use
  return FlatButton(
    child: Text(
      title,
      style: TextStyle(
        color: SecondaryColor,
        fontSize: 15,
        fontWeight: FontWeight.w300,
      ),
    ),
    height: 50,
    hoverColor: PrimaryColor,
    onPressed: onTap,
  );
}
