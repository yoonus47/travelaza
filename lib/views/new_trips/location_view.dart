import 'package:flutter/material.dart';
import 'package:travelaza/models/Trip.dart';

class NewTripLocationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = new TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: Text('Create Plan'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Enter A Location'),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: TextField(
                  controller: _titleController,
                  autofocus: true,
                ),
              ),
              RaisedButton(
                child: Text('Continue'),
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}
