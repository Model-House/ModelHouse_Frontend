import 'package:flutter/material.dart';
import 'package:model_house/screens/home.dart';
import 'package:model_house/screens/principal_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrincipalView(),
      theme: ThemeData(
          primaryColor: Color(0XFF1C1C1C),
          accentColor: Color(0XFF161A1D),
          textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))),
    );
  }
}
