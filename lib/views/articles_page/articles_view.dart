import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:travelaza/views/indev.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // trip.getLocationImage()
              height: 350,
              padding: EdgeInsets.fromLTRB(6, 8, 6, 8),
              child: Card(
                color: Color.fromARGB(255, 246, 235, 244),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: InkWell(
                  child: Container(
                    color: Color.fromARGB(255, 234, 232, 236),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0, 40.0, 0, 10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: AutoSizeText(
                                    'My Dubai Experience',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
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
                            padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 15.0),
                            child: Row(
                              children: [
                                Text(
                                  "John Lewis",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22.0,
                                    color: Color.fromARGB(255, 2, 59, 89),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 5.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: AutoSizeText(
                                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard ...',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 20.0,
                                      color: Color.fromARGB(255, 2, 59, 89),
                                    ),
                                    maxLines: 4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InDev()),
                    );
                  },
                ),
              ),
            ),
            Container(
              // trip.getLocationImage()
              height: 350,
              padding: EdgeInsets.fromLTRB(6, 8, 6, 8),
              child: Card(
                color: Color.fromARGB(255, 246, 235, 244),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: InkWell(
                  child: Container(
                    color: Color.fromARGB(255, 234, 232, 236),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0, 40.0, 0, 10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: AutoSizeText(
                                    'Five Nights at Goa',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
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
                            padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 15.0),
                            child: Row(
                              children: [
                                Text(
                                  "Abhinav Venugopal",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22.0,
                                    color: Color.fromARGB(255, 2, 59, 89),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 5.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: AutoSizeText(
                                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s ...',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 20.0,
                                      color: Color.fromARGB(255, 2, 59, 89),
                                    ),
                                    maxLines: 4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InDev()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
