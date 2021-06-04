// @dart=2.9
import 'package:erp/constants.dart';
import 'package:erp/widget/drawer/clientDrawer.dart';
import 'package:flutter/material.dart';

class ProductMobile extends StatefulWidget {
  @override
  _ProductMobileState createState() => _ProductMobileState();
}

// viewing all products records page for the client's system by search
class _ProductMobileState extends State<ProductMobile> {
  // objects implementation
  final _textController = TextEditingController();

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
              // implementing a column widget to add custom widgets labels, text field,
              // search box and sizedBox between them.
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  labelText('Item ID'),
                  Container(
                    width: width,
                    height: 45.0,
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
                  labelText('Item Name'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Wholesale Price'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Price of Peace'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Price of Sale'),
                  textField(_textController, width, 45.0, false),
                  SizedBox(
                    height: 20,
                  ),
                  labelText('Profit'),
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
