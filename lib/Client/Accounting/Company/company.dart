// @dart=2.9
import 'package:erp/Client/Accounting/Company/companyDesktop.dart';
import 'package:erp/Client/Accounting/Company/companyMobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Company extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: CompanyMobile(),
      desktop: CompanyDesktop(),
    );
  }
}
