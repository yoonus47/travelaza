import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:travelaza/views/add_event_view.dart';

import 'package:travelaza/models/Trip.dart';

class ScheduleView extends StatefulWidget {
  final Trip trip;

  const ScheduleView({Key? key, required this.trip}) : super(key: key);

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 245, 247),
      appBar: AppBar(
        title: Text('Manage Schedule'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: new Icon(Icons.arrow_back),
        ),
      ),
      body: SfCalendar(
        // allowedViews: [CalendarView.day,CalendarView.week,CalendarView.workWeek],
        // showNavigationArrow: true,
        // showDatePickerButton: true,
        backgroundColor: Color.fromARGB(255, 246, 235, 244),
        headerStyle: CalendarHeaderStyle(textStyle: TextStyle(fontSize: 25)),
        headerHeight: 50,

        minDate: widget.trip.startDate,
        maxDate: widget.trip.endDate
            .add(Duration(hours: 23, minutes: 59, seconds: 59)),
        cellBorderColor: Colors.transparent,
        // allowViewNavigation: true,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddEvent()))),
    );
  }
}



  // DatePickerController _controller = DatePickerController();

  // DateTime _selectedDay = DateTime.now();

  // @override
  // void initState() {
  //   super.initState();
  // }

      // Column(
      //   children: [
      //     Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         Container(
      //           padding: EdgeInsets.only(top: 20, bottom: 20),
      //           child: DatePicker(
      //             widget.trip.startDate,
      //             width: 60,
      //             height: 80,
      //             controller: _controller,
      //             initialSelectedDate: widget.trip.startDate,
      //             daysCount: widget.trip.endDate
      //                 .difference(widget.trip.startDate)
      //                 .inDays,
      //             selectionColor: Color.fromARGB(255, 2, 59, 89),
      //             selectedTextColor: Colors.white,
      //             onDateChange: (date) {
      //               // New date selected
      //               setState(() {
      //                 _selectedDay = date;
      //               });
      //             },
      //           ),
      //         ),
      //         Container(
      //           padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
      //           color: Color.fromARGB(255, 234, 232, 236),
      //           child: Column(
      //             children: [
      //               Text(
      //                 widget.trip.title,
      //                 style: TextStyle(
      //                   color: Color.fromARGB(255, 2, 59, 89),
      //                   fontSize: 30,
      //                 ),
      //               ),
      //               Padding(
      //                 padding: EdgeInsets.all(10),
      //               ),
      //               Text(
      //                 "You have selected",
      //                 style: TextStyle(
      //                     fontSize: 25.0,
      //                     color: Color.fromARGB(255, 2, 59, 89)),
      //               ),
      //               Padding(
      //                 padding: EdgeInsets.all(10),
      //               ),
      //               Text(DateFormat('MMMMd').format(_selectedDay).toString(),
      //                   style: TextStyle(
      //                       fontSize: 25.0,
      //                       color: Color.fromARGB(255, 2, 59, 89))),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // )