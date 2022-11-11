import 'dart:convert';
import 'package:model_house/models/order.dart';
import 'package:http/http.dart' as http;

class HttpOrder {
  final String urlBase = 'https://localhost:7120';
  final String urlGetAll = '/api/v1/order/';
  final String urlGetUserId = '/api/v1/order/user/';
  String? userId;
  var order = http.Client();

  // ignore: body_might_complete_normally_nullable
  Future<List<Order>?> getAllOrders() async {
    final String getAll = urlBase + urlGetAll;
    var uri = Uri.parse(getAll);
    var response = await order.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return orderFromJson(json);
    }
  }

  // ignore: body_might_complete_normally_nullable
  //Future<List?> getByTitle(String title) async {
  //  final String getByTitle = urlBase + urlGetAll + title;
  //  try {
  //    var uri = Uri.parse(getByTitle);
  //    var response = await order.get(uri);
  //    print(response.body);
  //    return orderFromJson(response.body);
  //  } catch (e) {
  //    print("Error");
  //  }
  //}

  // ignore: body_might_complete_normally_nullable
  Future<List?> getOrderByUserId(String id) async {
    final String getByUserId = urlBase + urlGetUserId + id;
    var uri = Uri.parse(getByUserId);
    var response = await order.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      print(response.body);
      return orderFromJson(json);
    }
  }

  // ignore: body_might_complete_normally_nullable
  Future<Order?> postValueOrder(String title, String description,
      int sendUserId, int postId, int userId) async {
    final String postUrl = urlBase + urlGetAll;
    var uri = Uri.parse(postUrl);
    print(userId);
    var response = await order.post(uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json"
        },
        body: jsonEncode({
          'title': title,
          'description': description,
          'userId': userId.toString(),
          'postId': postId.toString(),
          'sendUserId': sendUserId.toString()
        }));
    print(response.body);
    if (response.statusCode == 200) {
      return Order.fromJson(jsonDecode(response.body));
    }
  }
}
