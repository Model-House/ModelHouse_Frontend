import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:model_house/models/room.dart';

class RoomService {
  String url = 'https://model-house.azurewebsites.net/api/v1/';
  var client = http.Client();

  Future<List<Room>?> getPostsByUserId(int id) async {
    var uri = Uri.parse('${url}rooms/user/$id');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }

  Future<Room?> postPosts(String name, bool check, int userId) async {
    var response = await http.post(
      Uri.parse('${url}rooms'),
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
      return Room.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
    }
  }

  Future<Room?> updatePosts(int id, bool check, int userId) async {
    var response = await http.put(
      Uri.parse('${url}rooms/${id + 1}'),
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
      return Room.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
    }
  }
}
