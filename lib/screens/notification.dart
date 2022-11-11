import 'package:flutter/material.dart';
import 'package:model_house/models/notification.dart';
import 'package:model_house/services/service_notification.dart';

import '../models/user.dart';

class Notifica extends StatefulWidget {
  final User? user;
  Notifica(this.user);
  @override
  State<Notifica> createState() => _NotifiState();
}

class _NotifiState extends State<Notifica> {
  HttpNotificationOrder? _httpNotificationOrder;
  List? notifications;
  @override
  void initState() {
    _httpNotificationOrder = HttpNotificationOrder();
    intialize();
    super.initState();
  }

  Future intialize() async {
    notifications = await _httpNotificationOrder
        ?.getNotificationByUserId(widget.user!.id.toString());
    setState(() {
      notifications = notifications;
      print("Si entro causa");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
            itemCount: notifications == null ? 0 : notifications?.length,
            itemBuilder: ((context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                      notifications == null ? 0 : notifications?[index].title),
                  subtitle: Text(notifications == null
                      ? 0
                      : notifications?[index].description),
                ),
              );
            })));
  }
}
