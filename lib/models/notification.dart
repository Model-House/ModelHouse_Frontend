import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<Notifi> NotificationFromJson(String str) =>
    List<Notifi>.from(json.decode(str).map((x) => Notifi.fromJson(x)));

String postToJson(List<Notifi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Notifi {
  int id;
  String title;
  String description;
  int userId;
  Notifi(
      {required this.id,
      required this.title,
      required this.description,
      required this.userId});
  factory Notifi.fromJson(Map<String, dynamic> json) => Notifi(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        userId: json["userId"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "userId": userId,
      };
}
