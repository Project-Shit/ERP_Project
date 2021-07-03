// @dart=2.9
import 'package:erp/Client/Users/usersDesktop.dart';
import 'package:erp/Client/Users/usersMobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Users extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: UsersDesktop(),
      mobile: UsersMobile(),
    );
  }
}
