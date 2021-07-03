// @dart=2.9
import 'package:erp/Client/Accounting/Expenses/expenses.dart';
import 'package:erp/Client/Accounting/Product/product.dart';
import 'package:erp/Client/Users/users.dart';
import 'package:erp/Inventory/Inventory.dart';
import 'package:erp/Client/LogIn/logIn.dart';
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
      home: Inventory(),
    );
  }
}