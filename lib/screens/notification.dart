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
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Text(
              "Notification",
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: ListView.builder(
                itemCount: notifications == null ? 0 : notifications?.length,
                itemBuilder: ((context, index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
                    decoration: BoxDecoration(
                        color: Color(0XFF30363B),
                        borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 0, 10),
                        child: Text(
                          notifications == null
                              ? 0
                              : notifications?[index].title,
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.fromLTRB(6, 5, 0, 10),
                        child: Text(
                          notifications == null
                              ? 0
                              : notifications?[index].description,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  );
                })),
          )),
        ],
      ),
    );
  }
}
