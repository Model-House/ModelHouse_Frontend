import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model_house/models/Contact.dart';
import 'package:model_house/models/Message.dart';
import 'package:model_house/services/message_service.dart';

import '../models/user.dart';

class Chat extends StatefulWidget {
  Contact? contact;
  User? user;
  Chat(this.contact, this.user, {Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final content = TextEditingController();
  HttppMessage? _httppMessage;
  List<Message>? messages;
  Message? newMessage1;
  Message? newMessage2;
  @override
  void initState() {
    _httppMessage = HttppMessage();
    initialize();
    super.initState();
  }

  Future initialize() async {
    messages =
        await _httppMessage?.getMessageByUserId(widget.user!.id.toString());
    setState(() {
      messages = messages;
    });
  }

  Future addMessage() async {
    print(widget.contact!.userId);
    print(widget.contact!.contactId);
    newMessage1 = await _httppMessage?.postValueMessage(
        content.text, "2022-11-17T04:18:07.333Z", true, widget.contact!.userId);
    newMessage2 = await _httppMessage?.postValueMessage(content.text,
        "2022-11-17T04:18:07.333Z", false, widget.contact!.contactId);
    setState(() {
      newMessage1 = newMessage1;
      messages?.add(newMessage1!);
    });
  }

  _buildMessage(Message message) {
    return Container(
        margin: message.isMe
            ? const EdgeInsets.only(top: 8, bottom: 8, left: 80)
            : const EdgeInsets.only(top: 8, bottom: 8, right: 80),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        decoration: BoxDecoration(
            color: message.isMe
                ? const Color(0xFFD4493F)
                : const Color(0XFF30363B),
            borderRadius: message.isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15))
                : const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
        child: Text(
          message.content,
          style: TextStyle(color: Colors.white),
        ));
  }

  _buildMessageCompose() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Color(0XFF30363B),
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.photo),
            iconSize: 25,
            color: const Color(0xFFD4493F),
          ),
          Expanded(
              child: TextField(
            textCapitalization: TextCapitalization.sentences,
            controller: content,
            decoration: const InputDecoration(
                hintText: 'Send a message...',
                hintStyle: TextStyle(color: Colors.white)),
          )),
          IconButton(
            onPressed: () {
              addMessage();
              setState(() {
                content.text = "";
              });
            },
            icon: const Icon(Icons.send),
            iconSize: 25,
            color: const Color(0xFFD4493F),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(widget.contact!.user.username),
        backgroundColor: Color(0XFFE43848),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0XFF1C1C1C),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    child: ListView.builder(
                      //reverse: true,
                      padding: const EdgeInsets.only(top: 15),
                      itemCount: messages == null ? 0 : messages?.length,
                      itemBuilder: ((context, index) {
                        return _buildMessage(messages![index]);
                      }),
                    ),
                  ))),
          _buildMessageCompose()
        ],
      ),
    );
  }
}
