import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:model_house/models/Contact.dart';
import 'package:model_house/models/Message.dart';

class HttppMessage {
  final String urlBase = 'https://model-house.azurewebsites.net';
  final String urlGetAll = '/api/v1/message/';
  final String urlGetUserId = '/api/v1/message/contact/';
  String? userId;
  var message = http.Client();

  // ignore: body_might_complete_normally_nullable
  Future<List<Message>?> getByUserId() async {
    final String getAll = urlBase + urlGetAll;
    var uri = Uri.parse(getAll);
    var response = await message.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return messageFromJson(json);
    }
  }

  // ignore: body_might_complete_normally_nullable
  Future<List?> getByTitle(String title) async {
    final String getByTitle = urlBase + urlGetAll + title;
    try {
      var uri = Uri.parse(getByTitle);
      var response = await message.get(uri);
      print(response.body);
      return messageFromJson(response.body);
    } catch (e) {
      print("Error");
    }
  }

  // ignore: body_might_complete_normally_nullable|
  Future<List<Message>?> getMessageByUserId(String id) async {
    final String getByUserId = urlBase + urlGetUserId + id;
    var uri = Uri.parse(getByUserId);
    var response = await message.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return messageFromJson(json);
    }
  }

  // ignore: body_might_complete_normally_nullable
  Future<Message?> postValueMessage(
      String content, String shippingTime, bool isMe, int contactId) async {
    final String messageUrl = urlBase + urlGetAll;
    var uri = Uri.parse(messageUrl);
    print(messageUrl);
    var response = await message.post(uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json"
        },
        body: jsonEncode({
          'content': content,
          'shippingTime': shippingTime,
          'isMe': isMe,
          'contactId': contactId
        }));
    print(response.body);
    if (response.statusCode == 200) {
      return Message.fromJson(jsonDecode(response.body));
    }
  }
}
