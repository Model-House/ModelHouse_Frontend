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
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("Messages"),
        backgroundColor: Color(0XFFE43848),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: ListView.builder(
            itemCount: contacts == null ? 0 : contacts?.length,
            itemBuilder: ((context, index) {
              return MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          Chat(contacts?[index], widget.user)));
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color(0XFF30363B),
                  ),
                  child: ListTile(
                    leading: contacts![index].user.image == "image"
                        ? const Icon(
                            Icons.account_circle,
                            color: Color(0XFFE43848),
                            size: 60.0,
                          )
                        : Image(
                            image: NetworkImage(contacts![index].user.image),
                          ),
                    title: Text(
                      contacts![index].user.username,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    subtitle: Text(
                      contacts![index].user.phone,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              );
            })),
      ),
    );
  }
}
