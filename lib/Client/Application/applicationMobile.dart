// @dart=2.9
import 'package:erp/Client/Accounting/Company/company.dart';
import 'package:erp/Client/Accounting/Expenses/expenses.dart';
import 'package:erp/Client/Accounting/Salary/salary.dart';
import 'package:erp/Client/Accounting/Tax/tax.dart';
import 'package:erp/Client/Users/users.dart';
import 'package:erp/constants.dart';
import 'package:erp/widget/drawer/clientDrawer.dart';
import 'package:flutter/material.dart';

// home page for the client's system
class ApplicationMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Media Query object for responsive layout
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      // implementing the client's AppBar
      backgroundColor: primaryColor,
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
      // implementing th body with scroll View
      body: WillPopScope(
        // ignore: missing_return
        onWillPop: () {},
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30,
              bottom: 30,
              left: 40,
              right: 40,
            ),

            /* implementing a column widget to contain all widget inside of it,
              *  which include a custom card widget for each application in
              *  the client's system, and passing the parameters for each
              * card => title, width, height and the onTap action, with sizedBox
              * between each widget to give it a good looking view. */
            child: Column(
              children: [
                applicationCard(
                  'Users',
                  width,
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
                SizedBox(
                  height: 20,
                ),
                applicationCard(
                  'Company',
                  width,
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
                SizedBox(
                  height: 20,
                ),
                applicationCard(
                  'Expenses',
                  width,
                  100,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Expenses(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                applicationCard(
                  'Salary',
                  width,
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
                SizedBox(
                  height: 20,
                ),
                applicationCard(
                  'Tax',
                  width,
                  100,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Tax(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
