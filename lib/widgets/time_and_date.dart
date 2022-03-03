import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class TimeAndDate extends StatefulWidget {
  const TimeAndDate({Key? key}) : super(key: key);

  @override
  _TimeAndDateState createState() => _TimeAndDateState();
}

class _TimeAndDateState extends State<TimeAndDate> {
  String operator = "null";

  String _timeString = "";
  String _dateString = "";
  String shiftName = "";

  String _formatDate(DateTime dateTime) {
    return DateFormat('MM/dd/yyyy').format(dateTime);
  }

  String _formatTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  @override
  initState() {
    _dateString = _formatDate(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getDate());
    _timeString = _formatTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  void _getDate() {
    final DateTime now = DateTime.now();
    final String formattedDate = _formatDate(now);
    if (mounted) {
      setState(() {
        _dateString = formattedDate;
      });
    }
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedTime = _formatTime(now);
    String hour = "";
    late String partOfDay;

    for (int i = 0; i < 2; i++) {
      hour += formattedTime[i];
    }
    int _hour = int.parse(hour);

    if (7 <= _hour && _hour < 14) {
      partOfDay = "First";
    } else if (14 <= _hour && _hour < 22) {
      partOfDay = "Second";
    } else {
      partOfDay = "Third";
    }
    if (mounted) {
      setState(() {
        _timeString = formattedTime;
        shiftName = partOfDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Operator: $operator",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 18.0,
          ),
          Column(
            children: [
              Text(_dateString),
              Text(_timeString),
            ],
          ),
          const SizedBox(
            width: 18.0,
          ),
          const Text(
            "Shift: ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(shiftName),
        ],
      ),
    );
  }
}
