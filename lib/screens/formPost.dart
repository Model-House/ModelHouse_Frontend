import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model_house/models/post.dart';
import 'package:model_house/services/post_service.dart';

class FormPost extends StatefulWidget {
  const FormPost({Key? key}) : super(key: key);

  @override
  _FormPostState createState() => _FormPostState();
}

class _FormPostState extends State<FormPost> {
  final title = TextEditingController();
  final price = TextEditingController();
  final category = TextEditingController();
  final location = TextEditingController();
  final description = TextEditingController();
  HttpPost? _httpPost;
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
      appBar: AppBar(
        title: Text("Create Post"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
              child: Column(
            children: [
              TextField(
                controller: title,
                decoration: const InputDecoration(
                    hintText: 'Title', border: OutlineInputBorder()),
              ),
              TextField(
                controller: price,
                decoration: const InputDecoration(
                    hintText: 'Price', border: OutlineInputBorder()),
              ),
              TextField(
                controller: category,
                decoration: const InputDecoration(
                    hintText: 'Category', border: OutlineInputBorder()),
              ),
              TextField(
                controller: location,
                decoration: const InputDecoration(
                    hintText: 'Location', border: OutlineInputBorder()),
              ),
              TextField(
                controller: description,
                decoration: const InputDecoration(
                    hintText: 'Description', border: OutlineInputBorder()),
              ),
              MaterialButton(
                onPressed: () => {
                  post.title = title.text,
                  post.location = category.text,
                  post.location = location.text,
                  post.description = description.text,
                  HttpPost().postValuePost(post),
                  print(post.userId)
                },
                color: Colors.blueGrey,
                child: const Text('Publish'),
              )
            ],
          ))),
    );
  }
}
