import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/post.dart';

class FormOrder extends StatefulWidget {
  final Post? post;
  const FormOrder(this.post, {Key? key}) : super(key: key);

  @override
  _FormOrderState createState() => _FormOrderState();
}

class _FormOrderState extends State<FormOrder> {
  final title = TextEditingController();
  final description = TextEditingController();

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
        title: const Text("Create new Order"),
        backgroundColor: const Color(0xff007AFF),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
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
                onPressed: () {},
                child: const Text(
                  'Contact Us',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
