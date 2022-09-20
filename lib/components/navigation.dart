import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  final Function currentIndex;
  Navigation({Key? key, required this.currentIndex}) : super(key: key);

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
      selectedItemColor: Color(0XFFFF0080),
      unselectedItemColor: Colors.white,
      iconSize: 30.0,
      selectedFontSize: 12.0,
      backgroundColor: Theme.of(context).accentColor,
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
