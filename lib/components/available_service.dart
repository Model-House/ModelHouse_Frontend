import 'package:flutter/material.dart';

import '../models/post.dart';

class AvailableService extends StatelessWidget {
  List? posts;
  AvailableService(this.posts);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: posts != null ? posts?.length : 0,
        itemBuilder: (context, index) {
          return item_service(posts?[index]);
        },
      ),
    );
  }

  Widget item_service(Post? post) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff161A1D)),
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
            child: Icon(
              Icons.kitchen,
              size: 35.0,
              color: Color(0xffE43848),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post?.title == null ? '' : post!.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'poppins-medium',
                      fontSize: 17),
                ),
                Text(
                  post?.description == null ? '' : post!.description,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'poppins-ligth',
                      fontSize: 15),
                ),
                Text(
                  post?.category == null ? '' : post!.category,
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'poppins-regular',
                      fontSize: 10.0),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
            child:
                // ignore: prefer_const_literals_to_create_immutables
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              const Icon(
                Icons.bookmark,
                color: Colors.white,
              ),
              const Icon(
                Icons.chevron_right,
                color: Colors.white,
              )
            ]),
          )
        ],
      ),
    );
  }
}
