import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'hola message',
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
