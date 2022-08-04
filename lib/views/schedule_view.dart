import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

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
        // dataSource: EventDataSource(events),
        backgroundColor: Color.fromARGB(255, 246, 235, 244),
        headerStyle: CalendarHeaderStyle(textStyle: TextStyle(fontSize: 25)),
        headerHeight: 50,

        minDate: widget.trip.startDate,
        maxDate: widget.trip.endDate
            .add(Duration(hours: 23, minutes: 59, seconds: 59)),
        cellBorderColor: Colors.transparent,
        // allowViewNavigation: true,
      ),
      // floatingActionButton: FloatingActionButton(
      //     child: Icon(Icons.add),
      //     onPressed: () => Navigator.of(context)
      //         .push(MaterialPageRoute(builder: (context) => AddEventView()))),
    );
  }
}
