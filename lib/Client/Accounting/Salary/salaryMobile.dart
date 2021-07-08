// @dart=2.9
import 'dart:convert';
import 'package:erp/constants.dart';
import 'package:erp/widget/drawer/clientDrawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SalaryMobile extends StatefulWidget {
  @override
  _SalaryMobileState createState() => _SalaryMobileState();
}

// viewing all salary records page for the client's system by search
class _SalaryMobileState extends State<SalaryMobile> {
  // objects implementation
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

  // function to fetch data from database and calculate columns
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
    data = {"command": "select id from users order by id"};
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
      backgroundColor: primaryColor,
      // implementing the client's AppBar
      appBar: PreferredSize(
        preferredSize: Size(width, 60),
        child: AppBar(
          iconTheme: IconThemeData(
            color: primaryColor,
          ),
          backgroundColor: secondaryColor,
          title: Image.asset(
            'assets/logo.png',
            height: 50,
          ),
          centerTitle: true,
        ),
      ),
      // calling the client's custom Drawer
      drawer: ClientDrawer(),
      // implementing th body with scroll View and container widget
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
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
                top: 30,
                bottom: 30,
                left: 20,
                right: 20,
              ),
              // implementing a column widget to add custom widgets labels, text field,
              // drop down list and sizedBox between them.
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: width,
                    height: 55.0,
                    child: DropdownButtonFormField(
                      hint: Text('Employee ID'),
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
                          child: Text(location),
                          value: location,
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  textField(_name, width, 45.0, false,'Employee Name'),
                  SizedBox(
                    height: 20,
                  ),
                  textField(_dept, width, 45.0, false,'Department'),
                  SizedBox(
                    height: 20,
                  ),
                  textField(_salary, width, 45.0, false,'Salary'),
                  SizedBox(
                    height: 20,
                  ),
                  textField(_insurance, width, 45.0, false,'Insurance'),
                  SizedBox(
                    height: 20,
                  ),
                  textField(_tax, width, 45.0, false,'Tax on Salary'),
                  SizedBox(
                    height: 20,
                  ),
                  textField(_deduction, width, 45.0, false,'Deduction'),
                  SizedBox(
                    height: 20,
                  ),
                  textField(_netS, width, 45.0, false,'Net Salary'),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
