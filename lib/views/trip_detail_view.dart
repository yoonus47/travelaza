import 'package:flutter/material.dart';
import 'package:travelaza/models/Trip.dart';

class TripDetailView extends StatelessWidget {
  final Trip trip;

  const TripDetailView({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Trip Details'),
            backgroundColor: Colors.pink,
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
              background: trip.getLocationImage(),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 200.00,
            delegate: SliverChildListDelegate([
              Text(trip.title),
              Text(trip.budget.toString()),
              Text(trip.startDate.toString()),
              Text(trip.endDate.toString()),
            ]),
          )
        ],
      ),
    ));
  }
}
