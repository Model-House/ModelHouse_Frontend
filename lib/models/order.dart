import 'dart:convert';

import 'package:model_house/models/post.dart';
import 'package:model_house/models/user.dart';

List<Order> orderFromJson(String str) =>
    List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  int id;
  String title;
  String description;
  int userId;
  User user;
  Post post;
  int postId;
  int sendUserId;
  Order(
      {required this.id,
      required this.title,
      required this.description,
      required this.userId,
      required this.user,
      required this.post,
      required this.postId,
      required this.sendUserId});
  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        userId: json["user_id"],
        user: User.fromJson(json['user']),
        post: Post.fromJson(json['post']),
        postId: json["post_id"],
        sendUserId: json["send_user_id"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "url_id": userId,
        "user": user.toJson(),
        "post": post.toJson(),
        "post_id": postId,
        "send_user_id": sendUserId
      };
}
