import 'package:flutter/material.dart';

import '../models/user.dart';

class Navigation extends StatefulWidget {
  final Function currentIndex;
  //User? user;
  Navigation({required this.currentIndex});

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (int i) {
        setState(() {
          index = i;
          widget.currentIndex(i);
        });
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0XFFE43848),
      unselectedItemColor: Colors.white,
      iconSize: 35.0,
      selectedFontSize: 18.0,
      unselectedFontSize: 14,
      backgroundColor: Color(0XFF30363B),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'message'),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications), label: 'notification'),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'menu'),
      ],
    );
  }
}
