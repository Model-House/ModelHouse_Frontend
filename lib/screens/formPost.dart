import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model_house/models/post.dart';
import 'package:model_house/services/post_service.dart';

import '../models/user.dart';

class FormPost extends StatefulWidget {
  final User? user;
  const FormPost(this.user, {Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FormPostState createState() => _FormPostState();
}

class _FormPostState extends State<FormPost> {
  final title = TextEditingController();
  final price = TextEditingController();
  final category = TextEditingController();
  final location = TextEditingController();
  final description = TextEditingController();
  HttpPost? _httpPost;
  Post? post;

  InputDecoration decorationInput(String message) {
    return InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: message,
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffEBDCFA)),
            borderRadius: BorderRadius.circular(40)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffEBDCFA)),
            borderRadius: BorderRadius.circular(40)));
  }

  void initState() {
    _httpPost = HttpPost();
    super.initState();
  }

  Future initialize() async {
    post = await _httpPost?.postValuePost(title.text, int.parse(price.text),
        category.text, location.text, description.text, widget.user!.id);
    setState(() {
      post = post;
      if (post?.title != null) {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("The post was created successfully"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        title.text = "";
                        price.text = "";
                        category.text = "";
                        location.text = "";
                        description.text = "";
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
                        price.text = "";
                        category.text = "";
                        location.text = "";
                        description.text = "";
                      },
                      child: const Text("Ok"))
                ],
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text("Create Post"),
        backgroundColor: const Color(0xff007AFF),
      ),
      body: Padding(
          padding: const EdgeInsets.all(30),
          // ignore: avoid_unnecessary_containers
          child: Container(
              child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextField(
                    controller: title, decoration: decorationInput("Title")),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextField(
                    keyboardType: TextInputType.phone,
                    controller: price,
                    decoration: decorationInput("Price")),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextField(
                    controller: category,
                    decoration: decorationInput("Category")),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextField(
                    controller: location,
                    decoration: decorationInput("Location")),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextField(
                    controller: description,
                    decoration: decorationInput("Description")),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                decoration: BoxDecoration(
                    color: const Color(0xff007AFF),
                    borderRadius: BorderRadius.circular(40)),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: MaterialButton(
                  onPressed: () => {initialize()},
                  child: const Text(
                    'Publish',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              )
            ],
          ))),
    );
  }
}
