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

  InputDecoration decoratioInput = InputDecoration(
      fillColor: Colors.white,
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffEBDCFA)),
          borderRadius: BorderRadius.circular(40)),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffEBDCFA)),
          borderRadius: BorderRadius.circular(40)));

  final post = Post(
      price: 15,
      title: "title",
      category: "category",
      location: "location",
      description: "description",
      userId: 1);

  Future initialize() async {
    _httpPost?.postValuePost(post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text("Create Post"),
        backgroundColor: Color(0xff007AFF),
      ),
      body: Padding(
          padding: const EdgeInsets.all(30),
          // ignore: avoid_unnecessary_containers
          child: Container(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextField(controller: title, decoration: decoratioInput),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextField(controller: price, decoration: decoratioInput),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child:
                    TextField(controller: category, decoration: decoratioInput),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child:
                    TextField(controller: location, decoration: decoratioInput),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextField(
                    controller: description, decoration: decoratioInput),
              ),
              Container(
                margin: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                    color: const Color(0xff007AFF),
                    borderRadius: BorderRadius.circular(40)),
                width: 100,
                child: MaterialButton(
                  onPressed: () => {
                    post.title = title.text,
                    post.location = category.text,
                    post.location = location.text,
                    post.description = description.text,
                    post.userId = widget.user!.id,
                    HttpPost().postValuePost(post),
                  },
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
