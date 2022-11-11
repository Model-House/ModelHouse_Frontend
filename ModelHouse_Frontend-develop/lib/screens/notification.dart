import 'package:flutter/material.dart';

class Notifi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'hola Notification',
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
