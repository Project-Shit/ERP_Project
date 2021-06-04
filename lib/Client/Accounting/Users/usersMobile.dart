// @dart=2.9
import 'package:erp/constants.dart';
import 'package:erp/widget/drawer/clientDrawer.dart';
import 'package:flutter/material.dart';

class UsersMobile extends StatefulWidget {
  @override
  _UsersMobileState createState() => _UsersMobileState();
}

// viewing all user page for the client's system
class _UsersMobileState extends State<UsersMobile> {
  // objects implementation
  List<String> _locations = [];
  String _selectedLocation;
  bool password = true;
  final _textController = TextEditingController();

  // function to change password field text's visibility
  void hidePassword() {
    setState(() {
      password = !password;
    });
  }

  // function to change the value in the drop down list to the selected value
  void setValue() {
    String value = '';
    setState(() {
      _selectedLocation = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Media Query object for responsive layout
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryColor,
      // implementing the client's AppBar
      appBar: PreferredSize(
        preferredSize: Size(width, 60),
        child: AppBar(
          iconTheme: IconThemeData(
            color: textColor,
          ),
          backgroundColor: primaryColor,
          title: Text(
            'Company Name',
            style: TextStyle(
              color: textColor,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),
      ),
      // calling the client's custom Drawer
      drawer: ClientDrawer(),
      // implementing th body with scroll View and container widget
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                50.0,
              ),
              border: Border.all(
                color: textColor,
                width: 2,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 50,
                bottom: 50,
                left: 20,
                right: 20,
              ),
              // implementing a column widget to add custom widgets labels, text field,
              // drop down list, password field and sizedBox between them.
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  labelText('ID'),
                  dropList(_locations, _selectedLocation, width * 0.9, 45.0,
                      setValue),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Name'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Phone'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Email'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Password'),
                  passwordField(
                      width * 0.9, 45.0, password, false, hidePassword),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Address'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Department'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('User Type'),
                  textField(_textController, width, 45.0, false),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
