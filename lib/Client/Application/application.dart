// @dart=2.9
import 'package:erp/Client/Application/applicationDesktop.dart';
import 'package:erp/Client/Application/applicationMobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Application extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: ApplicationMobile(),
      desktop: ApplicationDesktop(),
    );
  }
}
