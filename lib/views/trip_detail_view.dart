import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:travelaza/models/Trip.dart';
import 'package:travelaza/views/schedule_view.dart';

class TripDetailView extends StatelessWidget {
  final Trip trip;

  const TripDetailView({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tripDays = trip.endDate.difference(trip.startDate).inDays;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 245, 247),
      appBar: AppBar(
        title: Text('Trip Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 10),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: trip.getLocationImage()),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 10, 15),
              child: Card(
                color: Color.fromARGB(255, 234, 232, 236),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: Flexible(
                          child: AutoSizeText(trip.title,
                              maxLines: 3,
                              style: TextStyle(
                                  fontSize: 35.0,
                                  color: Color.fromARGB(255, 2, 59, 89),
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
                  padding: EdgeInsetsDirectional.fromSTEB(15, 10, 7, 10),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 234, 232, 236),
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
                                EdgeInsetsDirectional.fromSTEB(30, 15, 0, 0),
                            child: Text(
                              tripDays.toString(),
                              style: TextStyle(
                                color: Color.fromARGB(255, 185, 51, 105),
                                fontSize: 90,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                            child: Text(
                              'Days',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(7, 10, 15, 10),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 234, 232, 236),
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
                                EdgeInsetsDirectional.fromSTEB(10, 8, 0, 0),
                            child: Text(
                              'Budget',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 8.5, 0, 0),
                            child: AutoSizeText(
                              "INR ${(tripDays * trip.budget).toString()}",
                              maxLines: 3,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 185, 51, 105),
                                  fontSize: 32,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 10, 7, 10),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 234, 232, 236),
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
                                EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                            child: Text(
                              'Mode Of Travel',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Image.asset("assets/icons/bike.png",
                                    width: 90, height: 90, fit: BoxFit.fill),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(7, 10, 15, 10),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 234, 232, 236),
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
                                EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                            child: Text(
                              'Dates',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 0, 0),
                            child: Text(
                              "${DateFormat('dd/MM').format(trip.startDate).toString()} - ${DateFormat('dd/MM').format(trip.endDate).toString()}",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 185, 51, 105),
                                  fontSize: 34,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 10, 7, 10),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 234, 232, 236),
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
                                EdgeInsetsDirectional.fromSTEB(15, 30, 0, 0),
                            child: Text(
                              'Family',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 185, 51, 105),
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 30, 0, 0),
                            child: Text(
                              'Trip',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(7, 10, 15, 10),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 234, 232, 236),
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
                                EdgeInsetsDirectional.fromSTEB(30, 9, 0, 0),
                            child: Text(
                              '4',
                              style: TextStyle(
                                color: Color.fromARGB(255, 185, 51, 105),
                                fontSize: 90,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(25, 5, 0, 0),
                            child: Text(
                              'People',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.60,
                height: 50,
                child: RaisedButton(
                  color: Colors.pink[600],
                  textColor: Colors.white,
                  child: Text(
                    "Manage Schedule",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScheduleView(
                          trip: trip,
                        ),
                      ),
                    );
                  },
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
