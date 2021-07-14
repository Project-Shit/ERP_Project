// @dart=2.9
import 'package:erp/Client/LogIn/logIn.dart';
import 'package:erp/Client/chatapp/test.dart';
import 'package:flutter/material.dart';
import 'package:erp/Client/chatapp/providers/app.dart';
import 'package:erp/Client/chatapp/providers/auth.dart';
import 'package:erp/Client/chatapp/providers/user.dart';
import 'package:erp/Client/chatapp/services/messages.dart';
import 'package:provider/provider.dart';
import 'Client/chatapp/helper/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization;
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AppProvider()),
        ChangeNotifierProvider.value(value: AuthProvider.init()),
        ChangeNotifierProvider.value(value: UserProvider.init()),
        //ChangeNotifierProvider.value(value: MessagesProvider.init()),
        StreamProvider(
          create: (_) => MessageServices().getMessages(),
          initialData: [],
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat room',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AppScreensController(),
      )));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ERP System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
