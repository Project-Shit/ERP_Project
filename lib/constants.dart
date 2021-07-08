// @dart=2.9
import 'package:flutter/material.dart';

// implementing the main colors for the all system
Color primaryColor = Color.fromRGBO(16, 16, 16, 1);
Color secondaryColor = Color.fromRGBO(32, 32, 32, 1);
Color textColor = Color(0xFF1D1D1D);
Color hoverColor = Color.fromRGBO(128, 128, 128, 1);
Color textFill = Colors.white;

// initializing variables for backend
var setData = 'http://localhost/ERP/setAPI.php';
var getData = 'http://localhost/ERP/getAPI.php';
var conditionAPI = 'http://localhost/ERP/condition.php';
var data, response;



// Custom AppBar Buttons
Widget appButton(String title, VoidCallback onTap) {
  // ignore: deprecated_member_use
  return FlatButton(
    child: Text(
      title,
      style: TextStyle(
        color: textFill,
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
        color: Colors.blue.shade900,
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
    width: 150,
    height: 40,
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
          fontSize: 15,
          color: textColor,
        ),
      ),
      onPressed: onTap,
    ),
  );
}

// Custom Text Field
Widget textField(TextEditingController text, double width, double height,
    bool status, String hint,[int limit]) {
  return Container(
    width: width,
    height: height,
    child: TextFormField(
      readOnly: status,
      controller: text,
      maxLength: limit,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide:
              BorderSide(width: 5, color: Color.fromRGBO(32, 32, 32, 1)),
        ),
        labelText: hint,
        filled: true,
        fillColor: textFill,
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
      maxLength: 20,
      readOnly: status,
      controller: text,
      style: TextStyle(
        color: textColor,
      ),
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: IconButton(
            icon: Icon(password ? Icons.visibility_off : Icons.visibility),
            onPressed: onTap,
          ),
        ),
        fillColor: textFill,
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

// Custom Card for Home Page
Widget applicationCard(
    String title, double width, double height, VoidCallback onTap) {
  return InkWell(
    child: Container(
      padding: EdgeInsets.only(
        top: 10,
        bottom:10,
      ),
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0.0),
        border: Border.all(
          width: 1,
          color: secondaryColor,
        ),
      ),
      child:  Image.asset(title,height: 500,width: 500,color: Color.fromRGBO(50, 20, 200, 1),)
    ),
    onTap: onTap,
    hoverColor: hoverColor,
    borderRadius: BorderRadius.circular(10.0),
  );
}
