// @dart=2.9
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  static const ID = "id";
  static const CONTENT = "content";
  static const SENDER_ID = "senderId";
  static const SENDER_NAME = "senderName";
  static const SENT_AT = "sentAt";

  String id;
  String content;
  String senderId;
  String senderName;
  String sentAt;
  MessageModel.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot.data()[ID];
    content = snapshot.data()[CONTENT];
    senderId = snapshot.data()[SENDER_ID];
    senderName = snapshot.data()[SENDER_NAME];
    sentAt = snapshot.data()[SENT_AT];

  }
}