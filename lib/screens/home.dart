import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model_house/models/post.dart';

import '../services/post_service.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  String name = "hols";
  List? posts;
  HttpPost? _httpPost;

  final Icon _icon = const Icon(
    Icons.bathroom,
    color: Color(0XFFF5CB5C),
    size: 45,
  );

  @override
  void initState() {
    _httpPost = HttpPost();
    initialize();
    super.initState();
  }

  Future initialize() async {
    posts = List.empty();
    posts = await _httpPost?.getAllPost();
    setState(() {
      posts = posts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 35, 15, 15),
          child: Container(
              decoration: BoxDecoration(
                  color: const Color(0XFF3e3e43),
                  borderRadius: BorderRadius.circular(8.0)),
              child: TextFormField(
                style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontFamily: 'poppins-regular'),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search on Model House',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 25.0,
                  ),
                  hintStyle: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontFamily: 'poppins-light'),
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: CarouselSlider(
            options: CarouselOptions(
                enableInfiniteScroll: true,
                height: 60,
                viewportFraction: 1,
                autoPlay: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                autoPlayAnimationDuration: const Duration(seconds: 4)),
            items: [
              Container(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MaterialButton(onPressed: () {}, child: _icon),
                        MaterialButton(onPressed: () {}, child: _icon),
                        MaterialButton(onPressed: () {}, child: _icon),
                      ])),
              Container(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MaterialButton(onPressed: () {}, child: _icon),
                        MaterialButton(onPressed: () {}, child: _icon),
                        MaterialButton(onPressed: () {}, child: _icon),
                      ])),
              Container(
                  padding: const EdgeInsets.all(0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MaterialButton(onPressed: () {}, child: _icon),
                        MaterialButton(onPressed: () {}, child: _icon),
                        MaterialButton(onPressed: () {}, child: _icon),
                      ])),
            ],
          ),
        ),
        TopPosts(posts)
      ],
    );
  }
}

Widget TopPosts(List? posts) {
  return Expanded(
    child: ListView.builder(
        itemCount: posts?.length,
        itemBuilder: (context, index) {
          return item_service(posts?[index]);
        }),
  );
}

Widget item_service(Post post) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff161A1D)),
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.all(10),
    child: Row(
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: Image.network(
              'https://definicion.de/wp-content/uploads/2014/03/remodelacion.jpg'),
        ),
        Text(
          post.description,
          style: const TextStyle(color: Colors.white),
        )
      ],
    ),
  );
}
