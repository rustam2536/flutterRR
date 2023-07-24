import 'package:flutter/material.dart';

class AppBarHeader extends StatefulWidget implements PreferredSizeWidget {
  final Function updatePage;
  const AppBarHeader({super.key, required this.updatePage});

  @override
  State<StatefulWidget> createState() => AppBarHeaderState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarHeaderState extends State<AppBarHeader> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green[700],
      centerTitle: true,
      titleSpacing: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo.png',
            width: 200,
            height: 50,
          ),
        ],
      ),
      actions: [
        PopupMenuButton<String>(
          icon: const Icon(Icons.person),
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem<String>(
              value: 'login',
              child: Text('Login'),
            ),
            const PopupMenuItem<String>(
              value: 'register',
              child: Text('Register'),
            ),
          ],
          onSelected: (String value) {
            widget.updatePage(value);
          },
          offset: const Offset(0, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.all(10),
        ),
      ]
    );
  }
}