// @dart=2.9
import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:flutter/material.dart';

class ProductDesktop extends StatefulWidget {

  @override
  _ProductDesktopState createState() => _ProductDesktopState();
}

class _ProductDesktopState extends State<ProductDesktop> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: PrimaryColor,
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
                width: width * 0.75,
                height: 770,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 100,
                    right: 100,
                    top: 60,
                    bottom: 60,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: width,
                        height: 45.0,
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
                        height: 40,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              labelText('Item ID'),
                              SizedBox(
                                height: 40,
                              ),
                              labelText('Item Name'),
                              SizedBox(
                                height: 40,
                              ),
                              labelText('Wholesale Price'),
                              SizedBox(
                                height: 40,
                              ),
                              labelText('Price of Peace'),
                              SizedBox(
                                height: 35,
                              ),
                              labelText('Price of Sale'),
                              SizedBox(
                                height: 40,
                              ),
                              labelText('Profit'),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.03,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textField(_textController, width * 0.4, 60.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(_textController, width * 0.4, 60.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(_textController, width * 0.4, 60.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(_textController, width * 0.4, 60.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(_textController, width * 0.4, 60.0, true),
                              SizedBox(
                                height: 15,
                              ),
                              textField(_textController, width * 0.4, 60.0, true),
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
