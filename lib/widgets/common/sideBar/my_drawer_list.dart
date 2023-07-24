import 'package:flutter/material.dart';

class MyDrawerList extends StatefulWidget {
  final String currentPage;
  final Function updatePage;
  const MyDrawerList({super.key, required this.currentPage, required this.updatePage});

  @override
  MyDrawerListState createState() => MyDrawerListState();
}

class MyDrawerListState extends State<MyDrawerList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              widget.currentPage == "dashboard" ? true : false),
          // const Divider(),
          // menuItem(2, "Login", Icons.verified_user_outlined,
          //     widget.currentPage == "login" ? true : false),
          menuItem(3, "Work", Icons.play_for_work,
              widget.currentPage == "work" ? true : false),
          const Divider(),
          menuItem(5, "Settings", Icons.settings_outlined,
              widget.currentPage == "settings" ? true : false),
          menuItem(6, "Notifications", Icons.notifications_outlined,
              widget.currentPage == "notifications" ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              widget.updatePage('dashboard');
            // } else if (id == 2) {
            //   widget.updatePage("login");
            } else if (id == 3) {
              widget.updatePage("work");
            } else if (id == 5) {
              widget.updatePage("settings");
            } else if (id == 6) {
              widget.updatePage("notifications");
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}