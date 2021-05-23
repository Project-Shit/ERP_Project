import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:responsive_builder/responsive_builder.dart';
import 'usersDesktop.dart';

class Users extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: UsersDesktop(),
    );
  }
}
