// @dart=2.9
import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:flutter/material.dart';

class TaxDesktop extends StatefulWidget {

  @override
  _TaxDesktopState createState() => _TaxDesktopState();
}

class _TaxDesktopState extends State<TaxDesktop> {

  List<String> _locations = [];
  String _selectedLocation;
  bool password = true;
  TextEditingController _textController;
  DateTime _selectedDateTime = DateTime.now();

  void setValue() {
    String value = '';
    setState(() {
      _selectedLocation = value;
    });
  }

  void onBirthdayChange(DateTime birthday) {
    setState(() {
      _selectedDateTime = birthday;
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
                width: width * 0.62,
                height: 900,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 70,
                    right: 70,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width * 0.5,
                        child: TextFormField(
                          style: TextStyle(
                            color: TextColor,
                          ),
                          decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(
                                right: 10,
                              ),
                              child: IconButton(
                                icon: Icon(Icons.search),
                                onPressed: () {},
                              ),
                            ),
                            fillColor: SecondaryColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                new Radius.circular(
                                  10.0,
                                ),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                              ),
                              borderRadius: BorderRadius.all(
                                new Radius.circular(
                                  10.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              labelText('Tax Plane'),
                              SizedBox(
                                height: 40,
                              ),
                              labelText('Date'),
                              SizedBox(
                                height: 40,
                              ),
                              labelText('Total Profit'),
                              SizedBox(
                                height: 40,
                              ),
                              labelText('Tax n Profit'),
                              SizedBox(
                                height: 40,
                              ),
                              labelText('Total Salary'),
                              SizedBox(
                                height: 40,
                              ),
                              labelText('Tax on Salary'),
                              SizedBox(
                                height: 40,
                              ),
                              labelText('Total Tax'),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.04,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              dropList(_locations, _selectedLocation,
                                  width * 0.34, 60.0, setValue),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: width * 0.34,
                                height: 60.0,
                                decoration: BoxDecoration(
                                    color: SecondaryColor,
                                    borderRadius: BorderRadius.all(Radius.circular(10.0),),),
                                child: CupertinoDateTextBox(
                                  initialValue: _selectedDateTime,
                                  onDateChange: onBirthdayChange,
                                  hintText: _selectedDateTime.toString(),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              textField(
                                  _textController, width * 0.34, 60.0, true),
                              SizedBox(
                                height: 20,
                              ),
                              textField(
                                  _textController, width * 0.34, 60.0, true),
                              SizedBox(
                                height: 20,
                              ),
                              textField(
                                  _textController, width * 0.34, 60.0, true),
                              SizedBox(
                                height: 20,
                              ),
                              textField(
                                  _textController, width * 0.34, 60.0, true),
                              SizedBox(
                                height: 20,
                              ),
                              textField(
                                  _textController, width * 0.34, 60.0, true),
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
