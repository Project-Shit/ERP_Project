// @dart=2.9
import 'package:erp/Client/Application/application.dart';
import 'package:erp/Client/Online/crm.dart';
import 'package:erp/Client/Online/crmModel.dart';
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
      home:crmData(),
    );
  }
}