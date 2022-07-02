import 'package:flutter/material.dart';
import 'package:travelaza/models/Trip.dart';
import 'budget_view.dart';

class NewTripDateView extends StatelessWidget {
  final Trip trip;
  NewTripDateView({Key? key, @required required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Plan - Date'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Location ${trip.title}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Choose Starting Date'),
                  Text('Choose End Date'),
                ],
              ),
              RaisedButton(
                child: Text('Continue'),
                onPressed: () {
                  trip.startDate = DateTime.now();
                  trip.startDate = DateTime.now();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewTripBudgetView(trip: trip)),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
