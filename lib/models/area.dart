import 'dart:convert';
import 'dart:ffi';

List<Area> postFromJson(String str) =>
    List<Area>.from(json.decode(str).map((x) => Area.fromJson(x)));

String postToJson(List<Area> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Area {
  Area({
    required this.name,
    required this.check,
    required this.userId,
  });
  String name;
  bool check;
  int userId;
  factory Area.fromJson(Map<String, dynamic> json) => Area(
        name: json["name"],
        check: json["check"],
        userId: json["userId"],
      );
  Map<String, dynamic> toJson() => {
        "name": name,
        "check": check,
        "userId": userId,
      };
}
