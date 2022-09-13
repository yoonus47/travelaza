import 'package:flutter/material.dart';

class ConvertMoney extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A395A),
      appBar: AppBar(
        title: Text('Back'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: new Icon(Icons.arrow_back),
        ),
      ),
      body: Text(
        'This feauture is under developement',
        style: TextStyle(
          color: Color(0xFFF9DF90),
          fontSize: 30,
        ),
      ),
    );
  }
}
