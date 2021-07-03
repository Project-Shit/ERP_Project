// @dart=2.9
import 'package:erp/constants.dart';
import 'package:erp/widget/drawer/clientDrawer.dart';
import 'package:flutter/material.dart';

class ExpensesMobile extends StatefulWidget {

  @override
  _ExpensesMobileState createState() => _ExpensesMobileState();
}

// viewing all expenses records page for the client's system by search
class _ExpensesMobileState extends State<ExpensesMobile> {
  // objects implementation
  final _textController = TextEditingController();
  final _dateController = TextEditingController();

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
            color: textColor,
          ),
          backgroundColor: primaryColor,
          title: Text(
            'Company Name',
            style: TextStyle(
              color: textColor,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),
      ),
      // calling the client's custom Drawer
      drawer: ClientDrawer(),
      // implementing th body with scroll View and container widget
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
                color: textColor,
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
              // implementing a column widget to add custom widgets labels,
              // text field, date picker and sizedBox between them.
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        _dateController.text = date.toString().substring(0, 10);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Total Income'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Expenses'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Equipment\'s Cost'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Repairing Cost'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Total Net Profit'),
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
