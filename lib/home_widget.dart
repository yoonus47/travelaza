import 'package:flutter/material.dart';
import 'package:travelaza/views/dashbord_view.dart';
import 'pages.dart';
import 'views/new_trips/location_view.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    DiscoverPage(),
    DashbordView(),
    ArticlesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Travelaza"),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.map_rounded,
                  size: 25, color: Color.fromARGB(255, 110, 32, 9)),
              label: 'Discover'),
          BottomNavigationBarItem(
              icon: new Icon(Icons.dashboard_rounded,
                  size: 40, color: Color.fromARGB(255, 110, 32, 9)),
              label: 'Dashbord'),
          BottomNavigationBarItem(
              icon: new Icon(
                Icons.library_books_rounded,
                size: 25,
                color: Color.fromARGB(255, 110, 32, 9),
              ),
              label: 'Articles'),
        ],
      ),
      floatingActionButton: buildNavigateButton(),
    );
  }

  Widget buildNavigateButton() => FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Color.fromARGB(255, 111, 10, 10),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewTripLocationView()),
        );
      });

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
