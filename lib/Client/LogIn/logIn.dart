// @dart=2.9
import 'package:erp/Client/LogIn/logInDesktop.dart';
import 'package:erp/Client/LogIn/logInMobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LogIn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: LogInMobile(),
      desktop: LogInDesktop(),
    );
  }
}
