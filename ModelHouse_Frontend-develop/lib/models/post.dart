import 'dart:convert';

import 'package:model_house/models/user.dart';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  int id;
  int price;
  String title;
  String category;
  String location;
  String description;
  int userId;
  Post({
    required this.id,
    required this.price,
    required this.title,
    required this.category,
    required this.location,
    required this.description,
    required this.userId,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        price: json["price"],
        title: json["title"],
        category: json["category"],
        location: json["location"],
        description: json["description"],
        userId: json["userId"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "title": title,
        "category": category,
        "location": location,
        "description": description,
        "userId": userId,
      };
}
