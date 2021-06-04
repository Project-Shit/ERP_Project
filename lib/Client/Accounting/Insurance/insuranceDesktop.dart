// @dart=2.9
import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:flutter/material.dart';

class InsuranceDesktop extends StatefulWidget {

  @override
  _InsuranceDesktopState createState() => _InsuranceDesktopState();
}

class _InsuranceDesktopState extends State<InsuranceDesktop> {

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
            top: 30,
            bottom: 30,
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
                      color: textColor,
                      width: 2,
                    )),
                width: width * 0.7,
                height: 690,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 70,
                    right: 70,
                    top: 30,
                    bottom: 30,
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
                                height: 5,
                              ),
                              labelText('Employee ID'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Employee Name'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('SSIN'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Social Number'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Balance'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Monthly Payment'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Expenses'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Insurance Type'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Insurance Plane'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Hospital Name'),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.04,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              dropList(_locations, _selectedLocation,
                                  width * 0.45, 40.0, setValue),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.45, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.45, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.45, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.45, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.45, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.45, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              dropList(_locations, _selectedLocation,
                                  width * 0.45, 40.0, setValue),
                              SizedBox(
                                height: 15,
                              ),
                              dropList(_locations, _selectedLocation,
                                  width * 0.45, 40.0, setValue),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.45, 40.0, true),
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
