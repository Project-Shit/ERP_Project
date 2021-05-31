// @dart=2.9
import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:flutter/material.dart';

class SalaryDesktop extends StatefulWidget {
  @override
  _SalaryDesktopState createState() => _SalaryDesktopState();
}

class _SalaryDesktopState extends State<SalaryDesktop> {
  List<String> _locations = [];
  String _selectedLocation;
  final _textController = TextEditingController();

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
      appBar: PreferredSize(
        preferredSize: Size(width, 70),
        child: ClientAppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 40,
            bottom: 40,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      50.0,
                    ),
                    border: Border.all(
                      color: TextColor,
                      width: 2,
                    )),
                width: width * 0.75,
                height: 1000,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 100,
                    right: 100,
                    top: 60,
                    bottom: 60,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              labelText('Employee ID'),
                              SizedBox(
                                height: 40,
                              ),
                              labelText('Employee Name'),
                              SizedBox(
                                height: 40,
                              ),
                              labelText('Department'),
                              SizedBox(
                                height: 40,
                              ),
                              labelText('Payment Type'),
                              SizedBox(
                                height: 35,
                              ),
                              labelText('Working Hours'),
                              SizedBox(
                                height: 40,
                              ),
                              labelText('Salary'),
                              SizedBox(
                                height: 40,
                              ),
                              labelText('Insurance'),
                              SizedBox(
                                height: 40,
                              ),
                              labelText('Tax on Salary'),
                              SizedBox(
                                height: 40,
                              ),
                              labelText('Deduction'),
                              SizedBox(
                                height: 40,
                              ),
                              labelText('Net Salary'),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              dropList(_locations, _selectedLocation,
                                  width * 0.4, 60.0, setValue),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.4, 60.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              dropList(_locations, _selectedLocation,
                                  width * 0.4, 60.0, setValue),
                              SizedBox(
                                height: 15,
                              ),
                              dropList(_locations, _selectedLocation,
                                  width * 0.4, 60.0, setValue),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.4, 60.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.4, 60.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.4, 60.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.4, 60.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.4, 60.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.4, 60.0, true),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
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
