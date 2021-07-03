// @dart=2.9
import 'package:erp/System/home/homeDesktop.dart';
import 'package:erp/System/home/homeMobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

// main class for main system home page
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: HomeDesktop(),
      mobile: HomeMobile(),
    );
  }
}
