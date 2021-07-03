// // @dart=2.9
// import 'dart:convert';
// import 'package:http/http.dart'
// as http; // add the http plugin in pubspec.yaml file.
// import 'InventoryClass.dart';
//
// class InventoryFunction {
//   static const GETDATA = "http://localhost:8080/ERP project/getAPI.php";
//   static const SETDATA = "http://localhost:8080/ERP project/setAPI.php";
//   static const _GET_ALL_ACTION = 'GET_ALL';
//   static const _ADD_PRODUCT_ACTION = 'ADD_PRODUCT';
//   static const _UPDATE_PRODUCT_ACTION = 'UPDATE_PRODUCT';
//   static const _DELETE_PRODUCT_ACTION = 'DELETE_PRODUCT';
//
//   static Future<List<InventoryClass>> getProducts() async {
//     try {
//       var map = Map<String, dynamic>();
//       map['action'] = _GET_ALL_ACTION;
//       final response = await http.post(Uri.parse(GETDATA), body: map);
//       print('getEmployees Response: ${response.body}');
//       if (200 == response.statusCode) {
//         List<InventoryClass> list = json.decode(response.body);
//
//         return list;
//       } else {
//         return List<InventoryClass>();
//       }
//     } catch (e) {
//       return List<InventoryClass>(); // return an empty list on exception/error
//     }
//   }
//
//   static List<InventoryClass> parseResponse(String responseBody) {
//     final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//     return parsed.map<InventoryClass>((json) => InventoryClass.fromJson(json)).toList();
//   }
//
//   // Method to add employee to the database...
//   static Future<String> addProducts(String Name, String SKU, String QR_code, String Quantity,
//       String Image_of_product, String Cost_price, String Variant, String Selling_price, String Compared_at_price) async {
//     try {
//       var map = Map<String, dynamic>();
//       map['action'] = _ADD_PRODUCT_ACTION;
//       map['Name'] = Name;
//       map['SKU'] = SKU;
//       map['QR code'] = QR_code;
//       map['Quantity'] = Quantity;
//       map['Image of product'] = Image_of_product;
//       map['Cost price'] = Cost_price;
//       map['Variant'] = Variant;
//       map['Selling price'] = Selling_price;
//       map['Compared at price price'] = Compared_at_price;
//
//       final response = await http.post(Uri.parse(SETDATA), body: map);
//       print('addProducts Response: ${response.body}');
//       if (200 == response.statusCode) {
//         return response.body;
//       } else {
//         return "error";
//       }
//     } catch (e) {
//       return "error";
//     }
//   }
//
//   // Method to update an Employee in Database...
//   static Future<String> updateProducts(String Name, String SKU, String QR_code, String Quantity,
//       String Image_of_product, String Cost_price, String Variant, String Selling_price, String Compared_at_price) async {
//     try {
//       var map = Map<String, dynamic>();
//       map['action'] = _UPDATE_PRODUCT_ACTION;
//       map['Name'] = Name;
//       map['SKU'] = SKU;
//       map['QR code'] = QR_code;
//       map['Quantity'] = Quantity;
//       map['Image of product'] = Image_of_product;
//       map['Cost price'] = Cost_price;
//       map['Variant'] = Variant;
//       map['Selling price'] = Selling_price;
//       map['Compared at price price'] = Compared_at_price;
//
//       final response = await http.post(Uri.parse(SETDATA), body: map);
//       print('updateProducts Response: ${response.body}');
//       if (200 == response.statusCode) {
//         return response.body;
//       } else {
//         return "error";
//       }
//     } catch (e) {
//       return "error";
//     }
//   }
//
//   // Method to Delete an Employee from Database...
//   static Future<String> deleteProduct(String SKU) async {
//     try {
//       var map = Map<String, dynamic>();
//       map['action'] = _DELETE_PRODUCT_ACTION;
//       map['SKU'] = SKU;
//       final response = await http.post(Uri.parse(SETDATA), body: map);
//       print('deleteProducts Response: ${response.body}');
//       if (200 == response.statusCode) {
//         return response.body;
//       } else {
//         return "error";
//       }
//     } catch (e) {
//       return "error"; // returning just an "error" string to keep this simple...
//     }
//   }
// }
