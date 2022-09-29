import 'dart:convert';

List<Room> postFromJson(String str) =>
    List<Room>.from(json.decode(str).map((x) => Room.fromJson(x)));

String postToJson(List<Room> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Room {
  Room({
    required this.id,
    required this.name,
    required this.check,
  });
  int id;
  String name;
  bool check;

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json["id"],
        name: json["name"],
        check: json["check"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "check": check,
      };
}
