import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Work1 extends StatefulWidget {
  const Work1({super.key});

  @override
  State<StatefulWidget> createState() => App();
}

class App extends State<Work1> {
  List dummyArr = [
    {"name": "Rustam", "email": "rustam@gmail.com", "address": "LKO"},
    {"name": "Rustam", "email": "rustam@gmail.com", "address": "LKO"},
    {"name": "Prince", "email": "prince@gmail.com", "address": "LKO"},
    {"name": "Prince", "email": "prince@gmail.com", "address": "LKO"}
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 70),
      const Text('Welcome to the work page'),
      SizedBox(
        height: 200,
        // child: SingleChildScrollView(
          // thickness: 10,
          // radius: const Radius.circular(4),
          child: ListView.builder(
            itemCount: dummyArr.length,
            itemBuilder: (BuildContext context, int index) {
              final item = dummyArr[index];
              final value = item['name'];
              return Dismissible(
                key: Key(value),
                direction: DismissDirection.horizontal,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerLeft,
                  child: const Icon(Icons.delete),
                ),
                secondaryBackground: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  child: const Icon(Icons.delete),
                ),
                onDismissed: (direction) {
                  Fluttertoast.showToast(
                    msg: "Successfully deleted",
                    toastLength: Toast.LENGTH_LONG,
                  );
                },
                child: Card(
                  child: ListTile(
                    title: Text(value),
                    subtitle: const Text('from app'),
                  ),
                ),
                confirmDismiss: (direction) async {
                  return true;
                },
              );
            },
          ),
        // ),
      ),
      ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        child: const Text('Back'),
      ),
    ]);
  }
}
