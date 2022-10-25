import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  int price;
  String title;
  String category;
  String location;
  String description;
  int userId;
  Post(
      {required this.price,
      required this.title,
      required this.category,
      required this.location,
      required this.description,
      required this.userId});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        price: json["price"],
        title: json["title"],
        category: json["category"],
        location: json["location"],
        description: json["description"],
        userId: json["url_id"],
      );
  Map<String, dynamic> toJson() => {
        "price": price,
        "title": title,
        "category": category,
        "location": location,
        "description": description,
        "url_id": userId,
      };
}
