import 'package:flutter/material.dart';
import 'package:model_house/screens/principal_view.dart';
import 'package:model_house/screens/sessionoptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferences? prefs;

  int? id;
  User user = User(id: 0, username: "", email: "", token: "");

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: (user.id != 0) ? PrincipalView(user) : const SessionOptions(),
      theme: ThemeData(
          primaryColor: const Color(0XFF1C1C1C),
          // ignore: deprecated_member_use
          accentColor: const Color(0XFF161A1D),
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontFamily: 'poppins-medium',
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          )),
    );
  }

  Future initialize() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      user.id = prefs!.getInt('id')!;
      user.username = prefs!.getString('username')!;
      user.email = prefs!.getString('email')!;
      print(user.id);
    });
  }
}
