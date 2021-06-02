// @dart=2.9
import 'package:erp/Client/Accounting/Company/company.dart';
import 'package:erp/Client/Accounting/Expenses/expenses.dart';
import 'package:erp/Client/Accounting/Insurance/insurance.dart';
import 'package:erp/Client/Accounting/Product/product.dart';
import 'package:erp/Client/Accounting/Salary/salary.dart';
import 'package:erp/Client/Accounting/Subscription/subscription.dart';
import 'package:erp/Client/Accounting/Tax/tax.dart';
import 'package:erp/Client/Accounting/Users/users.dart';
import 'package:erp/constants.dart';
import 'package:erp/widget/drawer/clientDrawer.dart';
import 'package:flutter/material.dart';

class ApplicationMobile extends StatelessWidget {
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
          padding: const EdgeInsets.only(
            top: 30,
            bottom: 30,
            left: 40,
            right: 40,
          ),
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
                'Insurance',
                width,
                100,
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Insurance(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              applicationCard(
                'Product',
                width,
                100,
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Product(),
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
                'Subscription',
                width,
                100,
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Subscription(),
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
    );
  }
}
