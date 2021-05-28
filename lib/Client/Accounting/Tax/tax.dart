// @dart=2.9
import 'package:erp/Client/Accounting/Tax/taxDesktop.dart';
import 'package:erp/Client/Accounting/Tax/taxMobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Tax extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: TaxMobile(),
      desktop: TaxDesktop(),
    );
  }
}
