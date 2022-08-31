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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sup Yoonus!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 2, 59, 89),
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'images/weather-c.gif',
                  width: double.infinity,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
