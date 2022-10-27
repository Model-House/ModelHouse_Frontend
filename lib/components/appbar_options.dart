import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar appbarOptions(
    BuildContext context, Color color, String wordToModify, String word) {
  return AppBar(
    backgroundColor: const Color(0xff1C1C1C),
    title: RichText(
      text: TextSpan(children: [
        const TextSpan(
            text: 'By ', style: TextStyle(color: Colors.white, fontSize: 20)),
        TextSpan(
            text: wordToModify, style: TextStyle(color: color, fontSize: 20)),
        TextSpan(
            text: word,
            style: const TextStyle(color: Colors.white, fontSize: 20))
      ]),
    ),
    automaticallyImplyLeading: false,
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.arrow_back_ios),
    ),
  );
}
