import 'package:flutter/material.dart';
import 'package:model_house/screens/home.dart';
import 'package:model_house/screens/menu.dart';
import 'package:model_house/screens/message.dart';
import 'package:model_house/screens/notification.dart';
import 'package:model_house/screens/search.dart';

import '../models/user.dart';

class Routes extends StatelessWidget {
  final int index;
  final User? user;
  const Routes(this.user, {Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [Home(), Search(), Message(), Notifi(), Menu(user)];
    return myList[index];
  }
}
