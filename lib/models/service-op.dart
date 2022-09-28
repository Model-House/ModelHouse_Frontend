import 'dart:convert';

List<ServiceOp> postFromJson(String str) =>
    List<ServiceOp>.from(json.decode(str).map((x) => ServiceOp.fromJson(x)));

String postToJson(List<ServiceOp> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceOp {
  ServiceOp({
    required this.id,
    required this.name,
    required this.check,
  });
  int id;
  String name;
  bool check;

  factory ServiceOp.fromJson(Map<String, dynamic> json) => ServiceOp(
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
