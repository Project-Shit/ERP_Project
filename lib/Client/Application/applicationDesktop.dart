// @dart=2.9
import 'package:erp/Client/Accounting/Salary/salary.dart';
import 'package:erp/Client/Accounting/Company/company.dart';
import 'package:erp/Client/Online/online_orders.dart';
import 'package:erp/Client/Users/users.dart';
import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:flutter/material.dart';

// home page for the client's system
class ApplicationDesktop extends StatelessWidget {
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

      // implementing th body with scroll View
      body: WillPopScope(
        // ignore: missing_return
        onWillPop: () {},
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 150,
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
                      children: [
                        Container(
                          child: applicationCard(
                            'Users',
                            width * 0.18,
                            100,
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Users(),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Container(
                          child: applicationCard(
                            'Salary',
                            width * 0.18,
                            100,
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Salary(),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Container(
                          child: applicationCard(
                            'Company',
                            width * 0.18,
                            100,
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Company(),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Container(
                          child: applicationCard(
                            'Online Order',
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
