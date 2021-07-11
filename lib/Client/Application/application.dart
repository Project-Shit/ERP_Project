// @dart=2.9
import 'package:erp/Client/Accounting/Salary/salary.dart';
import 'package:erp/Client/Accounting/Company/company.dart';
import 'package:erp/Client/Crm/crmmarian.dart';
import 'package:erp/Client/Inventory/InventoryDesktop2.dart';
import 'package:erp/Client/Inventory/inventoryDesktop.dart';
import 'package:erp/Client/Online/online_orders.dart';
import 'package:erp/Client/Users/users.dart';
import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:erp/widget/chat/chatButton.dart';
import 'package:flutter/material.dart';

// home page for the client's system
class Application extends StatefulWidget {
  final String title;

  Application({this.title});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    // Media Query object for responsive layout
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      // calling the client's custom AppBar
      appBar: PreferredSize(
        preferredSize: Size(width, 70),
        child: ClientAppBar(userName: widget.title.toString(),),
      ),
      // implementing th body with scroll View
      body: Container(
        width: width,
        height: height,
        color: darkBlue,
        child: WillPopScope(
          // ignore: missing_return
          onWillPop: () {},
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 170,
                    right: 150,
                    top: 80,
                    bottom: 30,
                  ),

                  /* implementing a column widget to contain all widget inside of it,
                  *  which include a custom card widget for each application in
                  *  the client's system, each 4 card widget are set together inside
                  *  a row, and passing the parameters for each card => title, width,
                  *  height and the onTap action, with sizedBox between each widget
                  *  to give it a good looking view. */
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: applicationCard(
                              'assets/team.png',
                              width * 0.18,
                              100,
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Users(userName: widget.title,),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Container(
                            child: applicationCard(
                              'assets/HR.png',
                              width * 0.18,
                              100,
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Salary(userName: widget.title,),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Container(
                            child: applicationCard(
                              'assets/fin.png',
                              width * 0.18,
                              100,
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Company(userName: widget.title,),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Container(
                            child: applicationCard(
                              'assets/online.png',
                              width * 0.18,
                              100,
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OnlineOrder(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Container(
                            child: applicationCard(
                              'assets/crm.png',
                              width * 0.18,
                              100,
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CRMData(userName: widget.title,),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Container(
                            child: applicationCard(
                              'assets/inv.png',
                              width * 0.18,
                              100,
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => InventoryDesktop(),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Container(
                            child: applicationCard(
                              'assets/pos.png',
                              width * 0.18,
                              100,
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => InventoryDesktop2(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: ChatButton(),
    );
  }
}
