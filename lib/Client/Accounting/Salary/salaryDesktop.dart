// @dart=2.9
import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:flutter/material.dart';

class SalaryDesktop extends StatefulWidget {
  @override
  _SalaryDesktopState createState() => _SalaryDesktopState();
}

// Salary accounting page for the client's system
class _SalaryDesktopState extends State<SalaryDesktop> {
  // objects implementation
  List<String> _locations = [];
  String _selectedLocation;
  final _textController = TextEditingController();

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
                height: 700,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 70, right: 70, top: 30, bottom: 30),
                  child: Column(
                    children: [
                      // implementing a row widget to align the rest of the widget
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // implementing a column to call custom label widget with sizedBox between them
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              labelText('Employee ID'),
                              SizedBox(
                                height: 25,
                              ),
                              labelText('Employee Name'),
                              SizedBox(
                                height: 25,
                              ),
                              labelText('Department'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Payment Type'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Working Hours'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Salary'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Insurance'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Tax on Salary'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Deduction'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Net Salary'),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.04,
                          ),
                          // implementing a column to call custom drop down list, text field with sizedBox between them.
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              dropList(_locations, _selectedLocation,
                                  width * 0.46, 40.0, setValue),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.46, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              dropList(_locations, _selectedLocation,
                                  width * 0.46, 40.0, setValue),
                              SizedBox(
                                height: 15,
                              ),
                              dropList(_locations, _selectedLocation,
                                  width * 0.46, 40.0, setValue),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.46, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.46, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.46, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.46, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.46, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.46, 40.0, true),
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
                          actionButtons('Print Report', () {}, Colors.blue),
                          SizedBox(
                            width: 80,
                          ),
                          actionButtons('Apply', () {}, Colors.green),
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
