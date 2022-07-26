import 'package:flutter/material.dart';

class Event {
  final String title;
  final String description;
  final DateTime from;
  final DateTime to;
  final Color backgroundColor;
  final bool isAllDay;

  Event(
      {required this.title,
      required this.description,
      required this.backgroundColor,
      required this.from,
      required this.to,
      required this.isAllDay});
}
