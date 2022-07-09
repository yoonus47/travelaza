import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

import 'new_trips/location_view.dart';
import 'package:travelaza/models/Trip.dart';
import 'package:travelaza/services/auth_service.dart';
import 'package:travelaza/views/indev.dart';

class DashbordView extends StatelessWidget {
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final newTrip = Trip(" ", DateTime.now(), DateTime.now(), 100.00, " ");

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 72, 38, 115),
      appBar: ScrollAppBar(
        controller: controller,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 72, 38, 115),
        elevation: 0.0,
        title: Text(
          'Plans',
          style: TextStyle(
              color: Color.fromARGB(255, 246, 235, 244), fontSize: 25),
        ),
      ),
      body: Snap(
        controller: controller.appBar,
        child: StreamBuilder<QuerySnapshot>(
            stream: getUsersTripsStreamSnapshots(context),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text("Loading...");
              return new ListView.builder(
                  controller: controller,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buildTripCard(context, snapshot.data!.docs[index]));
            }),
      ),
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

  Stream<QuerySnapshot> getUsersTripsStreamSnapshots(
      BuildContext context) async* {
    final uid = await AuthService().getCurrentUID();
    yield* FirebaseFirestore.instance
        .collection('userData')
        .doc(uid)
        .collection('trips')
        .snapshots();
  }

  Widget buildTripCard(BuildContext context, DocumentSnapshot trip) {
    return Container(
      padding: EdgeInsets.fromLTRB(6, 6, 6, 6),
      child: Card(
        color: Color.fromARGB(255, 246, 235, 244),
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 25.0),
                  child: Row(
                    children: [
                      Text(
                        trip['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Color.fromARGB(255, 2, 59, 89),
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
                        "${DateFormat('MMMMd').format(trip['startDate'].toDate()).toString()} - ${DateFormat('MMMMd').format(trip['endDate'].toDate()).toString()}",
                        style: TextStyle(
                          color: Color.fromARGB(255, 2, 59, 89),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16.0, 0, 8.0),
                  child: Row(
                    children: [
                      Text(
                        "INR ${trip['budget'].toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Color.fromARGB(255, 2, 59, 89),
                        ),
                      ),
                      Spacer(),
                      Text(
                        trip['travelType'],
                        style: TextStyle(
                          color: Color.fromARGB(255, 2, 59, 89),
                        ),
                      ),
                    ],
                  ),
                )

                //
              ],
            ),
          ),
          onTap: () {
            // widget.trip.title = _placesList[index].name;
            // TODO maybe pass the trip average budget through here too...
            // that would need to be added to the Trip object
            Navigator.push(
              context,
              MaterialPageRoute(
                  // builder: (context) => NewTripDateView(trip: widget.trip)),
                  builder: (context) => InDev()),
            );
          },
        ),
      ),
    );
  }
}
