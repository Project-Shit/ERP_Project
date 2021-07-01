// @dart=2.9
import 'dart:convert';
import 'package:erp/constants.dart';
import 'package:erp/widget/drawer/clientDrawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CompanyMobile extends StatefulWidget {
  @override
  _CompanyMobileState createState() => _CompanyMobileState();
}

// viewing all tax records page for the client's system by search
class _CompanyMobileState extends State<CompanyMobile> {
  // objects implementation
  TextEditingController _balanceController = TextEditingController();
  TextEditingController _expensesController = TextEditingController();
  TextEditingController _salaryController = TextEditingController();
  TextEditingController _incomeController = TextEditingController();
  TextEditingController _taxController = TextEditingController();
  TextEditingController _newController = TextEditingController();
  TextEditingController _profitController = TextEditingController();

  // ignore: deprecated_member_use
  List _monthly = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  // ignore: deprecated_member_use
  List _years = List();
  String _month, _year;

  Future fetchData() async {
    try {
      data = {
        "command":
            "select * from company where month = '${_month.toString()}' and year = '${_year.toString()}'"
      };
      http.post(Uri.parse(getData), body: data).then((http.Response response) {
        var fetchDecode = jsonDecode(response.body);
        fetchDecode.forEach((users) {
          setState(() {
            _balanceController.text = users['Balance'];
            _expensesController.text = users['expenses'];
            _salaryController.text = users['salary'];
            _incomeController.text = users['income'];
            _taxController.text = users['tax'];
            _newController.text = users['newBalance'];
            _profitController.text = users['profit'];
          });
        });
      });
    } catch (e) {
      print(e);
    }
  }

  clear() {
    setState(() {
      _balanceController.text = '';
      _expensesController.text = '';
      _salaryController.text = '';
      _incomeController.text = '';
      _taxController.text = '';
      _newController.text = '';
      _profitController.text = '';
    });
  }

  @override
  void initState() {
    super.initState();
    for (int i = 2000; i <= 2100; i++) {
      _years.add(i.toString());
    }
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
              // drop down list, date picker and sizedBox between them.
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  labelText('Date'),
                  Row(
                    children: [
                      Container(
                        width: width * 0.38,
                        height: 60.0,
                        child: DropdownButtonFormField(
                          hint: Text('Month'),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            filled: true,
                            fillColor: secondaryColor,
                          ),
                          value: _month,
                          onChanged: (newValue) {
                            setState(() {
                              _month = newValue;
                              clear();
                              fetchData();
                            });
                          },
                          items: _monthly.map((location) {
                            return DropdownMenuItem(
                              child: new Text(location),
                              value: location,
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: width * 0.38,
                        height: 60.0,
                        child: DropdownButtonFormField(
                          hint: Text('Year'),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            filled: true,
                            fillColor: secondaryColor,
                          ),
                          value: _year,
                          onChanged: (newValue) {
                            setState(() {
                              _year = newValue;
                              clear();
                              fetchData();
                            });
                          },
                          items: _years.map((location) {
                            return DropdownMenuItem(
                              child: new Text(location),
                              value: location,
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Balance'),
                  textField(_balanceController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Expenses'),
                  textField(_expensesController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Salary'),
                  textField(_salaryController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Income'),
                  textField(_incomeController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Tax'),
                  textField(_taxController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('New Balance'),
                  textField(_newController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Profit'),
                  textField(_profitController, width, 45.0, false),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
