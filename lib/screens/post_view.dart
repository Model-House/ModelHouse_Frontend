import 'package:flutter/material.dart';
import 'package:model_house/services/order_service.dart';
import 'package:model_house/services/service_notification.dart';

import '../models/notification.dart';
import '../models/order.dart';
import '../models/post.dart';
import '../models/user.dart';
import '../services/notification_service.dart';

class PostView extends StatefulWidget {
  final Post? post;
  final User? user;
  const PostView(this.user, this.post, {Key? key}) : super(key: key);

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  final title = TextEditingController();
  final description = TextEditingController();
  HttpOrder? _httpOrder;
  HttpNotificationOrder? _httpNotification;
  Order? order1;
  Order? order2;
  Notifi? notification1;
  Notifi? notification2;
  late final NotificationService service;

  void initState() {
    _httpOrder = HttpOrder();
    _httpNotification = HttpNotificationOrder();
    service = NotificationService(context);
    service.intialize();
    super.initState();
  }

  Future createNotification() async {
    notification1 = await _httpNotification?.postValueNotification(
        title.text, description.text, widget.post!.userId);
    notification2 = await _httpNotification?.postValueNotification(
        title.text, description.text, widget.user!.id);
  }

  Future initialize() async {
    order1 = await _httpOrder?.postValueOrder(title.text, description.text,
        widget.post!.userId, widget.post!.id, widget.user!.id);
    order2 = await _httpOrder?.postValueOrder(title.text, description.text,
        widget.user!.id, widget.post!.id, widget.post!.userId);

    setState(() {
      order1 = order1;
      order2 = order2;
      if (order1?.title != null && order2?.title != null) {
        createNotification();
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("The Order was created successfully"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        title.text = "";
                        description.text = "";
                        service.showNotificationWithActions(
                            id: 0,
                            title: "You have a new Order",
                            body: "you made a new shipment of Order");
                      },
                      child: const Text("Ok"))
                ],
              );
            });
      } else {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Something went wrong"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        title.text = "";
                        description.text = "";
                      },
                      child: const Text("Ok"))
                ],
              );
            });
      }
    });
  }

  InputDecoration decorationInput(String message) {
    return InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: message,
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffEBDCFA)),
            borderRadius: BorderRadius.circular(15)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffEBDCFA)),
            borderRadius: BorderRadius.circular(15)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: const Text("View Post"),
          backgroundColor: const Color(0xff007AFF),
        ),
        body: Container(
            padding: const EdgeInsets.all(15),
            child: ListView(children: [
              const Image(
                  image: NetworkImage(
                      "https://st2.depositphotos.com/2235295/7169/i/450/depositphotos_71697893-stock-photo-blueprints-and-safety-helmet-over.jpg")),
              const SizedBox(
                height: 15,
              ),
              Text(widget.post!.title,
                  style: const TextStyle(color: Colors.white, fontSize: 35)),
              const SizedBox(
                height: 5,
              ),
              Text(widget.post!.location,
                  style: const TextStyle(color: Colors.white, fontSize: 30)),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Description: ",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                widget.post!.userId.toString(),
                style: const TextStyle(color: Color(0XFFD9D9D9)),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 15),
                child: Text(
                  "Create new Order",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextField(
                    controller: title, decoration: decorationInput("Title")),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextField(
                    controller: description,
                    decoration: decorationInput("Description")),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                decoration: BoxDecoration(
                    color: const Color(0xff007AFF),
                    borderRadius: BorderRadius.circular(15)),
                width: MediaQuery.of(context).size.width - 100,
                height: 50,
                child: MaterialButton(
                  onPressed: () {
                    initialize();
                    //print(widget.post);
                    //print(widget.post!.userId);
                  },
                  child: const Text(
                    'New Order',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              )
            ])));
  }
}
