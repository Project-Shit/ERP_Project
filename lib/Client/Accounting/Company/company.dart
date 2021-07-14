// @dart=2.9
import 'dart:convert';
import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:erp/widget/chat/chatButton.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class Company extends StatefulWidget {
  final String userName, type;

  Company({this.userName, this.type});

  @override
  _CompanyState createState() => _CompanyState();
}

class _CompanyState extends State<Company> {
  // objects implementation
  bool message = true;
  bool status = true;
  bool admin = false;
  bool accountant = false;
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


  checkType() {
    if (widget.type == 'Admin') {
      setState(() {
        admin = true;
      });
    } else if (widget.type == 'Accountant') {
      setState(() {
        accountant = true;
      });
    }
  }



  apply() async {
    try {
      data = {
        "command": "insert into company(month,year,Balance,expenses,salary,income,tax,newBalance,profit)"
            "values('${_month.toString()}','${_year.toString()}',${_balanceController.text},"
            "${_expensesController.text},${_salaryController.text},${_incomeController.text},"
            "(((salary+income)*14)/100),(Balance+income-expenses-salary-tax),((Balance+income-expenses-salary-tax)-Balance))"
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
        "command":
            "SELECT newBalance,tax,profit FROM company ORDER BY ID DESC LIMIT 1"
      };
      http.post(Uri.parse(getData), body: data).then((http.Response response) {
        var fetchDecode = jsonDecode(response.body);
        fetchDecode.forEach((users) {
          setState(() {
            _newController.text = users['newBalance'];
            _taxController.text = users['tax'];
            _profitController.text = users['profit'];
          });
        });
      });
    } catch (e) {
      print(e);
    }
  }

  // function to check the date
  check() async {
    try {
      data = {
        "command":
            "select * from company where month = '${_month.toString()}' and year = '${_year.toString()}'"
      };
      response = await http.post(Uri.parse(conditionAPI), body: data);
      var date = json.decode(response.body);
      if (date == 'Success') {
        Alert(
          context: context,
          title: 'This Data Already Exist',
          buttons: [
            DialogButton(
              onPressed: () {
                Navigator.pop(context);
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
        setState(() {
          status = false;
        });
      } else {
        status = true;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    checkType();
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
        child: ClientAppBar(
          userName: widget.userName,
          type: widget.type,
        ),
      ),
      // implementing th body with scroll View and row widget
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 30,
              bottom: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
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
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 50,
                          right: 50,
                          top: 30,
                          bottom: 30,
                        ),
                        // implementing a column widget to align the rest of the widget
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // implementing a column to call custom drop down list, text field
                                // and date picker with sizedBox between them.
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: width * 0.29,
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
                                              fillColor: textFill,
                                            ),
                                            value: _month,
                                            onChanged: (newValue) {
                                              setState(() {
                                                _month = newValue;
                                                check();
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
                                          width: width * 0.29,
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
                                              fillColor: textFill,
                                            ),
                                            value: _year,
                                            onChanged: (newValue) {
                                              setState(() {
                                                _year = newValue;
                                                check();
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
                                    textField(_balanceController, width * 0.6,
                                        40.0, false, 'Balance'),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    textField(_expensesController, width * 0.6,
                                        40.0, true, 'Expenses'),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    textField(_salaryController, width * 0.6,
                                        40.0, false, 'Salary'),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    textField(_incomeController, width * 0.6,
                                        40.0, true, 'Income'),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    textField(_taxController, width * 0.6, 40.0,
                                        false, 'Tax'),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    textField(_newController, width * 0.6, 40.0,
                                        false, 'New Balance'),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    textField(_profitController, width * 0.6,
                                        40.0, false, 'Profit'),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            // implementing a row widget to call custom buttons and align them.
                            admin
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      actionButtons('Print', () {
                                        launch(
                                            'http://localhost/ERP/companyPDF.php');
                                      }, Colors.blue.shade600),
                                    ],
                                  )
                                : accountant
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          actionButtons('Apply', () {
                                            if (status == true) {
                                              apply();
                                              Alert(
                                                context: context,
                                                title: message
                                                    ? 'Applied'
                                                    : 'Couldn\'t Apply',
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
                                            } else {
                                              Alert(
                                                context: context,
                                                title:
                                                    'This Data Already Exist',
                                                buttons: [
                                                  DialogButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
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
                                            }
                                          }, Colors.green),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          actionButtons('Print', () {
                                            launch(
                                                'http://localhost/ERP/companyPDF.php');
                                          }, Colors.blue.shade600),
                                        ],
                                      )
                                    : Row(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: ChatButton(),
    );
  }
}
