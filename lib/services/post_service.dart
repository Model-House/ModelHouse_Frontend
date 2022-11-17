import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:model_house/models/post.dart';

class HttpPost {
  final String urlBase = 'https://model-house.azurewebsites.net';
  final String urlGetAll = '/api/v1/post/';
  final String urlGetUserId = '/api/v1/post/user/';
  String? userId;
  var post = http.Client();

  // ignore: body_might_complete_normally_nullable
  Future<List<Post>?> getAllPost() async {
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
      String location, String description, int userId, String foto) async {
    final String postUrl = urlBase + urlGetAll;
    var uri = Uri.parse(postUrl);

    var stream = new http.ByteStream(File(foto).openRead());
    var length = await File(foto).length();
    var multiport = new http.MultipartFile('foto', stream, length);
    var response = await post.post(uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json"
        },
        body: json.encode({
          'price': price,
          'title': title,
          'category': category,
          'location': location,
          'description': description,
          'userId': userId,
          'foto': MultipartFile.fromPath('foto', foto),
        }));
    print(response.body);
    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    }
  }

  Future<Post?> PathPost(String title, int price, String category,
      String location, String description, int userId, String foto) async {
    final String postUrl = urlBase + urlGetAll;
    var uri = Uri.parse(postUrl);
    var request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath('foto', foto));
    request.fields['price'] = price.toString();
    request.fields['title'] = title;
    request.fields['category'] = category;
    request.fields['location'] = location;
    request.fields['description'] = description;
    request.fields['userId'] = userId.toString();

    request.headers.addAll({
      "Content-type": "multipart/form-data",
    });
    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200) {
        return Post.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print("Algo salio mal");
    }
  }
}
