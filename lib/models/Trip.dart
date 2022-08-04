import 'package:travelaza/credentials.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Trip {
  String title;
  DateTime startDate;
  DateTime endDate;
  double budget;
  Map budgetTypes;
  String travelType;
  String photoReference;
  String tripId;

  Trip(this.title, this.startDate, this.endDate, this.budget, this.budgetTypes,
      this.travelType, this.photoReference, this.tripId);

  // formatting for upload to Firbase when creating the trip
  Map<String, dynamic> toJson() => {
        'title': title,
        'startDate': startDate,
        'endDate': endDate,
        'budget': budget,
        'budgetTypes': budgetTypes,
        'travelType': travelType,
        'photoReference': photoReference,
      };
// creating a Trip object from a firebase snapshot
  Trip.fromSnapshot(DocumentSnapshot snapshot)
      : title = snapshot['title'],
        startDate = snapshot['startDate'].toDate(),
        endDate = snapshot['endDate'].toDate(),
        budget = snapshot['budget'],
        budgetTypes = snapshot['budgetTypes'],
        travelType = snapshot['travelType'],
        photoReference = snapshot['photoReference'],
        tripId = snapshot['tripId'];

  Image getLocationImage() {
    final baseUrl = "https://maps.googleapis.com/maps/api/place/photo";
    final maxWidth = "1000";
    final maxHeight = "500";
    final url =
        "$baseUrl?maxwidth=$maxWidth&maxheight=$maxHeight&photoreference=$photoReference&key=$PLACES_API_KEY";
    return Image.network(url, height: 300, fit: BoxFit.cover);
  }
}
