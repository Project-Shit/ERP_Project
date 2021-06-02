// @dart=2.9
import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:flutter/material.dart';

class SubscriptionDesktop extends StatefulWidget {
  @override
  _SubscriptionDesktopState createState() => _SubscriptionDesktopState();
}

class _SubscriptionDesktopState extends State<SubscriptionDesktop> {
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
      appBar: PreferredSize(
        preferredSize: Size(width, 70),
        child: ClientAppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 30,
            bottom: 30,
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
                width: width * 0.86,
                height: 600,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 70,
                    right: 70,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.365,
                            height: 40,
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
                            width: 58,
                          ),
                          labelText('Client ID'),
                          SizedBox(
                            width: width * 0.07,
                          ),
                          textField(_textController, width * 0.24, 40.0, true),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      labelText('Client Name'),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      labelText('Client Address'),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      labelText('Payment Method'),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      labelText('Subscription Type'),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      labelText('Due Date'),
                                    ],
                                  ),
                                  SizedBox(
                                    width: width * 0.01,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      textField(_textController, width * 0.24,
                                          40.0, true),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      textField(_textController, width * 0.24,
                                          40.0, true),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      dropList(_locations, _selectedLocation,
                                          width * 0.24, 40.0, setValue),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      dropList(_locations, _selectedLocation,
                                          width * 0.24, 40.0, setValue),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        width: width * 0.24,
                                        height: 40.0,
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
                                            _dateController.text = date
                                                .toString()
                                                .substring(0, 10);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      labelText('Client Phone'),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      labelText('Client Email'),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      labelText('Card Number'),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      labelText('Subscription Plan'),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      labelText('Payment Date'),
                                    ],
                                  ),
                                  SizedBox(
                                    width: width * 0.01,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      textField(_textController, width * 0.24,
                                          40.0, true),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      textField(_textController, width * 0.24,
                                          40.0, true),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      textField(_textController, width * 0.24,
                                          40.0, true),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      dropList(_locations, _selectedLocation,
                                          width * 0.24, 40.0, setValue),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        width: width * 0.24,
                                        height: 40.0,
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
                                            _dateController.text = date
                                                .toString()
                                                .substring(0, 10);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
                          Column(
                            children: [
                              actionButtons('Add Client', () {}, Colors.green),
                              SizedBox(
                                height: 30,
                              ),
                              actionButtons(
                                  'Delete Client', () {}, Colors.red.shade900),
                            ],
                          ),
                          SizedBox(
                            width: 200,
                          ),
                          Column(
                            children: [
                              actionButtons(
                                  'Update Client', () {}, Colors.blue),
                              SizedBox(
                                height: 30,
                              ),
                              actionButtons('Print Report', () {}, Colors.blue),
                            ],
                          ),
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
