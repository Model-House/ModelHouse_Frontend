import 'dart:convert';

List<Area> postFromJson(String str) =>
    List<Area>.from(json.decode(str).map((x) => Area.fromJson(x)));

String postToJson(List<Area> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Area {
  Area({
    required this.id,
    required this.name,
    required this.check,
  });
  int id;
  String name;
  bool check;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
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
