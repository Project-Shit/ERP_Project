import 'package:erp/System/home/homeDesktop.dart';
import 'package:erp/System/home/homeMobile.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:responsive_builder/responsive_builder.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: HomeDesktop(),
      mobile: HomeMobile(),
    );
  }
}