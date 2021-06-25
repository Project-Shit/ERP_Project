import 'package:erp/Inventory/inventoryDesktop.dart';
import 'package:erp/Inventory/inventoryMobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Inventory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: InventoryDesktop(),
    );
  }
}