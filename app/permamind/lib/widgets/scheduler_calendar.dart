import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulerCalendar extends StatefulWidget {
  final Map<DateTime, List> schedule;
  DateTime referenceDate;
  SchedulerCalendar({Key key,
    @required this.schedule,
    @required this.referenceDate}) : super(key: key);

  @override
  _SchedulerCalendarState createState() => _SchedulerCalendarState();
}

class _SchedulerCalendarState extends State<SchedulerCalendar> {
  CalendarController _calendarController;
  Map<DateTime, List> _events;



  @override
  void initState() {
    super.initState();
    _events = widget.schedule;
    _calendarController = CalendarController();
  }


  @override
  Widget build(BuildContext context) {


    return TableCalendar(
//      locale: 'fr_FR',
      events: _events,
      initialCalendarFormat: CalendarFormat.week,
      availableCalendarFormats: const {
        CalendarFormat.week: '',
      },
      calendarController: _calendarController,
      onDaySelected: _onDaySelected,
    );
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }



  void _onDaySelected(DateTime selectedDay, List events) {
    DateTime referenceDate = new DateTime(selectedDay.year, selectedDay.month, selectedDay.day);
    BlocProvider.of<SchedulerBloc>(context).add(SelectDayActivities(referenceDate, widget.schedule));
  }
}

