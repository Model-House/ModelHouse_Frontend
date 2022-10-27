import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:model_house/models/service-op.dart';

class ServiceService {
  String url = 'https://localhost:7120/api/v1/';
  var client = http.Client();

  // ignore: body_might_complete_normally_nullable
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
      return ServiceOp.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update album.');
    }
  }
}
