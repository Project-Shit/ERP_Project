// @dart=2.9
import 'package:erp/Client/chatapp/services/messages.dart';
import 'package:erp/Client/chatapp/models/user.dart';
import 'package:flutter/material.dart';

class MessagesProvider with ChangeNotifier {
  TextEditingController messageController = TextEditingController();
  MessageServices _messageServices = MessageServices();
  sendMessage({UserModel sender}) {
    _messageServices.sendMessage(
      sender: sender, content: messageController.text);
    messageController.clear();
    notifyListeners();

  }
}