import 'package:flutter/material.dart';

class Work extends StatefulWidget {
  final Function(String) updatePage;
  const Work({super.key, required this.updatePage});

  @override
  State<StatefulWidget> createState() => App();
}

class App extends State<Work> {
  @override
  Widget build(BuildContext context) {
    return 
      Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
      children: [
        const Text('Dashboard'),
        const SizedBox(height: 20.0),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
          child: const Text('Go to Work'),
          onPressed: () {
            Navigator.pushNamed(context, '/abc');
          },
        ),
      ],
      )
      // const SizedBox(height: 40),
      // const Text('Or'),
      // const SizedBox(height: 20),
      // ElevatedButton(
      //   style: ButtonStyle(
      //       backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 216, 79, 240))),
      //   child: const Text('Login'),
      //   onPressed: () {
      //     widget.updatePage("login");
      //     // Navigator.pushNamed(context, '/login');
      //   },
      // ),
    );
  }
}

// if (isSidebarOpen)
          //   Positioned.fill(
          //     child: GestureDetector(
          //       onTap: () {
          //         if (isSidebarOpen) {
          //           toggleSidebar();
          //         }
          //       },
          //       child: Container(
          //         color: Colors.black54,
          //       ),
          //     ),
          //   ),
