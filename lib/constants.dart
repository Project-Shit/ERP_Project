import 'package:flutter/material.dart';

// Colors
// ignore: non_constant_identifier_names
Color PrimaryColor = Colors.white;
// ignore: non_constant_identifier_names
Color SecondaryColor = Color(0xFF898989);
// ignore: non_constant_identifier_names
Color TextColor = Color(0xFF1D1D1D);
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
    height: 100,
  );
}

Widget labelButton(String title, VoidCallback onTap) {
  // ignore: deprecated_member_use
  return FlatButton(
    child: Text(
      title,
      style: TextStyle(
        color: TextColor,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    ),
    height: 50,
    hoverColor: PrimaryColor,
    onPressed: onTap,
  );
}

Widget actionButtons(String title, VoidCallback onTap, Color color) {
  return Container(
    width: 300,
    height: 70,
    // ignore: deprecated_member_use
    child: RaisedButton(
      color: color,
      padding: EdgeInsets.only(
        top: 20,
        bottom: 20,
        left: 35,
        right: 35,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Text(
            title,
            style: TextStyle(
              fontSize: 30,
              color: TextColor,
            ),
          ),
      onPressed: onTap,
    ),
  );
}

Widget labelText(String title) {
  return Text(
    title,
    style: TextStyle(
      color: TextColor,
      fontSize: 30,
    ),
  );
}
