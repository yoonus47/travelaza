import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:travelaza/models/Trip.dart';
import 'date_view.dart';
import 'package:travelaza/widgets/divider_with_text.dart';
import 'package:travelaza/models/Place.dart';
import 'package:travelaza/credentials.dart';

class NewTripLocationView extends StatefulWidget {
  final Trip trip;
  NewTripLocationView({Key? key, @required required this.trip})
      : super(key: key);

  @override
  State<NewTripLocationView> createState() => _NewTripLocationViewState();
}

class _NewTripLocationViewState extends State<NewTripLocationView> {
  TextEditingController _searchController = new TextEditingController();
  Timer? _throttle;

  late String _heading;
  List<Place> _placesList = [];
  final List<Place> _suggestedList = [
    // Place("Hyderabad", 3500.00),
    // Place("Wayanad", 2500.00),
    // Place("Mysore", 3000.00),
    // Place("Munnar", 1500.00),
    // Place("Chennai", 2500.00),
  ];

  @override
  void initState() {
    super.initState();
    _heading = "Suggestions";
    _placesList = _suggestedList;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  _onSearchChanged() {
    if (_throttle?.isActive ?? false) _throttle!.cancel();
    _throttle = Timer(const Duration(milliseconds: 350), () {
      getLocationResults(_searchController.text);
    });
  }

  void getLocationResults(String input) async {
    if (input.isEmpty) {
      setState(() {
        _heading = "Suggestions";
      });
      return;
    }

    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String type = '(regions)';
    // TODO Add session token

    String request = '$baseURL?input=$input&key=$PLACES_API_KEY&type=$type';
    Response response = await Dio().get(request);

    final predictions = response.data['predictions'];

    List<Place> _displayResults = [];

    for (var i = 0; i < predictions.length; i++) {
      String name = predictions[i]['description'];
      String placeId = predictions[i]['place_id'];

      // TODO figure out the budget
      double averageBudget = 200.0;
      _displayResults.add(Place(name, averageBudget, placeId));
    }

    setState(() {
      _heading = "Results";
      _placesList = _displayResults;
    });
  }

  Future<String> getLocationPhotoRef(placeId) async {
    String placeImgRequest =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=photo&key=$PLACES_API_KEY';
    Response placeDetails = await Dio().get(placeImgRequest);
    return placeDetails.data["result"]["photos"][0]["photo_reference"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Plan - Location'),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 1.0, right: 10),
                child: new DividerWithText(dividerText: _heading),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _placesList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      buildPlaceCard(context, index),
                ),
              ),
            ],
          ),
        ));
  }

  Widget buildPlaceCard(BuildContext context, int index) {
    return Hero(
      tag: "SelectedTrip-${_placesList[index].name}",
      transitionOnUserGestures: true,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
          ),
          child: Card(
            child: InkWell(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Flexible(
                                child: AutoSizeText(_placesList[index].name,
                                    maxLines: 3,
                                    style: TextStyle(fontSize: 25.0)),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                  "Average Budget ${_placesList[index].averageBudget.toStringAsFixed(2)} INR"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Column(
                  //   children: <Widget>[
                  //     Placeholder(
                  //       fallbackHeight: 80,
                  //       fallbackWidth: 80,
                  //     ),
                  //   ],
                  // )
                ],
              ),
              onTap: () async {
                String photoReference =
                    await getLocationPhotoRef(_placesList[index].placeId);
                widget.trip.title = _placesList[index].name;
                widget.trip.photoReference = photoReference;
                // TODO maybe pass the trip average budget through here too...
                // that would need to be added to the Trip object
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewTripDateView(trip: widget.trip)),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
