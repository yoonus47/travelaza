import 'package:flutter/material.dart';
import 'package:travelaza/views/dashbord_view.dart';
import 'package:travelaza/views/discover_view.dart';
import 'package:travelaza/views/articles_view.dart';
import 'views/new_trips/location_view.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    DiscoverView(),
    DashbordView(),
    ArticlesView(),
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
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}


// Colors
// green       Color.fromARGB(255,  76, 191, 166),
// lightpink   Color.fromARGB(255, 246, 235, 244),
// purple      Color.fromARGB(255,  72, 38, 115),
// rose        Color.fromARGB(255, 237, 11, 112),
// darkteal    Color.fromARGB(255, 2, 59, 89),