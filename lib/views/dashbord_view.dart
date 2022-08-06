import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:travelaza/views/trip_detail_view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'new_trips/location_view.dart';
import 'package:travelaza/models/Trip.dart';
import 'package:travelaza/services/auth_service.dart';

class DashbordView extends StatelessWidget {
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final newTrip = Trip(
        " ",
        DateTime.now(),
        DateTime.now(),
        00.00,
        {
          'transportation': 0.0,
          'food': 0.0,
          'lodging': 0.0,
          'entertainment': 0.0
        },
        " ",
        " ",
        " ");

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 235, 244),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 246, 235, 244),
        elevation: 0.0,
        centerTitle: false,
        title: Text(
          'My Plans',
          style: TextStyle(
            color: Color.fromARGB(255, 2, 59, 89),
            fontSize: 28,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: getUsersTripsStreamSnapshots(context),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: SpinKitCubeGrid(
                  color: Color(0xFF1A395A),
                  size: 50.0,
                ),
              );
            return new ListView.builder(
                controller: controller,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) =>
                    buildTripCard(context, snapshot.data!.docs[index]));
          }),
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
      // trip.getLocationImage()

      padding: EdgeInsets.fromLTRB(6, 8, 6, 8),
      child: Card(
        color: Color.fromARGB(255, 246, 235, 244),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: InkWell(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.dstATop),
                image: AssetImage("images/dubai.webp"),
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 40.0, 0, 35.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            trip['title'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                              color: Color.fromARGB(255, 2, 59, 89),
                            ),
                            maxLines: 3,
                          ),
                        ),
                        PopupMenuButton(
                          color: Color.fromARGB(255, 246, 235, 244),
                          icon: Icon(
                            Icons.more_vert,
                            size: 32,
                            color: Color.fromARGB(255, 2, 59, 89),
                          ),
                          onSelected: (value) => deleteTrip(context, trip.id),
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry>[
                            const PopupMenuItem(
                              value: 1,
                              child: ListTile(
                                leading: Icon(
                                  Icons.cancel_rounded,
                                  color: Color.fromARGB(255, 2, 59, 89),
                                ),
                                title: Text(
                                  'Cancel Trip',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 2, 59, 89),
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 2, 59, 89),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 8.0),
                    child: Row(
                      children: [
                        Text(
                          "INR ${trip['budget'].toStringAsFixed(2)}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
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
                ],
              ),
            ),
          ),
          onTap: () {
            print(trip.id);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TripDetailView(
                          trip: Trip(
                        trip['title'],
                        trip['startDate'].toDate(),
                        trip['endDate'].toDate(),
                        trip['budget'],
                        trip['budgetTypes'],
                        trip['travelType'],
                        trip['photoReference'],
                        trip.id,
                      ))),
            );
          },
        ),
      ),
    );
  }

  Future deleteTrip(context, tripid) async {
    var uid = await AuthService().getCurrentUID();
    final doc = FirebaseFirestore.instance
        .collection('userData')
        .doc(uid)
        .collection("trips")
        .doc(tripid);

    return await doc.delete();
  }
}
