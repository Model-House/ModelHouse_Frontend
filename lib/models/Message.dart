import 'dart:convert';

import 'package:model_house/models/user.dart';

List<Message> messageFromJson(String str) =>
    List<Message>.from(json.decode(str).map((x) => Message.fromJson(x)));

String messageToJson(List<Message> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Message {
  int id;
  String content;
  String shippingTime;
  bool isMe;
  int contactId;
  int userId;
  Message(
      {required this.id,
      required this.content,
      required this.shippingTime,
      required this.isMe,
      required this.contactId,
      required this.userId});

  factory Message.fromJson(Map<String, dynamic> json) => Message(
      id: json["id"],
      content: json["content"],
      shippingTime: json["shippingTime"],
      isMe: json["isMe"],
      contactId: json["contactId"],
      userId: json["userId"]);
  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "shippingTime": shippingTime,
        "isMe": isMe,
        "contactId": contactId,
        "userId": userId
      };
}
