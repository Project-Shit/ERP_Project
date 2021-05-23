// @dart=2.9
import 'package:erp/Client/Accounting/Users/users.dart';
import 'package:erp/System/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
      home: Users(),
    );
  }
}