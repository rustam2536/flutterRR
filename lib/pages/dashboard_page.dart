import 'package:flutter/material.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 900,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(right: 7, left: 7, top: 10, bottom: 15),
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search,
                          color: Color.fromRGBO(108, 108, 109, 1)),
                      hintText: "What would you like to buy?",
                      hintStyle: TextStyle(fontSize: 13),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(243, 244, 246, 1),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(219, 220, 223, 1),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),
                      filled: true,
                      fillColor: Color.fromRGBO(243, 244, 246, 1)),
                ),
                SizedBox(
                  height: 250,
                  child: Carousel(
                    boxFit: BoxFit.fill,
                    images: [
                      Image.asset('assets/carousel1.jpg'),
                      Image.asset('assets/carousel2.jpg'),
                      Image.asset('assets/carousel3.jpg'),
                    ],
                    autoplay: true,
                    dotBgColor: Colors.transparent,
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        const TabBar(
                          indicatorColor: Colors.green,
                          labelColor:Colors.green,
                          unselectedLabelColor: Color.fromARGB(255, 49, 49, 49),
                          tabs: [
                            Tab(
                              text: 'Categories',
                            ),
                            Tab(
                              text: 'Brands',
                            ),
                            Tab(
                              text: 'Shops',
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Flexible(
                          child: TabBarView(
                            children: [
                              buildGridViewItem([
                                {'image': 'assets/prod2.jpg', 'name': 'prod2'},
                                {'image': 'assets/prod1.jpg', 'name': 'prod1'},
                                {'image': 'assets/prod5.jpg', 'name': 'prod5'},
                                {'image': 'assets/prod3.jpg', 'name': 'prod3'},
                                {'image': 'assets/prod5.jpg', 'name': 'prod5'},
                                {'image': 'assets/prod2.jpg', 'name': 'prod2'},
                                {'image': 'assets/prod3.jpg', 'name': 'prod3'},
                                {'image': 'assets/prod1.jpg', 'name': 'prod1'},
                                {'image': 'assets/prod2.jpg', 'name': 'prod2'},
                                {'image': 'assets/prod5.jpg', 'name': 'prod5'}
                              ]),
                              buildGridViewItem([
                                {'image': 'assets/prod3.jpg', 'name': 'prod3'}
                              ]),
                              buildGridViewItem([
                                {'image': 'assets/prod5.jpg', 'name': 'prod5'}
                              ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Recent orders", style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ))
                    )
                  ],
                ),
                const Column(
                  children: [
                    Card(
                      child: ListTile(
                        title: Text("value"),
                        subtitle: Text('from app'),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("value1"),
                        subtitle: Text('from app'),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("value2"),
                        subtitle: Text('from app'),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("value3"),
                        subtitle: Text('from app'),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("value4"),
                        subtitle: Text('from app'),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("value5"),
                        subtitle: Text('from app'),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("value6"),
                        subtitle: Text('from app'),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("value7"),
                        subtitle: Text('from app'),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("value8"),
                        subtitle: Text('from app'),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("value9"),
                        subtitle: Text('from app'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildGridViewItem(List imagePath) {
  return GridView.count(
    crossAxisCount: 3,
    childAspectRatio: 1.9,
    children: List.generate(
      imagePath.length,
      (index) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath[index]['image'],
            fit: BoxFit.cover,
            height: 35,
            width: 20,
          ),
          const SizedBox(height: 8),
          Text(
            imagePath[index]['name'],
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
