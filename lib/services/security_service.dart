import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class HttpSecurity {
  final String urlBase = 'https://model-house.azurewebsites.net';
  final String urlSignIn = '/api/v1/users/sign-in';
  final String urlSignUp = '/api/v1/users/sign-up';
  final String users = '/api/v1/users/';
  String? userId;
  var user = http.Client();

  Future<User?> getUser() async {
    final String postUrl = urlBase + users;
    var uri = Uri.parse(postUrl);
    var response = await user.get(uri, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      "Accept": "application/json"
    });
    try {
      return User.fromJson(jsonDecode(response.body));
    } catch (e) {
      print("Error");
    }
  }

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
      print("Error");
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
          'image': "image",
          'phone': "971486606",
          'email': email,
          'password': password,
        }));
    try {
      return response.body;
    } catch (e) {
      print("Error");
    }
  }

  Future<bool?> updateUser(
      String id, String username, String image, String phone) async {
    final String userUrl = urlBase + users + id;
    var uri = Uri.parse(userUrl);
    print(id);
    print(userUrl);
    var request = http.MultipartRequest('PUT', uri);

    request.files.add(await http.MultipartFile.fromPath('image', image));
    request.fields['username'] = username;
    request.fields['phone'] = phone;

    request.headers.addAll({
      "Content-type": "multipart/form-data",
    });
    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      print(response.body);
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      print("Algo salio mal");
    }
  }
}
