import 'package:flutter/material.dart';
import 'package:travelaza/models/Trip.dart';

class NewTripBudgetView extends StatelessWidget {
  final Trip trip;
  NewTripBudgetView({Key? key, @required required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Plan - Budget'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Enter your Budget'),
              Text("Location ${trip.title}"),
              Text("Start Date ${trip.startDate}"),
              Text("End Date ${trip.endDate}"),
              RaisedButton(
                child: Text('Finish'),
                onPressed: () {
                  //save data to FB

                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
            ],
          ),
        ));
  }
}
