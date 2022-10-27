import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class HttpSecurity {
  final String urlBase = 'https://localhost:7120';
  final String urlSignIn = '/api/v1/users/sign-in';
  final String urlSignUp = '/api/v1/users/sign-up';
  String? userId;
  var user = http.Client();

  // ignore: body_might_complete_normally_nullable
  Future<User?> signIn(String email, String password) async {
    final String postUrl = urlBase + urlSignIn;
    var uri = Uri.parse(postUrl);
    var response = await user.post(uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json"
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }));
    try {
      return User.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("prueba otra vez");
    }
  }

  // ignore: body_might_complete_normally_nullable
  Future<String?> signUp(String username, String email, String password) async {
    final String postUrl = urlBase + urlSignUp;
    var uri = Uri.parse(postUrl);
    var response = await user.post(uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json"
        },
        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
        }));
    print(response.body);
    try {
      return response.body;
    } catch (e) {
      print("no salio pipipi");
    }
  }
}
