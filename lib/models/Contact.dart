import 'dart:convert';

import 'package:model_house/models/user.dart';

List<Contact> contactFromJson(String str) =>
    List<Contact>.from(json.decode(str).map((x) => Contact.fromJson(x)));

String contactToJson(List<Contact> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Contact {
  int id;
  int userId;
  int contactId;
  User user;

  Contact(
      {required this.id,
      required this.userId,
      required this.contactId,
      required this.user});

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
      id: json["id"],
      userId: json["userId"],
      contactId: json["contactId"],
      user: User.fromJson(json['user']));
  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "contactId": contactId,
        "user": user.toJson()
      };
}
