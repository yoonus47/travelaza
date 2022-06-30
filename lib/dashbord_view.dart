import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Trip.dart';

class DashbordView extends StatelessWidget {
  final List<Trip> tripsList = [
    Trip("Hyderabad", DateTime.now(), DateTime.now(), 30000.0, "Train"),
    Trip("Goa", DateTime.now(), DateTime.now(), 20000.0, "Train"),
    Trip("Chikmangluru", DateTime.now(), DateTime.now(), 15000.0, "Car"),
    Trip("Delhi", DateTime.now(), DateTime.now(), 25000.0, "Flight"),
    Trip("Chennai", DateTime.now(), DateTime.now(), 20000.0, "Flight"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
          itemCount: tripsList.length,
          itemBuilder: (BuildContext context, int index) =>
              buildTripCard(context, index)),
    );
  }

  Widget buildTripCard(BuildContext context, int index) {
    final trip = tripsList[index];

    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 60.0, 0, 20.0),
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
                padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
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
                      style: TextStyle(fontSize: 16.0),
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
