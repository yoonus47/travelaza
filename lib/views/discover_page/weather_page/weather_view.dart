import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:travelaza/views/discover_page/weather_page/weather_controller.dart';
import 'package:simple_shadow/simple_shadow.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(WeatherController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var day = DateFormat.d().format(DateTime.now());
    var month = DateFormat.LLLL().format(DateTime.now());
    TextEditingController cityText = TextEditingController();

    handleSearchCity() {
      c.fetchWeather(cityText.text);
      // Close keyboard after enter
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    Widget searchCity() {
      return Container(
        margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
        width: double.infinity,
        child: Row(
          children: [
            Icon(
              Icons.search_outlined,
              color: Color(0xFF1A395A),
              size: 30,
            ),
            SizedBox(width: 5),
            Expanded(
              child: TextField(
                controller: cityText,
                textInputAction: TextInputAction.done,
                onEditingComplete: () {
                  handleSearchCity();
                },
                style: TextStyle(color: Color(0xFF1A395A), fontSize: 24),
                decoration: InputDecoration(
                  hintText: 'Search City',
                  hintStyle: TextStyle(color: Color(0xFF1A395A), fontSize: 24),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget weatherIcon() {
      return Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          height: height * 0.2,
          child: SimpleShadow(
            opacity: 0.20,
            color: Colors.black,
            offset: Offset(3, 10),
            sigma: 30,
            child: c.isLoading.value
                ? Center(
                    child: SizedBox(
                      child: CircularProgressIndicator(
                        color: Color(0xFF1A395A),
                      ),
                    ),
                  )
                : LottieBuilder.network(
                    c.weatherIcon.value,
                    fit: BoxFit.cover,
                    width: width * 0.4,
                  ),
          ),
        ),
      );
    }

    Widget weatherInformation() {
      return Container(
        margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
        padding: EdgeInsets.fromLTRB(0, 17, 0, 17),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: c.isLoading.value
            ? Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    color: Color(0xFF1A395A),
                  ),
                ),
              )
            : Column(
                children: [
                  // Date
                  Container(
                    child: Text(
                      'Today, $day $month',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF1A395A),
                      ),
                    ),
                  ),
                  // Temperature
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: SimpleShadow(
                      opacity: 0.25,
                      color: Colors.black,
                      offset: Offset(3, 7),
                      sigma: 25,
                      child: Text(
                        '${(c.weather.value.temp / 10).toStringAsFixed(0)}\u00B0',
                        style: TextStyle(
                          fontSize: 90,
                          color: Color(0xFF1A395A),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Weather Description
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      '${c.weather.value.description.toUpperCase()}',
                      style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFF1A395A),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Weather Detail
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 27, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_city_rounded,
                              color: Color(0xFF1A395A),
                            ),
                            SizedBox(height: 13),
                            Icon(
                              Icons.place_rounded,
                              color: Color(0xFF1A395A),
                            ),
                            SizedBox(height: 13),
                            Icon(
                              Icons.wind_power_rounded,
                              color: Color(0xFF1A395A),
                            ),
                            SizedBox(height: 13),
                            Icon(
                              Icons.heat_pump_rounded,
                              color: Color(0xFF1A395A),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        // Type
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'City',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF1A395A),
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 13),
                            Text(
                              'Country',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF1A395A),
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 13),
                            Text(
                              'Wind',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF1A395A),
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 13),
                            Text(
                              'Humidity',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF1A395A),
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        // Divider
                        // Number
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${c.weather.value.name}',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF1A395A),
                              ),
                            ),
                            SizedBox(height: 13),
                            Text(
                              '${c.weather.value.country}',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF1A395A),
                              ),
                            ),
                            SizedBox(height: 13),
                            Text(
                              '${c.weather.value.speed} km/h',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF1A395A),
                              ),
                            ),
                            SizedBox(height: 13),
                            Text(
                              '${c.weather.value.humidity} %',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      );
    }

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Back'),
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: new Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          height: height,
          color: Color.fromARGB(255, 246, 235, 244),
          child: ListView(
            children: [
              searchCity(),
              weatherIcon(),
              weatherInformation(),
            ],
          ),
        ),
      ),
    );
  }
}
