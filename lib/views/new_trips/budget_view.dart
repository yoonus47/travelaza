import 'package:flutter/material.dart';
import 'package:travelaza/models/Trip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'package:travelaza/widgets/wrapper.dart';
import 'package:travelaza/services/auth_service.dart';

class NewTripBudgetView extends StatelessWidget {
  final db = FirebaseFirestore.instance;

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
              ElevatedButton(
                child: Text('Finish'),
                onPressed: () async {
                  //save data to FB
                  final uid = await AuthService().getCurrentUID();
                  await db
                      .collection("userData")
                      .doc(uid)
                      .collection("trips")
                      .add(trip.toJson());
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
            ],
          ),
        ));
  }
}
