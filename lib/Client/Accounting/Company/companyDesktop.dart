// @dart=2.9
import 'dart:convert';
import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

class CompanyDesktop extends StatefulWidget {
  @override
  _CompanyDesktopState createState() => _CompanyDesktopState();
}

// tax accounting page for the client's system
class _CompanyDesktopState extends State<CompanyDesktop> {
  // objects implementation
  bool message = true;
  TextEditingController _balanceController = TextEditingController();
  TextEditingController _expensesController = TextEditingController();
  TextEditingController _salaryController = TextEditingController();
  TextEditingController _incomeController = TextEditingController();
  TextEditingController _taxController = TextEditingController();
  TextEditingController _newController = TextEditingController();

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

  apply() async {
    try {
      data = {
        "command": "insert into company(month,year,Balance,expenses,salary,income,tax,newBalance)"
            "values('${_month.toString()}','${_year.toString()}',${_balanceController.text},"
            "${_expensesController.text},${_salaryController.text},${_incomeController.text},"
            "(((salary+income)*14)/100),(Balance+income-expenses-salary-tax))"
      };
      response = await http.post(Uri.parse(setData), body: data);
      if (200 == response.statusCode) {
        return message;
      } else {
        return !message;
      }
    } catch (e) {
      print(e);
    }
  }

  Future fetchSalary() async {
    try {
      data = {"command": "select sum(salary) as salary from users"};
      http.post(Uri.parse(getData), body: data).then((http.Response response) {
        var fetchDecode = jsonDecode(response.body);
        fetchDecode.forEach((users) {
          setState(() {
            _salaryController.text = users['salary'];
          });
        });
      });
    } catch (e) {
      print(e);
    }
  }

  Future fetchBalance() async {
    try {
      data = {
        "command": "SELECT newBalance FROM company ORDER BY ID DESC LIMIT 1"
      };
      http.post(Uri.parse(getData), body: data).then((http.Response response) {
        var fetchDecode = jsonDecode(response.body);
        fetchDecode.forEach((users) {
          setState(() {
            _balanceController.text = users['newBalance'];
          });
        });
      });
    } catch (e) {
      print(e);
    }
  }

  Future fetchNew() async {
    try {
      data = {
        "command": "SELECT newBalance,tax FROM company ORDER BY ID DESC LIMIT 1"
      };
      http.post(Uri.parse(getData), body: data).then((http.Response response) {
        var fetchDecode = jsonDecode(response.body);
        fetchDecode.forEach((users) {
          setState(() {
            _newController.text = users['newBalance'];
            _taxController.text = users['tax'];
          });
        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchSalary();
    fetchBalance();
    for (int i = 2000; i <= 2100; i++) {
      _years.add(i.toString());
    }
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
                  ),
                ),
                width: width * 0.7,
                height: 520,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // implementing a column to call custom label widget with sizedBox between them
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              labelText('Date'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Balance'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Expenses'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Salary'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Income'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Tax'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('New Balance'),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.04,
                          ),
                          // implementing a column to call custom drop down list, text field
                          // and date picker with sizedBox between them.
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: width * 0.23,
                                    height: 50.0,
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
                                          fetchSalary();
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
                                    width: 30,
                                  ),
                                  Container(
                                    width: width * 0.23,
                                    height: 50.0,
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
                                          fetchSalary();
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
                                height: 15,
                              ),
                              textField(_balanceController, width * 0.48, 40.0,
                                  false),
                              SizedBox(
                                height: 15,
                              ),
                              textField(_expensesController, width * 0.48, 40.0,
                                  true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _salaryController, width * 0.48, 40.0, false),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _incomeController, width * 0.48, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _taxController, width * 0.48, 40.0, false),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _newController, width * 0.48, 40.0, false),
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
                          actionButtons('Apply', () {
                            apply();
                            Alert(
                              context: context,
                              title: message ? 'Applied' : 'Couldn\'t Apply',
                              buttons: [
                                DialogButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    fetchNew();
                                  },
                                  child: Text(
                                    "OK",
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                  color: hoverColor,
                                )
                              ],
                            ).show();
                          }, Colors.green),
                          SizedBox(
                            width: 80,
                          ),
                          actionButtons('Print Report', () {}, Colors.blue),
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
