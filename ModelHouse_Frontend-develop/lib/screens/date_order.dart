import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateOrder extends StatefulWidget {
  const DateOrder({Key? key}) : super(key: key);

  @override
  _DateOrderState createState() => _DateOrderState();
}

class _DateOrderState extends State<DateOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Name post"),
      ),
    );
  }
}
