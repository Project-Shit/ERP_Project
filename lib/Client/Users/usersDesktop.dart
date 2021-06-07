// @dart=2.9
import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsersDesktop extends StatefulWidget {
  @override
  _UsersDesktopState createState() => _UsersDesktopState();
}

// adding user page for the client's system
class _UsersDesktopState extends State<UsersDesktop> {
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
      // calling the client's custom AppBar
      appBar: PreferredSize(
        preferredSize: Size(width, 70),
        child: ClientAppBar(),
      ),
      // implementing th body with scroll View and row widget
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 30,
            bottom: 30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // implementing a container to make the outline border design
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      50.0,
                    ),
                    border: Border.all(
                      color: textColor,
                      width: 2,
                    )),
                width: width * 0.7,
                height: 620,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 70,
                    right: 70,
                  ),
                  // implementing a column widget to align the rest of the widget
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // implementing a container to implement a search box
                      Container(
                        width: width,
                        height: 40,
                        child: TextFormField(
                          style: TextStyle(
                            color: textColor,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(
                                right: 10,
                              ),
                              child: IconButton(
                                icon: Icon(Icons.search),
                                onPressed: () {},
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
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // implementing a column to call custom label widget with sizedBox between them
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              labelText('ID'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Name'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Phone'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Email'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Password'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Address'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Department'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('User Type'),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.04,
                          ),
                          // implementing a column to call custom drop down list, text field and
                          // password field widget with sizedBox between them.
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              dropList(_locations, _selectedLocation,
                                  width * 0.49, 40.0, setValue),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.49, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.49, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.49, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              passwordField(width * 0.49, 40.0, password, true,
                                  hidePassword),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.49, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              dropList(_locations, _selectedLocation,
                                  width * 0.49, 40, setValue),
                              SizedBox(
                                height: 15,
                              ),
                              dropList(_locations, _selectedLocation,
                                  width * 0.49, 40.0, setValue),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      // implementing a row widget to call custom buttons and align them.
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          actionButtons('Apply', () {}, Colors.green),
                          SizedBox(
                            width: 80,
                          ),
                          actionButtons('Delete', () {}, Colors.red.shade900),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
