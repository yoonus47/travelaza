import 'package:flutter/material.dart';

class ArticlesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 235, 244),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 246, 235, 244),
        elevation: 0.0,
        centerTitle: false,
        title: Text(
          'Articles',
          style: TextStyle(
              color: Color.fromARGB(255, 2, 59, 89),
              fontSize: 28,
              fontWeight: FontWeight.w600),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Icon(Icons.add),
          backgroundColor: Color(0xFF1A395A),
          onPressed: () {}),
    );
  }
}
