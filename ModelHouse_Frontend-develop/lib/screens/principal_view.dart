import 'package:flutter/material.dart';
import 'package:model_house/components/navigation.dart';
import 'package:model_house/components/routes.dart';

import '../models/user.dart';

class PrincipalView extends StatefulWidget {
  final User? user;
  PrincipalView(this.user);

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  int index = 0;
  Navigation? myNavigation;

  @override
  void initState() {
    myNavigation = Navigation(currentIndex: (i) {
      setState(() {
        index = i;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      bottomNavigationBar: myNavigation,
      body: Routes(widget.user, index: index),
    );
  }
}
