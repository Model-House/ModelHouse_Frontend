import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:model_house/models/area.dart';

class AreaService {
  String url = 'https://model-house.azurewebsites.net/api/v1/';
  var client = http.Client();

  Future<List<Area>?> getPostsByUserId(int id) async {
    var uri = Uri.parse('${url}areas/user/$id');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }

  Future<Area?> postPosts(String name, bool check, int userId) async {
    var response = await http.post(
      Uri.parse('${url}areas'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
      },
      body: jsonEncode({
        'name': name,
        'check': check,
        'userId': userId,
      }),
    );
    if (response.statusCode == 200) {
      return Area.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
    }
  }

  Future<Area?> updatePosts(int id, bool check, int userId) async {
    var response = await http.put(
      Uri.parse('${url}areas/${id + 1}'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
      },
      body: jsonEncode({
        'check': check,
        'userId': userId,
      }),
    );
    print(check);
    print(userId);
    print(response.body);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Area.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
    }
  }
}
