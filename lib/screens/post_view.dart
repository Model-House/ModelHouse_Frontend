import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/post.dart';

class PostView extends StatelessWidget {
  final Post? post;
  const PostView(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Card(
                child: Column(children: [
      const Image(
          image: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-HevEErtoeUbI6MM0GzgBKNYPd4hVTm7Jgg&usqp=CAU")),
      const Spacer(flex: 1),
      Text(post!.title,
          style: const TextStyle(color: Colors.amber, fontSize: 20)),
      const Spacer(flex: 1),
      const Text("Description: "),
      Text(post!.description),
      const Spacer(flex: 1)
    ]))));
  }
}
