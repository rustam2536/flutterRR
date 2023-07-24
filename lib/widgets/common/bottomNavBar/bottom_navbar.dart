import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final Function updatePage;
  const BottomNavBar({super.key, required this.updatePage});

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  handleBottomBarClick(int index) {
    setState(() {
      if (index == 0) {
        widget.updatePage('dashboard');
      } else if (index == 1) {
        widget.updatePage('settings');
      } else if (index == 2) {
        widget.updatePage('notifications');
      }
      _currentIndex = index;
    });
  }

  final items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.work),
      label: 'Work',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (int index) {
        handleBottomBarClick(index);
      },
      items: items,
      selectedItemColor: Colors.green,
    );
  }
}
