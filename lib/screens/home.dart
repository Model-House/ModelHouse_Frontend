import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model_house/components/navigation.dart';

class Home extends StatelessWidget {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Hola home',
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }
}
