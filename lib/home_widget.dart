import 'package:flutter/material.dart';
import 'package:travelaza/views/dashbord_view.dart';
import 'package:travelaza/views/discover_view.dart';
import 'package:travelaza/views/articles_view.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Travelaza",
          style: TextStyle(fontSize: 23),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 5, 8),
            child: IconButton(
              icon: Icon(Icons.logout_rounded),
              iconSize: 26,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => CustomDialog(
                    title: "Log out",
                    description: "You will be returned to the login screen.",
                    primaryButtonText: "Log out",
                    secondaryButtonText: "Cancel",
                  ),
                );
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

class CustomDialog extends StatelessWidget {
  final primaryColor = const Color(0xFF1A395A);
  final grayColor = const Color(0xFF939393);

  final String title, description, primaryButtonText, secondaryButtonText;

  CustomDialog({
    @required required this.title,
    @required required this.description,
    @required required this.primaryButtonText,
    required this.secondaryButtonText,
  });

  static const double padding = 20.0;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 246, 235, 244),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(padding),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10.0,
                    offset: const Offset(0.0, 10.0),
                  ),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 24.0),
                AutoSizeText(
                  title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 24.0),
                AutoSizeText(
                  description,
                  maxLines: 4,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: grayColor,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 24.0),
                RaisedButton(
                  color: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: AutoSizeText(
                      primaryButtonText,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                          color: Color.fromARGB(255, 246, 235, 244)),
                    ),
                  ),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    try {
                      await authService.signOut();
                    } catch (e) {
                      print(e);
                    }
                  },
                  // onPressed: () async {
                  //   try {
                  //     await authService.signOut();
                  //   } catch (e) {
                  //     print(e);
                  //   }
                  // },
                ),
                SizedBox(height: 10.0),
                showSecondaryButton(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  showSecondaryButton(BuildContext context) {
    return FlatButton(
      child: AutoSizeText(
        secondaryButtonText,
        maxLines: 1,
        style: TextStyle(
          fontSize: 18,
          color: grayColor,
          fontWeight: FontWeight.w400,
        ),
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
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
