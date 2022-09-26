import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:model_house/models/post.dart';

class RemoteService {
  String url = 'https://localhost:7070/api/v1/';
  var client = http.Client();

  Future<List<Post>?> getPosts() async {
    var uri = Uri.parse('${url}areas');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }

  // Future<Post> updatePosts(int id, bool check) async {
  //   final response = await http.put(
  //     Uri.parse('${url}areas/$id'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, bool>{
  //       'check': check,
  //     }),
  //   );

  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     return Post.fromJson(jsonDecode(response.body));
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to update album.');
  //   }
  // }
}
