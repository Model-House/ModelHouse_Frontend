import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'hola menu',
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
