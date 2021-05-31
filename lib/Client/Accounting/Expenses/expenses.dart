// @dart=2.9
import 'package:erp/Client/Accounting/Expenses/expensesDesktop.dart';
import 'package:erp/Client/Accounting/Expenses/expensesMobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Expenses extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: ExpensesMobile(),
      desktop: ExpensesDesktop(),
    );
  }
}
