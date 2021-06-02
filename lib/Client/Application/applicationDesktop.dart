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
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:flutter/material.dart';

class ApplicationDesktop extends StatelessWidget {

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
            left: 150,
            right: 150,
            top: 80,
            bottom: 30,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  applicationCard(
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
                  SizedBox(
                    width: width * 0.02,
                  ),
                  applicationCard(
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
                  SizedBox(
                    width: width * 0.02,
                  ),
                  applicationCard(
                    'Expenses',
                    width * 0.18,
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
                    width: width * 0.02,
                  ),
                  applicationCard(
                    'Insurance',
                    width * 0.18,
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
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  applicationCard(
                    'Product',
                    width * 0.18,
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
                    width: width * 0.02,
                  ),
                  applicationCard(
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
                  SizedBox(
                    width: width * 0.02,
                  ),
                  applicationCard(
                    'Subscription',
                    width * 0.18,
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
                    width: width * 0.02,
                  ),
                  applicationCard(
                    'Tax',
                    width * 0.18,
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
            ],
          ),
        ),
      ),
    );
  }
}
