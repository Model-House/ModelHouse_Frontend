import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:model_house/models/post.dart';

class HttpPost {
  final String urlBase = 'https://localhost:7120';
  final String urlGetAll = '/api/v1/post/';
  final String urlGetUserId = '/api/v1/post/user/';
  String? userId;
  var post = http.Client();

  Future<List?> getAllPost() async {
    final String getAll = urlBase + urlGetAll;
    var uri = Uri.parse(getAll);
    var response = await post.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }

  Future<List?> getByTitle(String title) async {
    final String getByTitle = urlBase + urlGetAll + title;
    try {
      print(getByTitle);
      var uri = Uri.parse(getByTitle);
      var response = await post.get(uri);
      return postFromJson(response.body);
    } catch (e) {
      print("algo malio sal");
    }
    //if (response.statusCode == 200) {
    //  return Post.fromJson(jsonDecode(response.body));
    //} else {
    //  throw ('Failed to update album');
    //}
  }

  Future<List?> getPostByUserId(String id) async {
    final String getByUserId = urlBase + urlGetUserId + id;
    var uri = Uri.parse(getByUserId);
    var response = await post.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }

  Future<Post?> postValuePost(Post value) async {
    final String postUrl = urlBase + urlGetAll;
    var uri = Uri.parse(postUrl);
    print(value.title);
    var response = await post.post(uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json"
        },
        body: jsonEncode({
          'price': value.price,
          'title': value.title,
          'category': value.category,
          'location': value.location,
          'description': value.description,
          'userId': value.userId
        }));
    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    }
  }
}
