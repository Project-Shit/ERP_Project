// @dart=2.9
import 'package:erp/Client/chatapp/providers/auth.dart';
import 'package:erp/Client/chatapp/screens/authentication.dart';
import 'package:erp/Client/chatapp/screens/home.dart';
import 'package:erp/Client/chatapp/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AppScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    switch (authProvider.status) {
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return AuthenticationScreen();
      case Status.Authenticated:
        return HomeScreen();
      default:
        return AuthenticationScreen();
    }
  }
}