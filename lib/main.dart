import 'package:flutter/material.dart';
import 'package:model_house/screens/home.dart';
import 'package:model_house/screens/interest.dart';
import 'package:model_house/screens/principal_view.dart';
import 'package:model_house/screens/sessionoptions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SessionOptions(),
      theme: ThemeData(
          primaryColor: Color(0XFF1C1C1C),
          accentColor: Color(0XFF161A1D),
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontFamily: 'poppins-medium',
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          )),
    );
  }
}
