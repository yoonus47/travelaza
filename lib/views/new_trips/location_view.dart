import 'package:flutter/material.dart';

class NewTripLocationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Plan'),
      ),
      body: Container(
        child: Text('Enter A Location'),
      ),
    );
  }
}
