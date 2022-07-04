import 'package:flutter/material.dart';
import 'package:travelaza/models/Trip.dart';
import 'package:intl/intl.dart';
import 'budget_view.dart';

class NewTripDateView extends StatefulWidget {
  final Trip trip;
  NewTripDateView({Key? key, @required required this.trip}) : super(key: key);

  @override
  State<NewTripDateView> createState() => _NewTripDateViewState();
}

class _NewTripDateViewState extends State<NewTripDateView> {
  // DateTimeRange? _selectedDateRange;

  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 7));

  void _show() async {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2022, 07, 1),
      lastDate: DateTime(2030, 12, 31),
      currentDate: DateTime.now(),
      saveText: 'Done',
    );

    if (result != null) {
      // Rebuild the UI
      print(result.start.toString());
      setState(() {
        _startDate = result.start;
        _endDate = result.end;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Plan - Date'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Location ${widget.trip.title}"),
              RaisedButton(
                child: Text("Select Dates"),
                onPressed: _show,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                      "Start Date: ${DateFormat('dd/MM/yyyy').format(_startDate).toString()}"),
                  Text(
                      "End Date: ${DateFormat('dd/MM/yyyy').format(_endDate).toString()}"),
                ],
              ),
              RaisedButton(
                child: Text('Continue'),
                onPressed: () {
                  widget.trip.startDate = _startDate;
                  widget.trip.endDate = _endDate;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            NewTripBudgetView(trip: widget.trip)),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
