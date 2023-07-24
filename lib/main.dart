import 'services/common.dart';
import 'package:flutter/material.dart';

import 'widgets/common/bottomNavBar/bottom_navbar.dart';
import 'widgets/common/header/app_bar.dart';
import 'widgets/common/sideBar/my_drawer_header.dart';
import 'widgets/common/sideBar/my_drawer_list.dart';

void main() {
  runApp(const HomePage());
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}
class HomePageState extends State<HomePage> {
  var currentPage = "dashboard";

  updatePage(name) {
    currentPage = name;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarHeader(updatePage: updatePage),
        body: getCurrentPage(currentPage, updatePage),
        bottomNavigationBar: BottomNavBar(updatePage: updatePage),
        drawer: Drawer(
          child: Column(
            children: [
              const MyHeaderDrawer(),
              MyDrawerList(currentPage: currentPage, updatePage: updatePage),
            ],
          ),
        ),
      )
    );
  }
}
