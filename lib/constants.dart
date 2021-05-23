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

Widget textField(TextEditingController text, double w){
  return Container(
    width: w,
    child: TextFormField(
      controller: text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        filled: true,
        fillColor: SecondaryColor,
      ),
    ),
  );
}

Widget dropList(List<String> list, String selected, double w, VoidCallback change) {
  return Container(
    width: w,
    child: DropdownButtonFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        filled: true,
        fillColor: SecondaryColor,
      ),
      value: selected,
      onChanged: (newValue) => change,
      items: list.map((location) {
        return DropdownMenuItem(
          child: new Text(location),
          value: location,
        );
      }).toList(),
    ),
  );
}

Widget passwordField(double w, bool password, VoidCallback onTap){
  return Container(
    width: w,
    child: TextFormField(
      style: TextStyle(
        color: TextColor,
      ),
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: IconButton(
            icon: Icon(
                password? Icons.visibility_off : Icons.visibility
            ),
            onPressed: onTap,
          ),
        ),
        fillColor: SecondaryColor,
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

Widget labelText(String title) {
  return Text(
    title,
    style: TextStyle(
      color: TextColor,
      fontSize: 30,
    ),
  );
}
