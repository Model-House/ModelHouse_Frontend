import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:model_house/models/post.dart';

class HttpPost {
  final String urlBase = 'https://model-house.azurewebsites.net';
  final String urlGetAll = '/api/v1/post/';
  final String urlGetUserId = '/api/v1/post/user/';
  String? userId;
  var post = http.Client();

  // ignore: body_might_complete_normally_nullable
  Future<List?> getAllPost() async {
    final String getAll = urlBase + urlGetAll;
    var uri = Uri.parse(getAll);
    var response = await post.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }

  // ignore: body_might_complete_normally_nullable
  Future<List?> getByTitle(String title) async {
    final String getByTitle = urlBase + urlGetAll + title;
    try {
      var uri = Uri.parse(getByTitle);
      var response = await post.get(uri);
      print(response.body);
      return postFromJson(response.body);
    } catch (e) {
      print("Error");
    }
  }

  // ignore: body_might_complete_normally_nullable
  Future<List?> getPostByUserId(String id) async {
    final String getByUserId = urlBase + urlGetUserId + id;
    var uri = Uri.parse(getByUserId);
    var response = await post.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }

  // ignore: body_might_complete_normally_nullable
  Future<Post?> postValuePost(String title, int price, String category,
      String location, String description, int userId) async {
    final String postUrl = urlBase + urlGetAll;
    var uri = Uri.parse(postUrl);
    print(userId);
    var response = await post.post(uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json"
        },
        body: jsonEncode({
          'price': price,
          'title': title,
          'category': category,
          'location': location,
          'description': description,
          'userId': userId
        }));
    print("dsnuihsbdiugsd");
    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    }
  }
}
