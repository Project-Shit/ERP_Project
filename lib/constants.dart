// @dart=2.9
import 'package:flutter/material.dart';

// implementing the main colors for the all system
Color primaryColor = Colors.white;
Color secondaryColor = Color(0xFF898989);
Color textColor = Color(0xFF1D1D1D);
Color hoverColor = Color(0xFF00B9FF);

// initializing variables for backend
var setData = 'http://192.168.1.104/ERP/setAPI.php';
var getData = 'http://192.168.1.104/ERP/getAPI.php';
var conditionAPI = 'http://192.168.1.104/ERP/condition.php';
var data, response;

// Custom AppBar Buttons
Widget appButton(String title, VoidCallback onTap) {
  // ignore: deprecated_member_use
  return FlatButton(
    child: Text(
      title,
      style: TextStyle(
        color: textColor,
        fontSize: 20,
      ),
    ),
    hoverColor: hoverColor,
    onPressed: onTap,
    height: 100,
  );
}

// Custom Flat Button for Home Page
Widget labelButton(String title, VoidCallback onTap) {
  // ignore: deprecated_member_use
  return FlatButton(
    child: Text(
      title,
      style: TextStyle(
        color: textColor,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    ),
    height: 50,
    hoverColor: primaryColor,
    onPressed: onTap,
  );
}

// Custom Button for all pages to act on database
Widget actionButtons(String title, VoidCallback onTap, Color color) {
  return Container(
    width: 200,
    height: 50,
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
          fontSize: 22,
          color: textColor,
        ),
      ),
      onPressed: onTap,
    ),
  );
}

// Custom Text Field
Widget textField(
    TextEditingController text, double width, double height, bool status,[String hint]) {
  return Container(
    width: width,
    height: height,
    child: TextFormField(
      enabled: status,
      controller: text,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        filled: true,
      ),
    ),
  );
}

// Custom Password Field
Widget passwordField(TextEditingController text, double width, double height,
    bool password, bool status, VoidCallback onTap) {
  return Container(
    width: width,
    height: height,
    child: TextFormField(
      readOnly: status,
      controller: text,
      style: TextStyle(
        color: textColor,
      ),
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: IconButton(
            icon: Icon(password ? Icons.visibility_off : Icons.visibility),
            onPressed: onTap,
          ),
        ),
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            new Radius.circular(
              10.0,
            ),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            new Radius.circular(
              10.0,
            ),
          ),
        ),
      ),
      obscureText: password,
    ),
  );
}

// Custom Label with Text
Widget labelText(String title) {
  return Text(
    title,
    style: TextStyle(
      color: textColor,
      fontSize: 22,
    ),
  );
}

// Custom Card for Home Page
Widget applicationCard(
    String title, double width, double height, VoidCallback onTap) {
  return InkWell(
    child: Container(
      padding: EdgeInsets.only(
        top: 30,
        bottom: 30,
      ),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          width: 3,
          color: secondaryColor,
        ),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    ),
    onTap: onTap,
    hoverColor: hoverColor,
    borderRadius: BorderRadius.circular(10.0),
  );
}