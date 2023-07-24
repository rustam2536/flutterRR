import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
 Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(children: [
            Text("Settings"),
            Text("Settings"),
          ],)
        ),
      ),
    );
  }
}