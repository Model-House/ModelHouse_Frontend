class User {
  int id;
  String image;
  String phone;
  String username;
  String email;
  String token;
  User({
    required this.id,
    required this.image,
    required this.phone,
    required this.username,
    required this.email,
    required this.token,
  });
  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        image: json["image"],
        phone: json["phone"],
        username: json["username"],
        email: json["email"],
        token: json["token"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "phone": phone,
        "username": username,
        "email": email,
        "token": token,
      };
}
