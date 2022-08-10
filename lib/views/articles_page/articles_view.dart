import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
      body: Container(
        // trip.getLocationImage()
        height: 300,
        padding: EdgeInsets.fromLTRB(6, 8, 6, 8),
        child: Card(
          color: Color.fromARGB(255, 246, 235, 244),
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: InkWell(
            child: Container(
              color: Color.fromARGB(255, 76, 191, 166),
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
                              'My Dubai Experience',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                                color: Color.fromARGB(255, 2, 59, 89),
                              ),
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 8.0),
                      child: Row(
                        children: [
                          Text(
                            "John Lewis",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
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
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
