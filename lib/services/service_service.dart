import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:model_house/models/service-op.dart';

class ServiceService {
  String url = 'https://localhost:7070/api/v1/';
  var client = http.Client();

  Future<List<ServiceOp>?> getPosts() async {
    var uri = Uri.parse('${url}services');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }

  Future<ServiceOp> updatePosts(int id, bool check) async {
    final response = await http.put(
      Uri.parse('${url}services/${id + 1}'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
      },
      body: jsonEncode({
        'check': check,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return ServiceOp.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to update album.');
    }
  }
}
