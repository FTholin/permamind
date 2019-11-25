import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulerCalendar extends StatefulWidget {
  final List<PlanningDay> schedule;
  final DateTime referenceDate;
  SchedulerCalendar({Key key, @required this.schedule, @required this.referenceDate}) : super(key: key);

  @override
  _SchedulerCalendarState createState() => _SchedulerCalendarState();
}

class _SchedulerCalendarState extends State<SchedulerCalendar> {
  CalendarController _calendarController;
  Map<DateTime, List> _events;

  @override
  void initState() {
    super.initState();
    _events = Map<DateTime, List>();

    fillEvents(widget.schedule, widget.referenceDate);
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


  void fillEvents(
      List<PlanningDay> schedule, DateTime gardenCreationDate) {
    DateTime referencePoint = gardenCreationDate;
    for (var i = 0; i < schedule.length; i++) {
      _events[referencePoint.add(Duration(days: i))] =
          schedule[i].dayActivities.map((activity) => activity.name).toList();
    }
//    _onDaySelected(_calendarController.selectedDay,_events[_calendarController.selectedDay]);
  }
}
