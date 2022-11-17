class User {
  int id;
  String username;
  String email;
  String token;

  User(
      {required this.id,
      required this.username,
      required this.email,
      required this.token});
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        token: json["token"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "token": token,
      };
}
