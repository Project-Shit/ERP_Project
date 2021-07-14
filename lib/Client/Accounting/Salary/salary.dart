// @dart=2.9
import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:erp/widget/chat/chatButton.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class Salary extends StatefulWidget {
  final String userName, type;

  Salary({this.userName, this.type});

  @override
  _SalaryState createState() => _SalaryState();
}

// Salary accounting page for the client's system
class _SalaryState extends State<Salary> {
  // objects implementation
  bool message1 = true;
  bool admin = false;
  bool accountant = false;
  TextEditingController _name = TextEditingController();
  TextEditingController _salary = TextEditingController();
  TextEditingController _insurance = TextEditingController();
  TextEditingController _tax = TextEditingController();
  TextEditingController _deduction = TextEditingController();
  TextEditingController _note = TextEditingController();
  TextEditingController _netS = TextEditingController();

  // ignore: deprecated_member_use
  List _ids = List();
  String _id;


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

  // function to change values of a record and calculate net salary
  apply() async {
    try {
      data = {
        "command": "update users set salary = ${_salary.text}, insurance = ${_insurance.text}, "
            "tax = (salary*14)/100, deduction = ${_deduction.text},note = '${_note.text}'"
            " ,netSalary = (salary-insurance-tax-deduction) where concat('User ',id) = '${_id.toString()}'"
      };
      response = await http.post(Uri.parse(setData), body: data);
      if (200 == response.statusCode) {
        return message1;
      } else {
        return !message1;
      }
    } catch (e) {
      return message1;
    }
  }

  // function to fetch data from database and calculate columns
  Future<Null> fetchData() async {
    try {
      data = {
        "command": "select name,salary,insurance,(salary*14)/100 as tax,"
            "deduction,note,(salary-insurance-tax-deduction) as netSalary from users where concat('User ',id) = '${_id.toString()}'"
      };
      return await http
          .post(Uri.parse(getData), body: data)
          .then((http.Response response) {
        final List fetchData = json.decode(response.body);
        fetchData.forEach((user) {
          setState(() {
            _name.text = user['name'];
            _salary.text = user['salary'];
            _insurance.text = user['insurance'];
            _tax.text = user['tax'];
            _deduction.text = user['deduction'];
            _note.text = user['note'];
            _netS.text = user['netSalary'];
          });
        });
      });
    } catch (e) {}
  }

  // function to set id data to drop list
  Future idList() async {
    data = {
      "command": "select concat('User ',id) as userid from users order by id"
    };
    http.post(Uri.parse(getData), body: data).then((http.Response response) {
      var fetchDecode = jsonDecode(response.body);
      fetchDecode.forEach((users) {
        setState(() {
          _ids.add(users['userid']);
        });
      });
    });
  }


  @override
  void initState() {
    checkType();
    super.initState();
    idList();
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
        color: Colors.grey.withOpacity(0.3),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(
              top: 30,
              bottom: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // implementing a container to make the outline border design
                Row(
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
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 50, right: 50, top: 30, bottom: 30),
                        child: Column(
                          children: [
                            // implementing a row widget to align the rest of the widget
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // implementing a column to call custom drop down list, text field with sizedBox between them.
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: width * 0.6,
                                      height: 50.0,
                                      child: DropdownButtonFormField(
                                        hint: Text('ID'),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                          ),
                                          filled: true,
                                          fillColor: textFill,
                                        ),
                                        value: _id,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _id = newValue;
                                            fetchData();
                                          });
                                        },
                                        items: _ids.map((location) {
                                          return DropdownMenuItem(
                                            child: new Text(location),
                                            value: location,
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    textField(
                                        _name, width * 0.6, 40.0, true, 'Name'),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    textField(_salary, width * 0.6, 40.0, false,
                                        'Salary'),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    textField(_insurance, width * 0.6, 40.0,
                                        false, 'Insurance'),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    textField(
                                        _tax, width * 0.6, 40.0, true, 'Tax'),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    textField(_deduction, width * 0.6, 40.0,
                                        false, 'Deduction'),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    textField(_note, width * 0.6, 60.0, false,
                                        'Note', 30),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    textField(_netS, width * 0.6, 40.0, true,
                                        'Net Salary'),
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
                                      actionButtons('Report', () {
                                        launch(
                                            'http://localhost/ERP/salaryPDF.php');
                                      }, Colors.blue.shade600),
                                    ],
                                  )
                                : accountant
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          actionButtons('Apply', () {
                                            apply();
                                            Alert(
                                              context: context,
                                              title: message1
                                                  ? 'Applied'
                                                  : 'Couldn\'t Apply',
                                              buttons: [
                                                DialogButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    fetchData();
                                                    apply();
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
                                            width: 30,
                                          ),
                                          actionButtons('Report', () {
                                            launch(
                                                'http://localhost/ERP/salaryPDF.php');
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
