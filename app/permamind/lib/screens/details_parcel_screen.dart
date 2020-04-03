import 'package:arch/arch.dart';
import 'package:authentication/authentication.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/models/member_profile.dart';
import 'package:permamind/screens/screens.dart';
import 'package:permamind/widgets/speed_dial_activity.dart';
import 'package:permamind/widgets/widgets.dart';


class DetailsParcelScreen extends StatelessWidget {

  final DataRepository dataRepository;
  final String parcelId;
  final User user;
  final String gardenId;

  DetailsParcelScreen({
    Key key,
    @required this.dataRepository,
    @required this.parcelId,
    @required this.user,
    @required this.gardenId,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {


    TextEditingController _parcelNameTextController = TextEditingController();


//    return BlocBuilder<GardensBloc, GardensState>(
//      builder: (context, state) {
//        if (state is GardensLoaded) {
//
//          final List<Parcel> parcels = state.gardenParcels[gardenId];
//
//          final Parcel currentParcel = parcels.firstWhere((parcel) => parcel.id == parcelId);
//
//          // Si pas de modelisations dans la parcelle
//          if (currentParcel.currentModelingId == '' && currentParcel.currentModelingName == '') {
//            return Scaffold(
//                appBar: AppBar(
//                    title: Text(currentParcel.name),
//                    actions: <Widget>[
//                      FlatButton(
//                        child: Text(
//                            "Modifier",
//                            style: TextStyle(
//                                color: Colors.white,
////                        fontWeight: FontWeight.bold,
//                                fontSize: 1.9 * SizeConfig.textMultiplier
//                            )
//                        ),
//                        onPressed: () {
//                          showCupertinoModalPopup(
//                              context: context,
//                              builder: (context) => CupertinoActionSheet(
//                                actions: <Widget>[
//                                  CupertinoButton(
//                                    color: Colors.green,
//                                    child: Text("Ajouter des personnes"),
//                                    onPressed: null,
//                                  ),
//                                  Container(height: 10,),
//                                  CupertinoButton(
//                                    color: Colors.green,
//                                    child: Text("Renommer"),
//                                    onPressed: (){
//                                      return showDialog<void>(
//                                        context: context,
//                                        barrierDismissible: false, // user must tap button!
//                                        builder: (BuildContext context) {
//                                          return AlertDialog(
//                                            title: Text('Renommer cette parcelle'),
//                                            content: TextField(
//                                              controller: _parcelNameTextController,
//                                              decoration: InputDecoration(hintText: "Nom parcelle"),
//                                            ),
//                                            actions: <Widget>[
//                                              FlatButton(
//                                                child: Text('${AppLocalizations.of(context).buttonCancel}'),
//                                                onPressed: () {
//                                                  Navigator.of(context).pop();
//                                                },
//                                              ),
//                                              FlatButton(
//                                                child: Text('Mettre à jour'),
//                                                onPressed: () {
//
//                                                  if (_parcelNameTextController.text.isNotEmpty) {
//
//                                                    BlocProvider.of<GardensBloc>(context).add(
//                                                      ParcelUpdated(
//                                                          currentParcel.copyWith(
//                                                            name: _parcelNameTextController.text,
//                                                            gardenId: currentParcel.gardenId,
//                                                            length: currentParcel.length,
//                                                            width: currentParcel.width,
//                                                            parcelGround: currentParcel.parcelGround,
//                                                            publicVisibility: currentParcel.publicVisibility,
//                                                            admin: currentParcel.admin,
//                                                            members: currentParcel.members,
//                                                            currentModelingId: currentParcel.currentModelingId,
//                                                            currentModelingName: currentParcel.currentModelingName,
//                                                            creationDate: currentParcel.creationDate,
//                                                            dayActivitiesCount: currentParcel.dayActivitiesCount,
//                                                            modelingsMonitoring: currentParcel.modelingsMonitoring,
//                                                          )
//                                                      ),
//                                                    );
//
//                                                    Navigator.of(context).pop();
//                                                  }
//                                                },
//                                              ),
//                                            ],
//                                          );
//                                        },
//                                      );
//                                    },
//                                  ),
//                                  Container(height: 10,),
//                                  CupertinoButton(
//                                    color: Colors.green,
//                                    child: Text("Supprimer"),
//                                    onPressed: (){
//                                      return showDialog<void>(
//                                        context: context,
//                                        barrierDismissible: false, // user must tap button!
//                                        builder: (BuildContext context) {
//                                          return AlertDialog(
//                                            title: Text('${AppLocalizations.of(context).settingsGardenDeleteTitle}'),
//                                            content: SingleChildScrollView(
//                                              child: ListBody(
//                                                children: <Widget>[
//                                                  Text('${AppLocalizations.of(context).settingsGardenDeleteMessage}'),
//                                                ],
//                                              ),
//                                            ),
//                                            actions: <Widget>[
//                                              FlatButton(
//                                                child: Text('${AppLocalizations.of(context).buttonCancel}'),
//                                                onPressed: () {
//                                                  Navigator.of(context).pop();
//                                                },
//                                              ),
//                                              FlatButton(
//                                                child: Text('${AppLocalizations.of(context).buttonContinue}'),
//                                                onPressed: () {
//                                                  BlocProvider.of<GardensBloc>(context).add(ParcelDeleted(parcelId));
//                                                  Navigator.pushNamedAndRemoveUntil(
//                                                    context,
//                                                    '/',
//                                                        (Route<dynamic> route) => false,
//                                                  );
//
//                                                },
//                                              ),
//                                            ],
//                                          );
//                                        },
//                                      );
//                                    },
//                                  ),
//                                ],
//                              )
//                          );
//                        },
//                      )
//                    ],
//                ),
//                body: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    Padding(padding: EdgeInsets.all(20),child:Text("${AppLocalizations.of(context).detailsParcelAssociationEmpty}")),
//                    RaisedButton(
////                      onPressed: () async {
////                        await Navigator.of(context).push(
////                            MaterialPageRoute(
////                                builder: (_) {
////
//////                                  return MultiBlocProvider(
//////                                    providers: [
//////                                      BlocProvider<ModelingsBloc>(
//////                                        create: (context) =>
//////                                        ModelingsBloc(dataRepository: dataRepository)
//////                                          ..add(FetchModelings()),
//////                                      )
//////                                    ],
//////                                    child: DiscoverModelingsScreen(gardenId: gardenId, parcel: currentParcel),
//////                                  );
////
////                                })
////                        );
////                      },
//                      child: Text("${AppLocalizations.of(context).detailsParcelAddAssociationMessage}"),
//                    )
//                  ],
//                )
//            );
//          } else {
//            return Scaffold(
//              appBar: AppBar(
//                title: Text(currentParcel.name),
//                leading:  IconButton(
//                  icon: new Icon(Icons.arrow_back_ios),
//                  onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false,),
//                ),
//                actions: <Widget>[
//                  FlatButton(
//                    child: Text(
//                        "Modifier",
//                        style: TextStyle(
//                            color: Colors.white,
////                        fontWeight: FontWeight.bold,
//                            fontSize: 1.9 * SizeConfig.textMultiplier
//                        )
//                    ),
//                    onPressed: () {
//                      showCupertinoModalPopup(
//                          context: context,
//                          builder: (context) => CupertinoActionSheet(
//                            actions: <Widget>[
//                              CupertinoButton(
//                                color: Colors.green,
//                                child: Text("Ajouter des personnes"),
//                                onPressed: null,
//                              ),
//                              Container(height: 10,),
//                              CupertinoButton(
//                                color: Colors.green,
//                                child: Text("Renommer"),
//                                onPressed: (){
//                                  return showDialog<void>(
//                                    context: context,
//                                    barrierDismissible: false, // user must tap button!
//                                    builder: (BuildContext context) {
//                                      return AlertDialog(
//                                        title: Text('Renommer cette parcelle'),
//                                        content: TextField(
//                                          controller: _parcelNameTextController,
//                                          decoration: InputDecoration(hintText: "Nom parcelle"),
//                                        ),
//                                        actions: <Widget>[
//                                        FlatButton(
//                                            child: Text('${AppLocalizations.of(context).buttonCancel}'),
//                                            onPressed: () {
//                                              Navigator.of(context).pop();
//                                            },
//                                          ),
//                                          FlatButton(
//                                            child: Text('Mettre à jour'),
//                                            onPressed: () {
//
//                                              if (_parcelNameTextController.text.isNotEmpty) {
//
//                                                BlocProvider.of<GardensBloc>(context).add(
//                                                  ParcelUpdated(
//                                                    currentParcel.copyWith(
//                                                        name: _parcelNameTextController.text,
//                                                        gardenId: currentParcel.gardenId,
//                                                        length: currentParcel.length,
//                                                        width: currentParcel.width,
//                                                        parcelGround: currentParcel.parcelGround,
//                                                        publicVisibility: currentParcel.publicVisibility,
//                                                        admin: currentParcel.admin,
//                                                        members: currentParcel.members,
//                                                        currentModelingId: currentParcel.currentModelingId,
//                                                        currentModelingName: currentParcel.currentModelingName,
//                                                        creationDate: currentParcel.creationDate,
//                                                        dayActivitiesCount: currentParcel.dayActivitiesCount,
//                                                        modelingsMonitoring: currentParcel.modelingsMonitoring,
//                                                    )
//                                                  ),
//                                                );
//
//                                                Navigator.pushNamedAndRemoveUntil(
//                                                  context,
//                                                  '/detailsParcel',
//                                                      (Route<dynamic> route) => false,
//                                                  arguments: DetailsParcelScreenArguments(gardenId, parcelId)
//                                                );
//                                              }
//                                            },
//                                          ),
//                                        ],
//                                      );
//                                    },
//                                  );
//                                },
//                              ),
//                              Container(height: 10,),
//                              CupertinoButton(
//                                color: Colors.green,
//                                child: Text("Supprimer"),
//                                onPressed: (){
//                                  return showDialog<void>(
//                                    context: context,
//                                    barrierDismissible: false, // user must tap button!
//                                    builder: (BuildContext context) {
//                                      return AlertDialog(
//                                        title: Text('${AppLocalizations.of(context).settingsGardenDeleteTitle}'),
//                                        content: SingleChildScrollView(
//                                          child: ListBody(
//                                            children: <Widget>[
//                                              Text('${AppLocalizations.of(context).settingsGardenDeleteMessage}'),
//                                            ],
//                                          ),
//                                        ),
//                                        actions: <Widget>[
//                                          FlatButton(
//                                            child: Text('${AppLocalizations.of(context).buttonCancel}'),
//                                            onPressed: () {
//                                              Navigator.of(context).pop();
//                                            },
//                                          ),
//                                          FlatButton(
//                                            child: Text('${AppLocalizations.of(context).buttonContinue}'),
//                                            onPressed: () {
//                                              BlocProvider.of<GardensBloc>(context).add(ParcelDeleted(parcelId));
//                                              Navigator.pushNamedAndRemoveUntil(
//                                                context,
//                                                '/',
//                                                (Route<dynamic> route) => false,
//                                              );
//                                            },
//                                          ),
//                                        ],
//                                      );
//                                    },
//                                  );
//                                },
//                              ),
//                            ],
//                          )
//                      );
//                    },
//                  )
//                ],
//              ),
//              body: Column(
//                  mainAxisSize: MainAxisSize.max,
//                  children: <Widget>[
//
//                    BlocBuilder<DesignBloc, DesignState>(
//                        builder: (context, state) {
//                          if (state is DesignLoaded) {
//                            if (state.designParcel.designs.isEmpty) {
//                              return Container(
//                                height: 230,
//                                child: Center(
//                                    child: VeggiesDesignChart(80.0, 100.0, [])
//                                ),
//                              );
//                            } else {
//                              return Container(
//                                height: 230,
//                                child: Center(
//                                    child: VeggiesDesignChart(80.0, 100.0, state.designParcel.designs.first.positioning)
//                                ),
//                              );
//                            }
//                          } else {
//                            return Container(
//                              height: 230,
//                              child: LoadingIndicator(),
//                            );
//                          }
//                        }
//                    ),
//
//              SchedulerCalendar(
////                referenceDate: DateTime.now(),
//                parcelId: parcelId,
//              ),
////                    const SizedBox(height: 8.0),
////                    const SizedBox(height: 8.0),
////                    BlocBuilder<ActivitiesBloc, ActivitiesState>(
////                        builder: (context, state) {
////
////                          if (state is ActivitiesLoaded) {
////                            return SchedulerCalendar(
////                              referenceDate: DateTime.now(),
////                              parcelId: parcelId,
////                            );
////                          } else {
////                            return Expanded(
////                                child: Container(
////                                )
////                            );
////                          }
////                        }
////                    ),
////                   :
////                    BlocBuilder<ActivitiesBloc, ActivitiesState>(
////                        builder: (context, state) {
////                          if (state is ActivitiesLoaded) {
////                            return Expanded(
////                              child: Container(
////                                  child: _buildEventList(state.referenceDate, state.schedule)
////                              ),
////                            );
////                          } else {
////                            return Expanded(
////                                child: Container(
////                                  child: Text("$state"),
////                                )
////                            );
////                          }
////                        }
////                    ),
////          Expanded(child: _buildEventList()),
//                  ]),
//              floatingActionButton: ActivitySpeedDial(
//                  gardenId: gardenId,
//                  parcelId: parcelId,
//                  visible: true
//              ),
//            );
//          }
//
////
////          if (currentParcel != null) {
////
////          } else {
////            return Container();
////          }
//
//        } else {
//          return Container();
//        }
//      }
//    );

    return Container();


//    return Scaffold(
//      appBar: ParcelAppBar(parcelId: parcelId, user: user),
//      body: Column(
//        mainAxisSize: MainAxisSize.max,
//        children: <Widget>[

//          BlocBuilder<DesignBloc, DesignState>(
//              builder: (context, state) {
//                if (state is DesignLoaded) {
//                  if (state.designParcel.designs.isEmpty) {
//                    return Container(
//                      height: 230,
//                      child: Center(
//                          child: VeggiesDesignChart(80.0, 100.0, [])
//                      ),
//                    );
//                  } else {
//                    return Container(
//                      height: 230,
//                      child: Center(
//                          child: VeggiesDesignChart(80.0, 100.0, state.designParcel.designs.first.positioning)
//                      ),
//                    );
//                  }
//                } else {
//                  return Container(
//                    height: 230,
//                    child: LoadingIndicator(),
//                  );
//                }
//              }
//          ),


//
//        ],
//      ),
//      floatingActionButton: ActivitySpeedDial(
//          visible: true
//      ),
//    );


//    return BlocBuilder<ParcelsBloc, ParcelsState>(
//    builder: (context, state) {
//      final currentParcel = (state as ParcelsLoaded)
//          .gardens.firstWhere((garden) => garden.id == id,
//          orElse: () => null);
//      return Scaffold(
//        appBar: AppBar(
//          title: currentParcel != null ? Text("${currentParcel.name}") : Text(""),
//          actions: <Widget>[
//
//            IconButton(
////            tooltip: localizations.deleteParcel,
//              // TODO ArchSampleKeys
////                key: ArchSampleKeys.deleteParcelButton,
//              icon: Icon(Icons.settings),
//              onPressed: () async {
//
//                final alteredParcel = await Navigator.of(context).push(
//                    MaterialPageRoute(
//                        builder: (_) {
//                          return SettingsParcelScreen(id: currentParcel.id);
//                        })
//                );
//
//                if (alteredParcel != null) {
//
//                  if (alteredParcel != false) {
//                    BlocProvider.of<ParcelsBloc>(context).add(
//                        ParcelDeleted(currentParcel));
//                    BlocProvider.of<ActivitiesBloc>(context).close();
//                    Navigator.pop(context, currentParcel);
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
//                       referenceDate: currentParcel.creationDate,
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

}


//class ParcelAppBar extends StatefulWidget implements PreferredSizeWidget {
//
//  final String parcelId;
//  final User user;
//
//  ParcelAppBar({
//    @required this.parcelId,
//    @required this.user,
//    Key key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);
//
//  @override
//  final Size preferredSize; // default is 56.0
//
//  @override
//  _ParcelAppBarState createState() => _ParcelAppBarState();
//}

//class _ParcelAppBarState extends State<ParcelAppBar>{
//
//  @override
//  Widget build(BuildContext context) {
//    return BlocBuilder<ParcelsBloc, ParcelsState>(
//        builder: (context, state) {
//          final currentParcel = (state as ParcelsLoaded)
//              .parcels.firstWhere((parcel) => parcel.id == widget.parcelId,
//              orElse: () => null);
//
//          if (currentParcel != null) {
//            return AppBar(
//              title: currentParcel != null ? Text("${currentParcel.name}") : Text(""),
//              actions: <Widget>[
//
//                BlocBuilder<ActivitiesBloc, ActivitiesState>(
//                    builder: (context, state) {
//                      if (state is ActivitiesLoaded) {
//                        return IconButton(
////            tooltip: localizations.deleteParcel,
//                          // TODO ArchSampleKeys
////                key: ArchSampleKeys.deleteParcelButton,
//                          icon: Icon(Icons.settings),
//                          onPressed: () async {
//
//                            List<MemberProfile> initialMember = List<MemberProfile>();
//
//                            for (final member in currentParcel.members) {
//                              if (member.id != widget.user.id) {
//                                initialMember.add(MemberProfile(
//                                    member.id,
//                                    member.pseudo
//                                ));
//                              }
//                            }
//
//                            final alteredParcel = await Navigator.of(context).push(
//                                MaterialPageRoute(
//                                    builder: (_) {
//
//                                      return BlocProvider.value(
//                                        value: BlocProvider.of<ParcelsBloc>(
//                                            context),
//                                        child: SettingsParcelScreen(
//                                            parcelId: currentParcel.id,
//                                            initialMembersData: currentParcel.members,
//                                            initialMember: initialMember,
//                                            user: widget.user
//                                        ),
//                                      );
//                                    })
//                            );
//
//                            if (alteredParcel == false) {
//                              BlocProvider.of<ParcelsBloc>(context).add(
//                                  ParcelDeleted(
//                                    currentParcel,
//                                  ));
//                              Navigator.pop(context);
//                            } else if (alteredParcel == true) {
//
//                              BlocProvider.of<ParcelsBloc>(context).add(
//                                  ParcelLeaved(
//                                      currentParcel,
//                                      widget.user.id
//                                  ));
//                              Navigator.pop(context);
//                            }
//                          },
//                        );
//                      } else {
//                        return Container();
//                      }
//                    })
//
//              ],
//            );
//
//          } else {
//            return Container();
//          }
//        }
//    );
//  }
//
////  Future<void> searchParcelFriend(List<String> gardenMembers, List<String> membersData, initialMember) async {
////    // Fill Chips Input
////    gardenMembers.forEach((memberId)  {
////      var queryRes = await BlocProvider.of<ActivitiesBloc>(context).dataRepository.searchById(memberId);
////      if (memberId != widget.userId) {
////        membersData.add(memberId);
////
////        final data = queryRes.documents[0].data;
////
////        initialMember.add(MemberProfile(
////            data["id"],
////            data["pseudo"],
////            data["email"],
////            'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX4057996.jpg'));
////      }
////    });
////  }
//}


class DetailsParcelScreenArguments {

  final String gardenId;
  final String parcelId;

  DetailsParcelScreenArguments(this.gardenId, this.parcelId);
}

//class DetailsParcelScreenArguments {
//
//  final DataRepository dataRepository;
//
//  final String gardenId;
//  final User user;
//
//  DetailsParcelScreenArguments(this.dataRepository, this.gardenId, this.user);
//}

// TODO Bottom Up slide animation
//  Route _createRoute() {
//    return PageRouteBuilder(
//      pageBuilder: (context, animation, secondaryAnimation) => SettingsParcelScreen(id: garden.id),
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
//  Scheduler({Key key, this.parcelId}) : super(key: key);
//
//  final String parcelId;
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
//    return BlocBuilder<ParcelsBloc, ParcelsState>(
//        builder: (BuildContext context, ParcelsState state) {
//      if (state is ParcelsLoaded) {
//        print("Reconstruction du calendrier");
//        print("----------------------------");
//        // récupérer le garden correspondant
//        var garden =
//            state.gardens.singleWhere((user) => user.id == widget.parcelId);
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