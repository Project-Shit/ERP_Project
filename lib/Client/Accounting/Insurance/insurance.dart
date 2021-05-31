// @dart=2.9
import 'package:erp/Client/Accounting/Insurance/insuranceDesktop.dart';
import 'package:erp/Client/Accounting/Insurance/insuranceMobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Insurance extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: InsuranceMobile(),
      desktop: InsuranceDesktop(),
    );
  }
}
