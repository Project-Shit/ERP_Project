// @dart=2.9
import 'package:erp/constants.dart';
import 'package:erp/widget/drawer/clientDrawer.dart';
import 'package:flutter/material.dart';

class UsersMobile extends StatefulWidget {
  @override
  _UsersMobileState createState() => _UsersMobileState();
}

class _UsersMobileState extends State<UsersMobile> {
  List<String> _locations = [];
  String _selectedLocation;
  bool password = true;
  TextEditingController _textController;

  void hidePassword() {
    setState(() {
      password = !password;
    });
  }

  void setValue() {
    String value = '';
    setState(() {
      _selectedLocation = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: PrimaryColor,
      appBar: PreferredSize(
        preferredSize: Size(width, 60),
        child: AppBar(
          iconTheme: IconThemeData(
            color: TextColor,
          ),
          backgroundColor: PrimaryColor,
          title: Text(
            'Company Name',
            style: TextStyle(
              color: TextColor,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),
      ),
      drawer: ClientDrawer(),
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
                color: TextColor,
                width: 2,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 50,bottom: 50,left: 20,right: 20,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  labelText('ID'),
                  dropList(_locations, _selectedLocation, width * 0.9,45.0, setValue),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Name'),
                  textField(_textController,width,45.0,false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Phone'),
                  textField(_textController,width,45.0,false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Email'),
                  textField(_textController,width,45.0,false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Password'),
                  passwordField(width * 0.9,45.0,password,false,hidePassword),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Address'),
                  textField(_textController,width,45.0,false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Department'),
                  textField(_textController,width,45.0,false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('User Type'),
                  textField(_textController,width,45.0,false),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
