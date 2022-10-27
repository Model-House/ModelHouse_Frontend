import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model_house/services/post_service.dart';

import '../models/user.dart';

class YourPost extends StatefulWidget {
  final User? user;
  const YourPost(this.user, {Key? key}) : super(key: key);

  @override
  _YourPostState createState() => _YourPostState();
}

class _YourPostState extends State<YourPost> {
  List? posts;
  HttpPost? _httpPost;
  @override
  void initState() {
    _httpPost = HttpPost();
    initialize();
    super.initState();
  }

  Future initialize() async {
    posts = List.empty();
    posts = await _httpPost?.getPostByUserId(widget.user!.id.toString());
    setState(() {
      posts = posts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text("Your Posts"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: posts?.length,
            itemBuilder: ((context, index) {
              return Card(
                child: ListTile(
                  title: Text(posts?[index].title),
                  subtitle: Text(posts?[index].description),
                ),
              );
            })),
      ),
    );
  }
}
