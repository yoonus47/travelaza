import 'package:flutter/material.dart';
import 'package:travelaza/views/indev.dart';

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
              child: InkWell(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'images/weather-c.gif',
                    width: double.infinity,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InDev()));
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              color: Color.fromARGB(255, 2, 59, 89),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                child: Container(
                  height: 85,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(17, 19, 17, 15),
                    child: Text(
                      'Convert Currencies',
                      style: TextStyle(
                          fontSize: 33,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFF9DF90)),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InDev()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
