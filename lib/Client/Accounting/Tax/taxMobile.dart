// @dart=2.9
import 'package:erp/constants.dart';
import 'package:erp/widget/drawer/clientDrawer.dart';
import 'package:flutter/material.dart';

class TaxMobile extends StatefulWidget {
  @override
  _TaxMobileState createState() => _TaxMobileState();
}

class _TaxMobileState extends State<TaxMobile> {
  List<String> _locations = [];
  String _selectedLocation;
  final _textController = TextEditingController();
  final _dateController = TextEditingController();

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
                  labelText('Tax Plan'),
                  dropList(_locations, _selectedLocation, width * 0.9, 45.0,
                      setValue),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Date'),
                  Container(
                    width: width * 0.9,
                    height: 45.0,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        fillColor: SecondaryColor,
                      ),
                      readOnly: true,
                      controller: _dateController,
                      onTap: () async {
                        var date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );
                        _dateController.text = date.toString().substring(0, 10);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Total Profit'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Tax on Profit'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Total Salary'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Tax on Salary'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Total Tax'),
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
