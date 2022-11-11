import 'package:flutter/material.dart';
import 'package:model_house/components/available_service.dart';

import '../models/user.dart';
import '../services/post_service.dart';

class Search extends StatefulWidget {
  final User? user;
  Search(this.user);
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final buscar = TextEditingController();
  List? post;
  HttpPost? _httpPost;

  @override
  void initState() {
    _httpPost = HttpPost();
    super.initState();
  }

  Future initialize(String title) async {
    post = await _httpPost?.getByTitle(title);
    setState(() {
      post = post;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 35, 20, 0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Available Services',
                  style: Theme.of(context).textTheme.headline1,
                ),
                searchInput(context)
              ]),
        ),
        AvailableService(widget.user, post)
      ],
    );
  }

  Widget searchInput(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
          decoration: BoxDecoration(
              color: const Color(0XFF3e3e43),
              borderRadius: BorderRadius.circular(8.0)),
          child: TextField(
            onChanged: (value) {
              initialize(value);
            },
            controller: buscar,
            style: const TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontFamily: 'poppins-regular'),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Service, location or keywords',
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
                size: 25.0,
              ),
              hintStyle: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontFamily: 'poppins-light'),
            ),
          )),
    );
  }
}
