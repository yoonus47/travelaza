import 'package:flutter/material.dart';
import 'package:travelaza/dashbord_view.dart';
import 'pages.dart';

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
              icon: new Icon(Icons.map_rounded), label: 'Discover'),
          BottomNavigationBarItem(
              icon: new Icon(Icons.dashboard_rounded), label: 'Dashbord'),
          BottomNavigationBarItem(
              icon: new Icon(Icons.library_books_rounded), label: 'Articles'),
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
