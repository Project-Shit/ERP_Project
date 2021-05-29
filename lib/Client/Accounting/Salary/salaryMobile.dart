// @dart=2.9
import 'package:erp/constants.dart';
import 'package:erp/widget/drawer/clientDrawer.dart';
import 'package:flutter/material.dart';

class SalaryMobile extends StatefulWidget {
  @override
  _SalaryMobileState createState() => _SalaryMobileState();
}

class _SalaryMobileState extends State<SalaryMobile> {
  List<String> _locations = [];
  String _selectedLocation;
  bool password = true;
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
              padding: EdgeInsets.only(
                top: 50,
                bottom: 50,
                left: 20,
                right: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  labelText('Employee ID'),
                  dropList(_locations, _selectedLocation, width * 0.9, 45.0,
                      setValue),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Employee Name'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Total Profit'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Department'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Payment Type'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Working Hours'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Salary'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Insurance'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Tax on Salary'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Deduction'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Net Salary'),
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