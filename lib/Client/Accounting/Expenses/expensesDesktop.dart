// @dart=2.9
import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:flutter/material.dart';

class ExpensesDesktop extends StatefulWidget {
  @override
  _ExpensesDesktopState createState() => _ExpensesDesktopState();
}

// expenses accounting page for the client's system
class _ExpensesDesktopState extends State<ExpensesDesktop> {
  // objects implementation
  final _textController = TextEditingController();
  final _dateController = TextEditingController();

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
                      // implementing a container to implement a search box
                      Container(
                        width: width,
                        height: 40,
                        child: TextFormField(
                          style: TextStyle(
                            color: textColor,
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
                            fillColor: secondaryColor,
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
                        height: 20,
                      ),
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
                              labelText('Total Income'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Expenses'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Equipment\'s Cost'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Repairing Cost'),
                              SizedBox(
                                height: 30,
                              ),
                              labelText('Total Net Profit'),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.04,
                          ),
                          // implementing a column to call custom text field
                          // and date picker with sizedBox between them.
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: width * 0.45,
                                height: 40.0,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                    ),
                                    filled: true,
                                    fillColor: secondaryColor,
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
                                    _dateController.text =
                                        date.toString().substring(0, 10);
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.45, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.45, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.45, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.45, 40.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(
                                  _textController, width * 0.45, 40.0, true),
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
