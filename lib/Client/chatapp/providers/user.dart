// @dart=2.9
import 'package:erp/Client/chatapp/models/user.dart';
import 'package:erp/Client/chatapp/services/user.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  List<UserModel> users = [];
  UserServices _userServices = UserServices() ;
  UserProvider.init() {
    _getUsers();
  }
  _getUsers() async {
    users = await _userServices.getAll();
    notifyListeners();
  }
}