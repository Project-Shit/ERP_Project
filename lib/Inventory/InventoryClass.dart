import 'package:erp/Inventory/Inventory.dart';
import 'package:flutter/material.dart';

class InventoryClass {
  String Name;
  String SKU;
  String QR_code;
  String Quantity;
  String Image_of_product;
  String Cost_price;
  String Variant;
  String Selling_price;
  String Compared_at_price;

  InventoryClass({required this.Name, required this.SKU, required this.QR_code, required this.Quantity, required this.Image_of_product,
    required this.Cost_price, required this.Variant, required this.Selling_price, required this.Compared_at_price});

  factory InventoryClass.fromJson(Map<String, dynamic> json) {
    return InventoryClass(
      Name: json['Name'] as String,
      SKU: json['SKU'] as String,
      QR_code: json['QR_code'] as String,
      Quantity: json['Quantity'] as String,
      Image_of_product: json['Image_of_product'] as String,
      Cost_price: json['Cost_price'] as String,
      Variant: json['Variant'] as String,
      Selling_price: json['Selling_price'] as String,
      Compared_at_price: json['Compared_at_price'] as String,

    );
  }
}