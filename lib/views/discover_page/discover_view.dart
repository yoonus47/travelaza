import 'package:flutter/material.dart';
import 'package:travelaza/views/discover_page/weather_page/weather_view.dart';
import 'package:travelaza/views/discover_page/convert_m_view.dart';
import 'package:travelaza/views/discover_page/translate_view.dart';

class DiscoverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 235, 244),
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
                      MaterialPageRoute(builder: (context) => WeatherView()));
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              color: Color.fromARGB(255, 72, 38, 115),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                child: Container(
                  height: 85,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(17, 19, 17, 15),
                    child: Row(
                      children: [
                        Icon(Icons.language_rounded,
                            size: 39, color: Color(0xFFF9DF90)),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Translate',
                          style: TextStyle(
                              fontSize: 33,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFF9DF90)),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TranslateView()));
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
                    child: Row(
                      children: [
                        Icon(Icons.currency_exchange_rounded,
                            size: 39, color: Color(0xFFF9DF90)),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Convert Money',
                          style: TextStyle(
                              fontSize: 33,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFF9DF90)),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ConvertMoney()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
