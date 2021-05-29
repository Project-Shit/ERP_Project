// @dart=2.9
import 'package:erp/Client/Accounting/Product/productDesktop.dart';
import 'package:erp/Client/Accounting/Product/productMobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Product extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: ProductMobile(),
      desktop: ProductDesktop(),
    );
  }
}
