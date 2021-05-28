// @dart=2.9
import 'package:erp/Client/Accounting/Salary/salaryDesktop.dart';
import 'package:erp/Client/Accounting/Salary/salaryMobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Salary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: SalaryMobile(),
      desktop: SalaryDesktop(),
    );
  }
}
