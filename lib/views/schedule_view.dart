import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:travelaza/models/Trip.dart';

class ScheduleView extends StatefulWidget {
  final Trip trip;

  const ScheduleView({Key? key, required this.trip}) : super(key: key);

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: new Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          children: [
            TableCalendar(
              // events: _events,

              firstDay: widget.trip.startDate,
              lastDay: widget.trip.endDate,
              focusedDay: widget.trip.startDate,

              calendarFormat: CalendarFormat.week,
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarBuilders: CalendarBuilders(
                selectedBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.green),
                    )),
                todayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 2, 59, 89),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Color.fromARGB(255, 246, 235, 244),
                      ),
                    )),
              ),
              // calendarCon
              headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonDecoration: BoxDecoration(
                  color: Color.fromARGB(255, 2, 59, 89),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: TextStyle(color: Colors.white),
                formatButtonShowsNext: false,
              ),
              calendarStyle: CalendarStyle(
                canMarkersOverflow: true,
                // todayDecoration: BoxDecoration(
                //     color: Color.fromARGB(255, 2, 59, 89),
                //     shape: BoxShape.circle),
                // selectedDecoration: BoxDecoration(
                //     color: Theme.of(context).primaryColor,
                //     shape: BoxShape.circle),
                // todayTextStyle: TextStyle(
                //   fontWeight: FontWeight.bold,
                //   fontSize: 18.0,
                //   color: Color.fromARGB(255, 246, 235, 244),
                // )
              ),
            ),
          ],
        ));
  }
}


//  DatePickerController _controller = DatePickerController();

  // DateTime _selectedDay = DateTime.now();

// Scaffold(
//         backgroundColor: Color.fromARGB(255, 245, 245, 247),
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           leading: IconButton(
//             onPressed: () => Navigator.of(context).pop(),
//             icon: new Icon(Icons.arrow_back),
//           ),
//         ),
//         body: Column(
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Container(
//                   padding: EdgeInsets.only(top: 20, bottom: 20),
//                   child: DatePicker(
//                     widget.trip.startDate,
//                     width: 60,
//                     height: 80,
//                     controller: _controller,
//                     initialSelectedDate: widget.trip.startDate,
//                     daysCount: widget.trip.endDate
//                         .difference(widget.trip.startDate)
//                         .inDays,
//                     selectionColor: Color.fromARGB(255, 2, 59, 89),
//                     selectedTextColor: Colors.white,
//                     onDateChange: (date) {
//                       // New date selected
//                       setState(() {
//                         _selectedDay = date;
//                       });
//                     },
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
//                   color: Color.fromARGB(255, 234, 232, 236),
//                   child: Column(
//                     children: [
//                       Text(
//                         widget.trip.title,
//                         style: TextStyle(
//                           color: Color.fromARGB(255, 2, 59, 89),
//                           fontSize: 30,
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(10),
//                       ),
//                       Text(
//                         "You have selected",
//                         style: TextStyle(
//                             fontSize: 25.0,
//                             color: Color.fromARGB(255, 2, 59, 89)),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(10),
//                       ),
//                       Text(DateFormat('MMMMd').format(_selectedDay).toString(),
//                           style: TextStyle(
//                               fontSize: 25.0,
//                               color: Color.fromARGB(255, 2, 59, 89))),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         )
//         );