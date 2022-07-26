import 'package:flutter/material.dart';
import 'package:travelaza/models/event.dart';

class AddEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A395A),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: new Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
