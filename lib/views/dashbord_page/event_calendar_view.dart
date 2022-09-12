library event_calendar;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:travelaza/models/Trip.dart';

part 'appointment_editor_view.dart';

class EventCalendar extends StatefulWidget {
  final Trip trip;
  const EventCalendar({Key? key, required this.trip}) : super(key: key);
  @override
  EventCalendarState createState() => EventCalendarState();
}

late DataSource _events;
Meeting? _selectedAppointment;
late DateTime _startDate;
late TimeOfDay _startTime;
late DateTime _endDate;
late TimeOfDay _endTime;
bool _isAllDay = false;
String _subject = '';
String _notes = '';
var _placeExp = 0;

class EventCalendarState extends State<EventCalendar> {
  EventCalendarState();

  CalendarView _calendarView = CalendarView.week;
  late List<String> eventNameCollection;
  late List<Meeting> appointments;

  @override
  void initState() {
    _calendarView = CalendarView.month;
    appointments = getMeetingDetails();
    _events = DataSource(appointments);
    _selectedAppointment = null;
    _subject = '';
    _notes = '';
    _placeExp = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var totalBudget = widget.trip.budget;
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
        body: Column(
          children: [
            Expanded(
              child: getEventCalendar(_calendarView, _events, onCalendarTapped),
            ),
            Container(
              // color: Colors.blue,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 10, 5, 20),
              child: Row(
                children: [
                  Text(
                    'Trip Remaining Budget  ',
                    style: GoogleFonts.lato(fontSize: 20),
                  ),
                  Text(
                    '${totalBudget - _placeExp} INR',
                    style: GoogleFonts.lato(
                        fontSize: 21, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  SfCalendar getEventCalendar(
      CalendarView _calendarView,
      CalendarDataSource _calendarDataSource,
      CalendarTapCallback calendarTapCallback) {
    return SfCalendar(
        view: CalendarView.day,
        dataSource: _calendarDataSource,
        // allowDragAndDrop: true,
        // allowAppointmentResize: true,
        showNavigationArrow: true,
        showDatePickerButton: true,
        onTap: calendarTapCallback,
        cellBorderColor: Colors.transparent,
        minDate: widget.trip.startDate,
        maxDate: widget.trip.endDate
            .add(Duration(hours: 23, minutes: 59, seconds: 59)),
        headerStyle: CalendarHeaderStyle(textStyle: TextStyle(fontSize: 25)),
        headerHeight: 50,
        monthViewSettings: MonthViewSettings(
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        timeSlotViewSettings: TimeSlotViewSettings(
            minimumAppointmentDuration: const Duration(minutes: 60)));
  }

  void onCalendarTapped(CalendarTapDetails calendarTapDetails) {
    if (calendarTapDetails.targetElement != CalendarElement.calendarCell &&
        calendarTapDetails.targetElement != CalendarElement.appointment) {
      return;
    }

    setState(() {
      _selectedAppointment = null;
      _isAllDay = false;
      _subject = '';
      _notes = '';
      _placeExp = 0;
      if (_calendarView == CalendarView.month) {
        _calendarView = CalendarView.day;
      } else {
        if (calendarTapDetails.appointments != null &&
            calendarTapDetails.appointments!.length == 1) {
          final Meeting meetingDetails = calendarTapDetails.appointments![0];
          _startDate = meetingDetails.from;
          _endDate = meetingDetails.to;
          _isAllDay = meetingDetails.isAllDay;
          _subject = meetingDetails.eventName == '(No title)'
              ? ''
              : meetingDetails.eventName;
          _notes = meetingDetails.description;
          _placeExp = int.parse(_notes);
          _selectedAppointment = meetingDetails;
        } else {
          final DateTime date = calendarTapDetails.date!;
          _startDate = date;
          _endDate = date.add(const Duration(hours: 1));
        }
        _startTime =
            TimeOfDay(hour: _startDate.hour, minute: _startDate.minute);
        _endTime = TimeOfDay(hour: _endDate.hour, minute: _endDate.minute);
        Navigator.push<Widget>(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => AppointmentEditor()),
        );
      }
    });
  }

  List<Meeting> getMeetingDetails() {
    final List<Meeting> meetingCollection = <Meeting>[];
    eventNameCollection = <String>[];
    return meetingCollection;
  }
}

class DataSource extends CalendarDataSource {
  DataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  bool isAllDay(int index) => appointments![index].isAllDay;

  @override
  String getSubject(int index) => appointments![index].eventName;

  @override
  String getNotes(int index) => appointments![index].description;

  @override
  Color getColor(int index) => appointments![index].background;

  @override
  DateTime getStartTime(int index) => appointments![index].from;

  @override
  DateTime getEndTime(int index) => appointments![index].to;
}

class Meeting {
  Meeting(
      {required this.from,
      required this.to,
      this.background = const Color(0xFF1A395A),
      this.isAllDay = false,
      this.eventName = '',
      this.description = ''});

  final String eventName;
  final DateTime from;
  final DateTime to;
  final Color background;
  final bool isAllDay;
  final String description;
}
