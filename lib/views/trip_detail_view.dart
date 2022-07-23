import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:travelaza/models/Trip.dart';

class TripDetailView extends StatelessWidget {
  final Trip trip;

  const TripDetailView({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 232, 232),
      appBar: AppBar(
        title: Text('Trip Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 10),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: trip.getLocationImage()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Color.fromARGB(255, 199, 196, 196),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Flexible(
                          child: AutoSizeText(trip.title,
                              maxLines: 3,
                              style: TextStyle(
                                  fontSize: 30.0,
                                  color: Color.fromARGB(255, 121, 11, 48),
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GridView(
              physics: ScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 199, 196, 196),
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                            child: Text(
                              'Days',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 0, 20),
                            child: Text(
                              '4',
                              style: TextStyle(
                                color: Color.fromARGB(255, 121, 11, 48),
                                fontSize: 60,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 199, 196, 196),
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 199, 196, 196),
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 199, 196, 196),
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 199, 196, 196),
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 199, 196, 196),
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.60,
                child: ElevatedButton(
                  child: Text("Manage Schedule"),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),

        // child: Column(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Container(
        //         color: Colors.amber,
        //         height: 300,
        //         alignment: Alignment.center,
        //       ),
        //     ),
        //     Row(
        //       children: [

        //         Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Container(
        //             color: Colors.blue[900],
        //             width: 150,
        //             height: 150,
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Container(
        //             color: Colors.pink,
        //             width: 150,
        //             height: 150,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        // slivers: [
        //   SliverAppBar(
        //     automaticallyImplyLeading: false,
        //     expandedHeight: 300,
        //     flexibleSpace: FlexibleSpaceBar(
        //       background: trip.getLocationImage(),
        //     ),
        //   ),
        // SliverPadding(
        //   padding:
        //       const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        //   sliver: SliverGrid(
        //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        //       maxCrossAxisExtent: 200.0,
        //       mainAxisSpacing: 10.0,
        //       crossAxisSpacing: 10.0,
        //     ),
        //     delegate: SliverChildBuilderDelegate(
        //       (BuildContext context, int index) {
        //         return Container(
        //           alignment: Alignment.center,
        //           color: Colors.teal[100 * (index % 9)],
        //           child: Text('grid item $index'),
        //         );
        //       },
        //       childCount: 6,
        //     ),
        //   ),
        // )
        // ([
        // Text(trip.title),
        // Text(trip.budget.toString()),
        // Text(trip.startDate.toString()),
        // Text(trip.endDate.toString()),
        // ]),
        // ],
      ),
    );
  }
}
