import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:model_house/models/Contact.dart';

class HttpContact {
  final String urlBase = 'https://model-house.azurewebsites.net';
  final String urlGetAll = '/api/v1/contact/';
  final String urlGetUserId = '/api/v1/contact/user/';
  String? userId;
  var contact = http.Client();

  // ignore: body_might_complete_normally_nullable
  Future<List<Contact>?> getByUserId() async {
    final String getAll = urlBase + urlGetAll;
    var uri = Uri.parse(getAll);
    var response = await contact.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return contactFromJson(json);
    }
  }

  // ignore: body_might_complete_normally_nullable
  Future<List?> getByTitle(String title) async {
    final String getByTitle = urlBase + urlGetAll + title;
    try {
      var uri = Uri.parse(getByTitle);
      var response = await contact.get(uri);
      print(response.body);
      return contactFromJson(response.body);
    } catch (e) {
      print("Error");
    }
  }

  // ignore: body_might_complete_normally_nullable
  Future<List<Contact>?> getContactByUserId(String id) async {
    final String getByUserId = urlBase + urlGetUserId + id;
    var uri = Uri.parse(getByUserId);
    var response = await contact.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return contactFromJson(json);
    }
  }

  // ignore: body_might_complete_normally_nullable
  Future<Contact?> postValueContact(
      int userId, String name, int contactId) async {
    final String contactUrl = urlBase + urlGetAll;
    var uri = Uri.parse(contactUrl);
    print(contactId);
    var response = await contact.post(uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json"
        },
        body: jsonEncode({
          'userId': userId.toString(),
          'name': name,
          'contactId': contactId
        }));
    print(response.body);
    if (response.statusCode == 200) {
      return Contact.fromJson(jsonDecode(response.body));
    }
  }
}
