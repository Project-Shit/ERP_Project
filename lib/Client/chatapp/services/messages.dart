// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:erp/Client/chatapp/helper/constants.dart';
import 'package:erp/Client/chatapp/models/message.dart';
import 'package:erp/Client/chatapp/models/user.dart';
import 'package:uuid/uuid.dart';

class MessageServices {
  String collection = "messages";
  void sendMessage({
  UserModel sender,
    String content,
}) {
    String id = Uuid().v1();
    firebaseFirestore.collection(collection).doc(id).set ({
      "id": id,
      "senderId": sender.id,
      "senderName": sender.name,
      "content": DateTime.now().microsecondsSinceEpoch
    });

  }
  Stream<List<MessageModel>> getMessages() {
    return firebaseFirestore
        .collection(collection)
        .orderBy('sentAt', descending: true)
        .snapshots()
        .map((event) => event.docs
        .map((snapshot) => MessageModel.fromSnapshot(snapshot))
        .toList());
  }
}