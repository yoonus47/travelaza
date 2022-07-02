import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/Trip.dart';
import 'new_trips/location_view.dart';

class DashbordView extends StatelessWidget {
  List<Trip> tripsList = [
    Trip("Hyderabad", DateTime.now(), DateTime.now(), 30000.0, "Train"),
    Trip("Goa", DateTime.now(), DateTime.now(), 20000.0, "Train"),
    Trip("Chikmangluru", DateTime.now(), DateTime.now(), 15000.0, "Car"),
    Trip("Delhi", DateTime.now(), DateTime.now(), 25000.0, "Flight"),
    Trip("Chennai", DateTime.now(), DateTime.now(), 20000.0, "Flight"),
  ];
  @override
  Widget build(BuildContext context) {
    final newTrip = Trip(" ", DateTime.now(), DateTime.now(), 00.00, " ");
    return Scaffold(
      body: new ListView.builder(
          itemCount: tripsList.length,
          itemBuilder: (BuildContext context, int index) =>
              buildTripCard(context, index)),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Color.fromARGB(255, 111, 10, 10),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewTripLocationView(
                        trip: newTrip,
                      )),
            );
          }),
    );
  }

  Widget buildTripCard(BuildContext context, int index) {
    final trip = tripsList[index];

    return Container(
      color: Color.fromARGB(255, 103, 177, 234),
      padding: EdgeInsets.fromLTRB(4, 6, 4, 6),
      child: Card(
        color: Color.fromARGB(235, 228, 144, 85),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 25.0),
                child: Row(
                  children: [
                    Text(
                      trip.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    Spacer()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 2.0, 0, 8.0),
                child: Row(
                  children: [
                    Text(
                        "${DateFormat('MMMMd').format(trip.startDate).toString()} - ${DateFormat('MMMMd').format(trip.endDate).toString()}"),
                    Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 8.0),
                child: Row(
                  children: [
                    Text(
                      "INR ${trip.budget.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 22.0),
                    ),
                    Spacer(),
                    Text(trip.travelType),
                  ],
                ),
              )

              //
            ],
          ),
        ),
      ),
    );
  }
}
