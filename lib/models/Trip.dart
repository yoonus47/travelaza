import 'package:travelaza/credentials.dart';
import 'package:flutter/material.dart';

class Trip {
  String title;
  DateTime startDate;
  DateTime endDate;
  double budget;
  Map budgetTypes;
  String travelType;
  String photoReference;

  Trip(this.title, this.startDate, this.endDate, this.budget, this.budgetTypes,
      this.travelType, this.photoReference);

  Map<String, dynamic> toJson() => {
        'title': title,
        'startDate': startDate,
        'endDate': endDate,
        'budget': budget,
        'budgetTypes': budgetTypes,
        'travelType': travelType,
        'photoReference': photoReference,
      };

  Image getLocationImage() {
    final baseUrl = "https://maps.googleapis.com/maps/api/place/photo";
    final maxWidth = "1000";
    final maxHeight = "500";
    final url =
        "$baseUrl?maxwidth=$maxWidth&maxheight=$maxHeight&photoreference=$photoReference&key=$PLACES_API_KEY";
    return Image.network(url, height: 300, fit: BoxFit.cover);
  }
}
