// ignore: import_of_legacy_library_into_null_safe
import 'package:erp/Client/Accounting/Tax/taxMobile.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:responsive_builder/responsive_builder.dart';

class Tax extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: TaxMobile(),
    );
  }
}
