import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:travelaza/views/discover_page/weather_page/weather_view.dart';
import 'package:travelaza/views/discover_page/translate_page/translate_view.dart';
import 'package:travelaza/views/discover_page/convert_money_page/convert_m_view.dart';

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
                child: Stack(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'images/weather_dark.jpeg',
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(17, 19, 17, 15),
                    child: Row(
                      children: [
                        Icon(Icons.thunderstorm_rounded,
                            size: 60, color: Color(0xFFF9DF90)),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: AutoSizeText(
                            'Check On the Weather',
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFF9DF90)),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WeatherView()));
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Stack(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Align(
                      widthFactor: 1,
                      heightFactor: 0.6,
                      child: Image.asset(
                        'images/language.png',
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(17, 19, 17, 15),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Icon(Icons.language_rounded,
                              size: 60, color: Color(0xFFF9DF90)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: AutoSizeText(
                            'Translate',
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFF9DF90)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TranslateView()));
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Stack(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Align(
                      widthFactor: 1,
                      heightFactor: 0.6,
                      child: Image.asset(
                        'images/cash.jpeg',
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(17, 19, 17, 15),
                    child: Row(
                      children: [
                        Icon(Icons.currency_exchange_rounded,
                            size: 50, color: Color(0xFFF9DF90)),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: AutoSizeText(
                            'Convert your Currency',
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFF9DF90)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
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

// Card(
//               color: Color.fromARGB(255, 2, 59, 89),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: InkWell(
//                 child: Container(
//                   height: 85,
//                   width: double.infinity,
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(17, 19, 17, 15),
//                     child: Row(
//                       children: [
//                         Icon(Icons.currency_exchange_rounded,
//                             size: 40, color: Color(0xFFF9DF90)),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           'Convert Money',
//                           style: TextStyle(
//                               fontSize: 35,
//                               fontWeight: FontWeight.w500,
//                               color: Color(0xFFF9DF90)),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => ConvertMoney()));
//                 },
//               ),
//             )

