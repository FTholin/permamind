import 'package:arch/arch.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/widgets/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulerCalendar extends StatefulWidget {
  final String parcelId;
  SchedulerCalendar(
      {Key key,
      @required this.parcelId,

      })
      : super(key: key);

  @override
  _SchedulerCalendarState createState() => _SchedulerCalendarState();
}

class _SchedulerCalendarState extends State<SchedulerCalendar> {
  CalendarController _calendarController;
  Map<DateTime, List> _events;

  DateTime referenceDate;


  @override
  void initState() {
    super.initState();
    _events = Map<DateTime, List>();
    _calendarController = CalendarController();
    DateTime referenceDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ActivitiesBloc, ActivitiesState>(
        builder: (context, state) {
      if (state is ActivitiesLoadSuccess) {
        _events = state.schedule;
        return Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              _buildTableCalendar(state.schedule),
              // _buildTableCalendarWithBuilders(),
              const SizedBox(height: 8.0),
//            _buildButtons(),
              const SizedBox(height: 8.0),
              Expanded(child: _buildEventList(state.referenceDate, state.schedule)),
            ],
          ),
        );
      } else {
        return _buildEmptyTableCalendar();
      }
    });
  }

  Widget _buildTableCalendar( Map<DateTime, List> events) {

    return TableCalendar(
      locale: AppLocalizations.of(context).activitiesCalendarHeader,
      calendarController: _calendarController,
      events: _events,
      initialCalendarFormat: CalendarFormat.week,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.deepOrange[400],
        todayColor: Colors.deepOrange[200],
        markersColor: Colors.brown[700],
        outsideDaysVisible: false,
      ),
      availableCalendarFormats: const {
        CalendarFormat.week: '',
      },
      headerStyle: HeaderStyle(
        formatButtonTextStyle: TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );

  }

  Widget _buildEmptyTableCalendar() {

    return TableCalendar(
      locale: AppLocalizations.of(context).activitiesCalendarHeader,
      calendarController: _calendarController,
      initialCalendarFormat: CalendarFormat.week,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.deepOrange[400],
        todayColor: Colors.deepOrange[200],
        markersColor: Colors.brown[700],
        outsideDaysVisible: false,
      ),
      availableCalendarFormats: const {
        CalendarFormat.week: '',
      },
      headerStyle: HeaderStyle(
        formatButtonTextStyle: TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  void _onVisibleDaysChanged(DateTime first, DateTime last, CalendarFormat format) {
    referenceDate = first.add(new Duration(days: 1));
    BlocProvider.of<ActivitiesBloc>(context).add(ActivitiesLoadedSuccess(widget.parcelId, first, last));
  }

  // Method call when the calendar is created
  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    BlocProvider.of<ActivitiesBloc>(context)
        .add(ActivitiesLoadedSuccess(widget.parcelId, first, last));
  }


  Widget _buildEventList(DateTime referenceDate, Map<DateTime, List> schedule) {

    List<Container> items = List<Container>();

    if (schedule[referenceDate] != null) {
      for (var activity in schedule[referenceDate]) {
        items.add(
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0.8),
                borderRadius: BorderRadius.circular(12.0),
              ),
              margin:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: ScheduleListItem(activity: activity),
            )
        );
      }
    }
    return ListView(
        children: items
    );

  }

  void _onDaySelected(DateTime selectedDay, List events) {
    DateTime referenceDate =
        new DateTime(selectedDay.year, selectedDay.month, selectedDay.day, 1);
    BlocProvider.of<ActivitiesBloc>(context)
        .add(DayActivitiesSelected(referenceDate, _events));
  }
}

//class SchedulerCalendar extends StatefulWidget {
//  final Map<DateTime, List> schedule;
//  DateTime referenceDate;
//  final String parcelId;
//
//  SchedulerCalendar({Key key,
//    @required this.parcelId,
//    @required this.schedule,
//    @required this.referenceDate}) : super(key: key);
//
//  @override
//  _SchedulerCalendarState createState() => _SchedulerCalendarState();
//}
//
//class _SchedulerCalendarState extends State<SchedulerCalendar> {
//  CalendarController _calendarController;
//  Map<DateTime, List> _events;
//
//
//
//  @override
//  void initState() {
//    super.initState();
////    _events = widget.schedule;
//    _calendarController = CalendarController();
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//
//
//    _events = widget.schedule;
//
//    return TableCalendar(
////      locale: 'fr_FR',
//      events: _events,
//      initialCalendarFormat: CalendarFormat.week,
//      availableCalendarFormats: const {
//        CalendarFormat.week: '',
//      },
//      calendarController: _calendarController,
//      onDaySelected: _onDaySelected,
//      onVisibleDaysChanged: _onVisibleDaysChanged,
//      onCalendarCreated: _onCalendarCreated,
//    );
//
//  }
//
//  @override
//  void dispose() {
//    _calendarController.dispose();
//    super.dispose();
//  }
//
//
//  void _onVisibleDaysChanged(DateTime first, DateTime last, CalendarFormat format) {
////    BlocProvider.of<ActivitiesBloc>(context).add(Upda);
//    print(first);
//    print(last);
//    print('CALLBACK: _onVisibleDaysChanged');
//  }
//
//
//  // Method call when the calendar is created
//  void _onCalendarCreated(DateTime first, DateTime last, CalendarFormat format) {
//    BlocProvider.of<ActivitiesBloc>(context).add(LoadActivities(widget.parcelId, first, last));
//  }
//
//  void _onDaySelected(DateTime selectedDay, List events) {
//    DateTime referenceDate = new DateTime(selectedDay.year, selectedDay.month, selectedDay.day, 1);
//    BlocProvider.of<ActivitiesBloc>(context).add(DayActivitiesSelected(referenceDate, widget.schedule));
//  }
//}
