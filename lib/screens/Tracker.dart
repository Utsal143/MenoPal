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
  TextEditingController _cycleLengthController = TextEditingController();

  List<DateTime> _menstruationDates = []; // List of menstruation dates
  int get _cycleLength => int.tryParse(_cycleLengthController.text) ?? 28;

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
    DateTime nextCycleStartDate = _getNextCycleStartDate();
    DateTime now = DateTime.now();
    int daysLeft = nextCycleStartDate.difference(now).inDays;
    double progress = daysLeft / 28.0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  height: 120,
                  width: 1920,
                  color: Colors.pink,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(50, 50, 0, 0),
                    child: Text(
                      'Tracker & Logger',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: TextField(
                      controller: _cycleLengthController,
                      keyboardType: TextInputType.number,
                      decoration:
                          InputDecoration(labelText: 'Cycle length (days)'),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        color: Color.fromARGB(255, 240, 220, 192),
                      ),
                      Center(
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.3),
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: TweenAnimationBuilder<double>(
                            tween: Tween<double>(begin: 0, end: progress),
                            duration: Duration(milliseconds: 1000),
                            builder: (BuildContext context, double value,
                                Widget? child) {
                              return CircularProgressIndicator(
                                value: value,
                                strokeWidth: 10,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.blue),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 100, 50, 0),
                        child: Center(
                          child: Text("$daysLeft days left",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.pink)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                      if (_selectedDate == null) {
                        return false;
                      }
                      return isSameDay(_selectedDate!, day);
                    },
                    onDaySelected: _onDaySelected,
                  ),
                  SizedBox(height: 10),
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
                        onPressed: () =>
                            _removeMenstruationDate(_selectedDate!),
                        child: Text(
                          "Remove Menstruation Day",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                      "Next cycle starts on: ${nextCycleStartDate.toString().substring(0, 10)}"),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => _scheduleNotification(nextCycleStartDate),
                    child: Text(
                      "Set Reminder",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 2);
    path.cubicTo(size.width / 4, 3 * (size.height / 2), 3 * (size.width / 4),
        size.height / 2, size.width, size.height * 0.9);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
