import 'package:flutter/material.dart';
import 'package:model_house/screens/home.dart';
import 'package:model_house/screens/menu.dart';
import 'package:model_house/screens/message.dart';
import 'package:model_house/screens/notification.dart';
import 'package:model_house/screens/search.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import '../services/security_service.dart';

class Routes extends StatefulWidget {
  final int index;
  User? user;
  Routes(this.user, {Key? key, required this.index}) : super(key: key);

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  HttpSecurity? _httpSecurity;
  User? newUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      Home(widget.user),
      Search(widget.user),
      Message(widget.user),
      Notifica(widget.user),
      Menu(widget.user)
    ];
    return myList[widget.index];
  }
}
