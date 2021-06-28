// @dart=2.9
import 'dart:convert';
import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CompanyDesktop extends StatefulWidget {
  @override
  _CompanyDesktopState createState() => _CompanyDesktopState();
}

// tax accounting page for the client's system
class _CompanyDesktopState extends State<CompanyDesktop> {
  // objects implementation
  bool message = true;
  TextEditingController _profitController = TextEditingController();
  TextEditingController _tProfitController = TextEditingController();
  TextEditingController _salaryController = TextEditingController();
  TextEditingController _tSalaryController = TextEditingController();
  TextEditingController _totalController = TextEditingController();

  // ignore: deprecated_member_use
  List _monthly = [
    'January','February',
    'March','April',
    'May','June',
    'July','August',
    'September','October',
    'November','December',
  ];
  // ignore: deprecated_member_use
  List _years = List();

  String _month,_year;

  var setData = 'http://192.168.1.104/ERP/setAPI.php';
  var getData = 'http://192.168.1.104/ERP/getAPI.php';
  var data, response;

  apply() async {
    try {
      data = {
        "command": "update "
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

  Future fetchData() async {
    try {
      data = {
        "command": "select sum(salary) as salary,sum(tax) as tax from users"
      };
      http.post(Uri.parse(getData), body: data).then((http.Response response) {
        var fetchDecode = jsonDecode(response.body);
        fetchDecode.forEach((users) {
          setState(() {
            _salaryController.text = users['salary'];
            _tSalaryController.text = users['tax'];
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
    fetchData();
    for(int i=2000;i<=2100;i++){
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
                height: 500,
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
                              labelText('Date'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Total Profit'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Tax on Profit'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Total Salary'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Tax on Salary'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Total Tax'),
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
                                    width: width * 0.2,
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
                                      value: _month,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _month = newValue;
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
                                    width: 30,
                                  ),
                                  Container(
                                    width: width * 0.2,
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
                                      value: _year,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _year = newValue;
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
                                  SizedBox(
                                    width: 50
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _profitController, width * 0.48, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _tProfitController, width * 0.48, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _salaryController, width * 0.48, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _tSalaryController, width * 0.48, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _totalController, width * 0.48, 40.0, true),
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
