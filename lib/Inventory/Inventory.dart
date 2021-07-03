import 'package:erp/Inventory/InventoryDesktop2.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:erp/Inventory/InventoryDesktop.dart';
import 'package:erp/inventory/InventoryMobile.dart';


class Inventory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: InventoryDesktop2(),
    );
  }
}
