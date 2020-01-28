import 'package:circular_check_box/circular_check_box.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/screens/screens.dart';
import 'package:permamind/widgets/speed_dial_activity.dart';
import 'package:permamind/widgets/widgets.dart';

class DetailsGardenScreen extends StatelessWidget {

  final String gardenId;
  final String userId;

  DetailsGardenScreen({
    Key key,
    @required this.gardenId,
    @required this.userId,
  })
      : super(key: key ?? ArchSampleKeys.detailsGardenScreen);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(gardenId: gardenId, userId: userId),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            color: Colors.yellow,
            height: 230,
          ),
          BlocBuilder<ActivitiesBloc, ActivitiesState>(
              builder: (context, state) {
                if (state is ActivitiesLoaded) {
                  return SchedulerCalendar(
                    referenceDate: DateTime.now(),
                    schedule: state.schedule,
                  );
                } else {
                  return Expanded(
                      child: Container(
                      )
                  );
                }
              }
          ),
          const SizedBox(height: 8.0),
//          _buildButtons(),
          const SizedBox(height: 8.0),
          BlocBuilder<ActivitiesBloc, ActivitiesState>(
              builder: (context, state) {
                if (state is ActivitiesLoaded) {
                  return Expanded(
                    child: Container(
                        child: _buildEventList(state.referenceDate, state.schedule)
                    ),
                  );
                } else {
                  return Expanded(
                      child: Container(
                      )
                  );
                }
              }
          ),
//          Expanded(child: _buildEventList()),
        ],
      ),
      floatingActionButton: ActivitySpeedDial(
          visible: true
      ),
    );


//    return BlocBuilder<GardensBloc, GardensState>(
//    builder: (context, state) {
//      final currentGarden = (state as GardensLoaded)
//          .gardens.firstWhere((garden) => garden.id == id,
//          orElse: () => null);
//      return Scaffold(
//        appBar: AppBar(
//          title: currentGarden != null ? Text("${currentGarden.name}") : Text(""),
//          actions: <Widget>[
//
//            IconButton(
////            tooltip: localizations.deleteGarden,
//              // TODO ArchSampleKeys
////                key: ArchSampleKeys.deleteGardenButton,
//              icon: Icon(Icons.settings),
//              onPressed: () async {
//
//                final removedGarden = await Navigator.of(context).push(
//                    MaterialPageRoute(
//                        builder: (_) {
//                          return SettingsGardenScreen(id: currentGarden.id);
//                        })
//                );
//
//                if (removedGarden != null) {
//
//                  if (removedGarden != false) {
//                    BlocProvider.of<GardensBloc>(context).add(
//                        DeleteGarden(currentGarden));
//                    BlocProvider.of<ActivitiesBloc>(context).close();
//                    Navigator.pop(context, currentGarden);
//                  }
//                }
//              },
//            ),
//          ],
//        ),
//        body: Column(
//          mainAxisSize: MainAxisSize.max,
//          children: <Widget>[
//            Container(
//              color: Colors.yellow,
//              height: 300,
//            ),
//            BlocBuilder<ActivitiesBloc, ActivitiesState>(
//                condition: (previousState, currentState) =>
//                currentState.runtimeType != previousState.runtimeType,
//                builder: (context, state) {
//                  if (state is ActivitiesLoaded) {
//                     return SchedulerCalendar(
//                       referenceDate: currentGarden.creationDate,
//                        schedule: state.schedule,
//                     );
//                  } else {
//                    // TODO Mettre une splashScreen
//                      return Container();
//                    }
//                }
//            ),
//            const SizedBox(height: 8.0),
////          _buildButtons(),
//            const SizedBox(height: 8.0),
//            BlocBuilder<ActivitiesBloc, ActivitiesState>(
//                builder: (context, state) {
//
//                  if (state is ActivitiesLoaded) {
//                    return Expanded(
//                        child: Container(
//                            child: _buildEventList(state.referenceDate, state.schedule)
//                        ),
//                      );
//                  } else {
//                    return Expanded(
//                        child: Container(
//                        )
//                  );
//                  }
//                }
//            ),
////          Expanded(child: _buildEventList()),
//          ],
//        ),
//        floatingActionButton: ActivitySpeedDial(visible: true),
//      );
//    });
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

}


class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {

  final String gardenId;
  final String userId;

  CustomAppBar({
    @required this.gardenId,
    @required this.userId,
    Key key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>{

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GardensBloc, GardensState>(
        builder: (context, state) {
          final currentGarden = (state as GardensLoaded)
              .gardens.firstWhere((garden) => garden.id == widget.gardenId,
              orElse: () => null);

          return AppBar(
            title: currentGarden != null ? Text("${currentGarden.name}") : Text(""),
            actions: <Widget>[

              IconButton(
//            tooltip: localizations.deleteGarden,
                // TODO ArchSampleKeys
//                key: ArchSampleKeys.deleteGardenButton,
                icon: Icon(Icons.settings),
                onPressed: () async {

                  final removedGarden = await Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) {
                            return SettingsGardenScreen(id: currentGarden.id);
                          })
                  );

                  if (removedGarden != null) {

                    Map returnData = Map();

                    if (removedGarden['action'] == "Delete") {

                      returnData['action'] = "Delete";
                      returnData['garden'] = currentGarden;
                      returnData['activities'] =  removedGarden['activities'];

                      BlocProvider.of<GardensBloc>(context).add(
                          DeleteGarden(currentGarden));

                      BlocProvider.of<ActivitiesBloc>(context).close();

                      Navigator.pop(context, returnData);

                    } else  {

                      returnData['action'] = "Leave";
                      returnData['garden'] = currentGarden;

                      BlocProvider.of<GardensBloc>(context).add(
                          LeaveGarden(currentGarden, widget.userId)
                      );
                      BlocProvider.of<ActivitiesBloc>(context).close();

                      Navigator.pop(context, returnData);
                    }
                  }
                },
              ),
            ],
          );
        }
    );
  }
}


// TODO Bottom Up slide animation
//  Route _createRoute() {
//    return PageRouteBuilder(
//      pageBuilder: (context, animation, secondaryAnimation) => SettingsGardenScreen(id: garden.id),
//      transitionsBuilder: (context, animation, secondaryAnimation, child) {
//        var begin = Offset(0.0, 1.0);
//        var end = Offset.zero;
//        var curve = Curves.ease;
//
//        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//
//        return SlideTransition(
//          position: animation.drive(tween),
//          child: child,
//        );
//      },
//    );
//  }


//class Scheduler extends StatefulWidget {
//  Scheduler({Key key, this.gardenId}) : super(key: key);
//
//  final String gardenId;
//
//  @override
//  _ActivitiesState createState() => _ActivitiesState();
//}
//
//class _ActivitiesState extends State<Scheduler> with TickerProviderStateMixin {
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
