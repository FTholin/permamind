import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class SchedulerCalendar extends StatefulWidget {


  @override
  _SchedulerCalendarState createState() => _SchedulerCalendarState();
}


class _SchedulerCalendarState extends State<SchedulerCalendar> {

  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
//      locale: 'fr_FR',
      initialCalendarFormat: CalendarFormat.week,
      availableCalendarFormats: const {
        CalendarFormat.month: '',
        CalendarFormat.week: '',
      },
      calendarController: _calendarController,
    );
  }
}

