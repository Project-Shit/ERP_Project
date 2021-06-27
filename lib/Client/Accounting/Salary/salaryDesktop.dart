// @dart=2.9
import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';

class SalaryDesktop extends StatefulWidget {
  @override
  _SalaryDesktopState createState() => _SalaryDesktopState();
}

// Salary accounting page for the client's system
class _SalaryDesktopState extends State<SalaryDesktop> {
  // objects implementation
  bool message1 = true;
  TextEditingController _name = TextEditingController();
  TextEditingController _dept = TextEditingController();
  TextEditingController _salary = TextEditingController();
  TextEditingController _insurance = TextEditingController();
  TextEditingController _tax = TextEditingController();
  TextEditingController _deduction = TextEditingController();
  TextEditingController _netS = TextEditingController();

  // ignore: deprecated_member_use
  List _ids = List();
  String _id;
  var setData = 'http://192.168.1.104/ERP/setAPI.php';
  var getData = 'http://192.168.1.104/ERP/getAPI.php';
  var data, response;

  // function to change values of a record
  apply() async {
    try {
      data = {
        "command":
            "update users set salary = ${_salary.text}, insurance = ${_insurance.text}, "
                "tax = ${_tax.text}, deduction = ${_deduction.text}, netSalary = ${_netS.text} where id = ${_id.toString()}"
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

  // function to fetch data from database
  Future<Null> fetchData() async {
    data = {
      "command": "select name,department,salary,insurance,(salary*14)/100 as tax,"
          "deduction,(salary-insurance-tax-deduction) as netSalary from users where id = '${_id.toString()}'"
    };
    return await http
        .post(Uri.parse(getData), body: data)
        .then((http.Response response) {
      final List fetchData = json.decode(response.body);
      fetchData.forEach((user) {
        setState(() {
          _name.text = user['name'];
          _dept.text = user['department'];
          _salary.text = user['salary'];
          _insurance.text = user['insurance'];
          _tax.text = user['tax'];
          _deduction.text = user['deduction'];
          _netS.text = user['netSalary'];
        });
      });
    });
  }

  // function to set id data to drop list
  Future idList() async {
    data = {"command": "select id from users"};
    http.post(Uri.parse(getData), body: data).then((http.Response response) {
      var fetchDecode = jsonDecode(response.body);
      fetchDecode.forEach((users) {
        setState(() {
          _ids.add(users['id']);
        });
      });
    });
  }

  @override
  void initState() {
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
                height: 600,
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
                                height: 30,
                              ),
                              labelText('Employee Name'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Department'),
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
                              Container(
                                width: width * 0.46,
                                height: 50.0,
                                child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: secondaryColor,
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
                              textField(_name, width * 0.46, 40.0, false),
                              SizedBox(
                                height: 15,
                              ),
                              textField(_dept, width * 0.46, 40.0, false),
                              SizedBox(
                                height: 15,
                              ),
                              textField(_salary, width * 0.46, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(_insurance, width * 0.46, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(_tax, width * 0.46, 40.0, false),
                              SizedBox(
                                height: 15,
                              ),
                              textField(_deduction, width * 0.46, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(_netS, width * 0.46, 40.0, false),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // implementing a row widget to call custom buttons and align them.
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          actionButtons('Apply', () {
                            apply();
                            Alert(
                              context: context,
                              title: message1 ? 'Applied' : 'Couldn\'t Apply',
                              content: Column(
                                children: <Widget>[],
                              ),
                              buttons: [
                                DialogButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    fetchData();
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
