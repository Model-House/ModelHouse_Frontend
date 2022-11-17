import 'package:flutter/material.dart';
import 'package:model_house/models/Contact.dart';
import 'package:model_house/screens/chat.dart';
import 'package:model_house/services/contact_service.dart';

import '../models/user.dart';

class Message extends StatefulWidget {
  User? user;
  Message(this.user, {super.key});
  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  HttpContact? _httpContact;
  List<Contact>? contacts;
  @override
  void initState() {
    _httpContact = HttpContact();
    initialize();
    super.initState();
  }

  Future initialize() async {
    contacts = List.empty();
    contacts =
        await _httpContact?.getContactByUserId(widget.user!.id.toString());
    setState(() {
      contacts = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
            itemCount: contacts == null ? 0 : contacts?.length,
            itemBuilder: ((context, index) {
              return MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          Chat(contacts?[index], widget.user)));
                },
                child: Card(
                  child: ListTile(
                    leading: contacts![index].user.image == "image"
                        ? const Icon(
                            Icons.account_circle,
                            color: Colors.red,
                            size: 60.0,
                          )
                        : Image(
                            image: NetworkImage(contacts![index].user.image),
                          ),
                    title: Text(contacts![index].user.username),
                    subtitle: Text(contacts![index].user.phone),
                  ),
                ),
              );
            })),
      ),
    );
  }
}
