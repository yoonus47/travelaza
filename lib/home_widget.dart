import 'package:flutter/material.dart';
import 'package:travelaza/views/dashbord_view.dart';
import 'package:travelaza/views/discover_view.dart';
import 'package:travelaza/views/articles_view.dart';

import 'package:travelaza/services/auth_service.dart';
import 'package:provider/provider.dart';

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
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Travelaza"),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 5, 8),
            child: IconButton(
              icon: Icon(Icons.logout_rounded),
              iconSize: 26,
              onPressed: () async {
                try {
                  await authService.signOut();
                } catch (e) {
                  print(e);
                }
              },
            ),
          )
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 246, 235, 244),
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
// primary blue   Color(0xFF1A395A),
// secondary gold Color(0xFFF9DF90),

// bg_grey    Color.fromARGB(255, 245, 245, 247)
// box_grey   Color.fromARGB(255, 234, 232, 236)
// rosetext Color.fromARGB(255, 185, 51, 105)
