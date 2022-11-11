import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:model_house/models/notification.dart';

class HttpNotificationOrder {
  final String urlBase = 'https://model-house.azurewebsites.net';
  final String urlGetAll = '/api/v1/notification/';
  final String urlGetUserId = '/api/v1/notification/user/';
  String? userId;
  var notification = http.Client();

  // ignore: body_might_complete_normally_nullable
  Future<List<Notifi>?> getAllNotification() async {
    final String getAll = urlBase + urlGetAll;
    var uri = Uri.parse(getAll);
    var response = await notification.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return NotificationFromJson(json);
    }
  }

  // ignore: body_might_complete_normally_nullable
  Future<List?> getNotificationByUserId(String id) async {
    final String getByUserId = urlBase + urlGetUserId + id;
    var uri = Uri.parse(getByUserId);
    var response = await notification.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return NotificationFromJson(json);
    }
  }

  // ignore: body_might_complete_normally_nullable
  Future<Notifi?> postValueNotification(
      String title, String description, int userId) async {
    final String notificationUrl = urlBase + urlGetAll;
    var uri = Uri.parse(notificationUrl);
    print(userId);
    var response = await notification.post(uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json"
        },
        body: jsonEncode(
            {'title': title, 'description': description, 'userId': userId}));
    print("dsnuihsbdiugsd");
    if (response.statusCode == 200) {
      return Notifi.fromJson(jsonDecode(response.body));
    }
  }
}
