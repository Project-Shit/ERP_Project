import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:flutter/material.dart';

class InventoryDesktop extends StatefulWidget{
  @override
  _InventoryDesktopState createState() =>_InventoryDesktopState();
}

class _InventoryDesktopState extends State<InventoryDesktop>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
        appBar: PreferredSize(
        preferredSize: Size(30, 70),
        child: ClientAppBar(),
        ),
      body: Container(
        

      ),
    );
  }
}