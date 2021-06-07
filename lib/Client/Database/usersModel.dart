// @dart=2.9
import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.pass,
    this.address,
    this.department,
    this.userType,
  });

  String id;
  String name;
  String phone;
  String email;
  String pass;
  String address;
  String department;
  String userType;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    pass: json["pass"],
    address: json["address"],
    department: json["department"],
    userType: json["userType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "email": email,
    "pass": pass,
    "address": address,
    "department": department,
    "userType": userType,
  };
}
