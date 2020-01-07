import 'package:circular_check_box/circular_check_box.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/widgets/widgets.dart';

class DetailsGardenScreen extends StatelessWidget {
  final Garden garden;

  int _currentDay;

  DetailsGardenScreen({Key key, @required this.garden})
      : super(key: key ?? ArchSampleKeys.detailsGardenScreen) {
    final DateTime date = DateTime.now();
    final d1 = DateTime.utc(garden.creationDate.year, garden.creationDate.month, garden.creationDate.day);
    final d2 = DateTime.utc(date.year,date.month,date.day);
    _currentDay = d2.difference(d1).inDays;
  }


  @override
  Widget build(BuildContext context) {
    final gardensBloc = BlocProvider.of<GardensBloc>(context);

    final schedulerBloc = BlocProvider.of<SchedulerBloc>(context);

    final localizations = ArchSampleLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("${garden.name}"),
        actions: <Widget>[
          IconButton(
            tooltip: localizations.deleteGarden,
            // TODO ArchSampleKeys
//                key: ArchSampleKeys.deleteGardenButton,
            icon: Icon(Icons.delete),
            onPressed: () {
              schedulerBloc.close();
              gardensBloc.add(DeleteGarden(garden));
              Navigator.pop(context, garden);
            },
          ),
        ],
      ),
      body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
          BlocBuilder<SchedulerBloc, SchedulerState>(
            condition: (previousState, currentState) =>
            currentState.runtimeType != previousState.runtimeType,
            builder: (context, state) {
              print("reconstruction du calendrier");
              if (state is SchedulerLoaded) {
                return SchedulerCalendar(schedule: state.schedule, referenceDate: garden.creationDate);
              } else if (state is DayActivitiesLoaded ) {
                return SchedulerCalendar(schedule: state.schedule, referenceDate: garden.creationDate);
              } else {return Container();}
            }
          ),
            const SizedBox(height: 8.0),
//          _buildButtons(),
            const SizedBox(height: 8.0),
            BlocBuilder<SchedulerBloc, SchedulerState>(
                builder: (context, state) {
                  if (state is DayActivitiesLoaded) {
                    _currentDay = state.dayIndex;
                    if(state.dayIndex >= 0 && state.dayIndex < state.schedule.length) {
                      return Expanded(
                        child: Container(child: _buildEventList(state.schedule, state.dayIndex)),
                      );
                    } else {
                      return Expanded(
                        child: Container(),
                      );
                    }
                  } else if (state is SchedulerLoaded) {
                    print(_currentDay);
                    if(_currentDay >= 0 && _currentDay < state.schedule.length) {
                      return Expanded(
                        child: Container(child: _buildEventList(state.schedule, _currentDay)),
                      );
                    } else {
                      return Expanded(
                        child: Container(),
                      );
                    }
                  } else {
                    return Expanded(
                      child: Container(),
                    );
                  }
                }
            ),
//          Expanded(child: _buildEventList()),
          ],
        ),
    );
  }

  Widget _buildEventList(List<PlanningDay> schedule, int dayIndex) {
    // Changer ici mettre  un index au lieu d'une activité
    //schedule[dayIndex].dayActivities
    List<Container> items = List<Container>();

    for (int activityIndex = 0; activityIndex < schedule[dayIndex].dayActivities.length; activityIndex++) {
      items.add(
          Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.8),
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin:
        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: ScheduleListItem(garden: garden, schedule: schedule, dayIndex: dayIndex, activityIndex: activityIndex),
      ));
    }

    return ListView(
      children: items
    );

  }

}



//class Scheduler extends StatefulWidget {
//  Scheduler({Key key, this.gardenId}) : super(key: key);
//
//  final String gardenId;
//
//  @override
//  _SchedulerState createState() => _SchedulerState();
//}
//
//class _SchedulerState extends State<Scheduler> with TickerProviderStateMixin {
//  Map<DateTime, List> _events;
//  List _selectedEvents;
//  AnimationController _animationController;
//  CalendarController _calendarController;
//
//  @override
//  void initState() {
//    super.initState();
//
//    _events = new Map<DateTime, List>();
//
//    _selectedEvents = new List();
//
//    _calendarController = CalendarController();
//
//    _animationController = AnimationController(
//      vsync: this,
//      duration: const Duration(milliseconds: 400),
//    );
//
//    _animationController.forward();
//  }
//
//  @override
//  void dispose() {
//    _animationController.dispose();
//    _calendarController.dispose();
//    super.dispose();
//  }
//

//
//  @override
//  Widget build(BuildContext context) {
//    print("Reconstruction du widget");
//    return Scaffold(
//      body: Column(
//        mainAxisSize: MainAxisSize.max,
//        children: <Widget>[
//          // Switch out 2 lines below to play with TableCalendar's settings
//          //-----------------------
//
//          _buildTableCalendar(),
//          // _buildTableCalendarWithBuilders(),
//          const SizedBox(height: 8.0),
////          _buildButtons(),
//          const SizedBox(height: 8.0),
//          Expanded(child: _buildEventList()),
//        ],
//      ),
//    );
//  }



// Simple TableCalendar configuration (using Styles)
//  Widget _buildTableCalendar() {
//
//    return BlocBuilder<GardensBloc, GardensState>(
//        builder: (BuildContext context, GardensState state) {
//      if (state is GardensLoaded) {
//        print("Reconstruction du calendrier");
//        print("----------------------------");
//        // récupérer le garden correspondant
//        var garden =
//            state.gardens.singleWhere((user) => user.id == widget.gardenId);
//
//        // Faire une fonction qui va traduire les activités pour les poser dans event
//        synchroniseSchedule(garden.schedule, garden.creationDate);
//
//
//        return TableCalendar(
//          calendarController: _calendarController,
//          events: _events,
//          holidays: _holidays,
//          initialCalendarFormat: CalendarFormat.week,
//          startingDayOfWeek: StartingDayOfWeek.monday,
//          calendarStyle: CalendarStyle(
//            selectedColor: Colors.deepOrange[400],
//            todayColor: Colors.deepOrange[200],
//            markersColor: Colors.yellow[700],
//            outsideDaysVisible: false,
//          ),
//          headerStyle: HeaderStyle(
//            formatButtonTextStyle:
//                TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
//            formatButtonDecoration: BoxDecoration(
//              color: Colors.deepOrange[400],
//              borderRadius: BorderRadius.circular(16.0),
//            ),
//          ),
//          onDaySelected: _onDaySelected,
//          onVisibleDaysChanged: _onVisibleDaysChanged,
//        );
//      } else {
//        return Container();
//      }
//    });
//  }
//
//  // More advanced TableCalendar configuration (using Builders & Styles)
//  Widget _buildTableCalendarWithBuilders() {
//    return TableCalendar(
//      locale: 'pl_PL',
//      calendarController: _calendarController,
//      events: _events,
//      holidays: _holidays,
//      initialCalendarFormat: CalendarFormat.month,
//      formatAnimation: FormatAnimation.slide,
//      startingDayOfWeek: StartingDayOfWeek.sunday,
//      availableGestures: AvailableGestures.all,
//      availableCalendarFormats: const {
//        CalendarFormat.month: '',
//        CalendarFormat.week: '',
//      },
//      calendarStyle: CalendarStyle(
//        outsideDaysVisible: false,
//        weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
//        holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
//      ),
//      daysOfWeekStyle: DaysOfWeekStyle(
//        weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
//      ),
//      headerStyle: HeaderStyle(
//        centerHeaderTitle: true,
//        formatButtonVisible: false,
//      ),
//      builders: CalendarBuilders(
//        selectedDayBuilder: (context, date, _) {
//          return FadeTransition(
//            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
//            child: Container(
//              margin: const EdgeInsets.all(4.0),
//              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
//              color: Colors.deepOrange[300],
//              width: 100,
//              height: 100,
//              child: Text(
//                '${date.day}',
//                style: TextStyle().copyWith(fontSize: 16.0),
//              ),
//            ),
//          );
//        },
//        todayDayBuilder: (context, date, _) {
//          return Container(
//            margin: const EdgeInsets.all(4.0),
//            padding: const EdgeInsets.only(top: 5.0, left: 6.0),
//            color: Colors.amber[400],
//            width: 100,
//            height: 100,
//            child: Text(
//              '${date.day}',
//              style: TextStyle().copyWith(fontSize: 16.0),
//            ),
//          );
//        },
//        markersBuilder: (context, date, events, holidays) {
//          final children = <Widget>[];
//
//          if (events.isNotEmpty) {
//            children.add(
//              Positioned(
//                right: 1,
//                bottom: 1,
//                child: _buildEventsMarker(date, events),
//              ),
//            );
//          }
//
//          if (holidays.isNotEmpty) {
//            children.add(
//              Positioned(
//                right: -2,
//                top: -2,
//                child: _buildHolidaysMarker(),
//              ),
//            );
//          }
//
//          return children;
//        },
//      ),
//      onDaySelected: (date, events) {
//        _onDaySelected(date, events);
//        _animationController.forward(from: 0.0);
//      },
//      onVisibleDaysChanged: _onVisibleDaysChanged,
//    );
//  }
//
//  Widget _buildEventsMarker(DateTime date, List events) {
//    return AnimatedContainer(
//      duration: const Duration(milliseconds: 300),
//      decoration: BoxDecoration(
//        shape: BoxShape.rectangle,
//        color: _calendarController.isSelected(date)
//            ? Colors.brown[500]
//            : _calendarController.isToday(date)
//                ? Colors.brown[300]
//                : Colors.blue[400],
//      ),
//      width: 16.0,
//      height: 16.0,
//      child: Center(
//        child: Text(
//          '${events.length}',
//          style: TextStyle().copyWith(
//            color: Colors.white,
//            fontSize: 12.0,
//          ),
//        ),
//      ),
//    );
//  }
//
//  Widget _buildHolidaysMarker() {
//    return Icon(
//      Icons.warning,
//      size: 20.0,
//      color: Colors.blueGrey[800],
//    );
//  }
//
//  Widget _buildButtons() {
//    final dateTime = _events.keys.elementAt(_events.length - 2);
//
//    return Column(
//      children: <Widget>[
//        Row(
//          mainAxisSize: MainAxisSize.max,
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: <Widget>[
//            RaisedButton(
//              child: Text('Month'),
//              onPressed: () {
//                setState(() {
//                  _calendarController.setCalendarFormat(CalendarFormat.month);
//                });
//              },
//            ),
//            RaisedButton(
//              child: Text('2 weeks'),
//              onPressed: () {
//                setState(() {
//                  _calendarController
//                      .setCalendarFormat(CalendarFormat.twoWeeks);
//                });
//              },
//            ),
//            RaisedButton(
//              child: Text('Week'),
//              onPressed: () {
//                setState(() {
//                  _calendarController.setCalendarFormat(CalendarFormat.week);
//                });
//              },
//            ),
//          ],
//        ),
//        const SizedBox(height: 8.0),
//        RaisedButton(
//          child: Text(
//              'Set day ${dateTime.day}-${dateTime.month}-${dateTime.year}'),
//          onPressed: () {
//            _calendarController.setSelectedDay(
//              DateTime(dateTime.year, dateTime.month, dateTime.day),
//              runCallback: true,
//            );
//          },
//        ),
//      ],
//    );
//  }
//




//ListTile(
//leading: CircularCheckBox(
//value: true,
//materialTapTargetSize: MaterialTapTargetSize.padded,
//onChanged: null
//),
//title: Text(event.toString()),
//onTap: () => print('$event tapped!'),
//),


//
//  void _onDaySelected(DateTime day, List events) {
//    print('CALLBACK: _onDaySelected');
//    setState(() {
//      _selectedEvents = events;
//    });
//  }
//
//  void _onVisibleDaysChanged(
//      DateTime first, DateTime last, CalendarFormat format) {
//    print('CALLBACK: _onVisibleDaysChanged');
//  }
//}
//
//// Example holidays
//final Map<DateTime, List> _holidays = {
//  DateTime(2019, 1, 1): ['New Year\'s Day'],
//  DateTime(2019, 10, 28): ['Epiphany'],
//  DateTime(2019, 2, 14): ['Valentine\'s Day'],
//  DateTime(2019, 4, 21): ['Easter Sunday'],
//  DateTime(2019, 4, 22): ['Easter Monday'],
//};
