import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class PeriodCalendar extends StatefulWidget {
  const PeriodCalendar({Key? key}) : super(key: key);

  @override
  State<PeriodCalendar> createState() => _PeriodCalendarState();
}

class _PeriodCalendarState extends State<PeriodCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;

  List<DateTime> _menstruationDates = []; // List of menstruation dates
  int _cycleLength = 28; // Average menstrual cycle length is 28 days

  @override
  void initState() {
    super.initState();
    _selectedDate = _focusedDay;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDate = selectedDay;
    });
  }

  void _addMenstruationDate(DateTime date) {
    setState(() {
      _menstruationDates.add(date);
    });
  }

  void _removeMenstruationDate(DateTime date) {
    setState(() {
      _menstruationDates.remove(date);
    });
  }

  DateTime _getNextCycleStartDate() {
    if (_menstruationDates.isEmpty) {
      return _focusedDay.add(Duration(days: _cycleLength));
    } else {
      DateTime lastMenstruationDate = _menstruationDates.last;
      return lastMenstruationDate.add(Duration(days: _cycleLength));
    }
  }

  void _scheduleNotification(DateTime notificationDate) {
    // TODO: Implement notification scheduling
  }

  List<DateTime> _getMenstruationDaysInRange(DateTime start, DateTime end) {
    List<DateTime> menstruationDays = [];
    for (DateTime date in _menstruationDates) {
      if (date.isAfter(end)) break;
      if (date.isBefore(start)) continue;
      menstruationDays.add(date);
    }
    return menstruationDays;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.pink, title: Text("Period Calendar")),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime(2020),
            lastDay: DateTime(2030),
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDate, day);
            },
            onDaySelected: _onDaySelected,
            //eventLoader: _getMenstruationDaysInRange,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _addMenstruationDate(_selectedDate!),
                child: Text(
                  "Log Menstruation Day",
                  style: TextStyle(fontSize: 13),
                ),
              ),
              ElevatedButton(
                onPressed: () => _removeMenstruationDate(_selectedDate!),
                child: Text(
                  "Remove Menstruation Day",
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
              "Next cycle starts on: ${_getNextCycleStartDate().toString().substring(0, 10)}"),
          ElevatedButton(
            onPressed: () => _scheduleNotification(_getNextCycleStartDate()),
            child: Text(
              "Set Reminder",
              style: TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
