// @dart=2.9
import 'package:erp/Client/chatapp/providers/app.dart';
import 'package:erp/Client/chatapp/providers/auth.dart';
import 'package:erp/Client/chatapp/providers/messages.dart';
import 'package:erp/Client/chatapp/providers/user.dart';
import 'package:erp/Client/chatapp/screens/authentication.dart';
import 'package:erp/Client/chatapp/screens/home.dart';
import 'package:erp/Client/chatapp/providers//messages.dart';
import 'package:erp/Client/chatapp/services/messages.dart';
import 'package:erp/Client/chatapp/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'helper/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization;
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: AppProvider()),
    ChangeNotifierProvider.value(value: AuthProvider.init()),
    ChangeNotifierProvider.value(value: UserProvider.init()),
    ChangeNotifierProvider.value(value: MessagesProvider.init()),
    StreamProvider(create: (_) => MessageServices().getMessages(),)
  ], child: MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Chat room',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: AppScreensController(),
  )));
}

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