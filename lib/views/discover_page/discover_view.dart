import 'package:flutter/material.dart';

class DiscoverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 235, 244),
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: Color.fromARGB(255, 246, 235, 244),
      //   elevation: 0.0,
      //   centerTitle: false,
      //   title: Text(
      //     'Discover',
      //     style: TextStyle(
      //         color: Color.fromARGB(255, 2, 59, 89),
      //         fontSize: 28,
      //         fontWeight: FontWeight.w600),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 18, 0, 0),
              child: Text(
                'Welcome Yoonus!',
                style: TextStyle(
                  color: Color.fromARGB(255, 2, 59, 89),
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
