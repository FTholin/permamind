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
import 'package:uuid/uuid.dart';

class DetailsParcelScreen extends StatelessWidget {
//  final DataRepository dataRepository;
  final String parcelId;

  final User user;
  final String gardenId;

  DetailsParcelScreen({
    Key key,
//    @required this.dataRepository,
    @required this.parcelId,
    @required this.user,
    @required this.gardenId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _parcelNameTextController = TextEditingController();

    final parcelsBloc = BlocProvider.of<ParcelsBloc>(context);
    
    return BlocBuilder<ParcelsBloc, ParcelsState>(
      builder: (context, state) {
        if (state is ParcelsLoadSuccess && state.parcels.isNotEmpty) {
          final currentParcel =
              state.parcels.firstWhere((parcel) => parcel.id == parcelId);
          if (currentParcel != null) {
            if (currentParcel.isActive == true) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(currentParcel.name),
                  leading: IconButton(
                    icon: new Icon(Icons.arrow_back_ios),
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/',
                          (Route<dynamic> route) => false,
                    ),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Modifier",
                          style: TextStyle(
                              color: Colors.white,
//                        fontWeight: FontWeight.bold,
                              fontSize: 1.9 * SizeConfig.textMultiplier)),
                      onPressed: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) => CupertinoActionSheet(
                              actions: <Widget>[
//                                CupertinoButton(
//                                  color: Colors.green,
//                                  child: Text("Ajouter des personnes"),
//                                  onPressed: null,
//                                ),
                                Container(
                                  height: 10,
                                ),
                                CupertinoButton(
                                  color: Colors.green,
                                  child: Text("Renommer"),
                                  onPressed: () async {
                                    await showDialog<void>(
                                      context: context,
                                      barrierDismissible: false,
                                      // user must tap button!
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title:
                                          Text('Renommer cette parcelle'),
                                          content: TextField(
                                            controller:
                                            _parcelNameTextController,
                                            decoration: InputDecoration(
                                                hintText: "Nom parcelle"),
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text(
                                                  '${AppLocalizations.of(context).buttonCancel}'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            FlatButton(
                                              child: Text('Mettre à jour'),
                                              onPressed: () {
                                                if (_parcelNameTextController
                                                    .text.isNotEmpty) {
                                                  parcelsBloc.add(
                                                    ParcelUpdated(
                                                        currentParcel
                                                            .copyWith(
                                                          name:
                                                          _parcelNameTextController
                                                              .text,
                                                          gardenId: currentParcel
                                                              .gardenId,
                                                          length: currentParcel
                                                              .length,
                                                          width:
                                                          currentParcel.width,
                                                          parcelGround:
                                                          currentParcel
                                                              .parcelGround,
                                                          publicVisibility:
                                                          currentParcel
                                                              .publicVisibility,
                                                          admin:
                                                          currentParcel.admin,
                                                          members: currentParcel
                                                              .members,
                                                          currentModelingId:
                                                          currentParcel
                                                              .currentModelingId,
                                                          currentModelingName:
                                                          currentParcel
                                                              .currentModelingName,
                                                          creationDate:
                                                          currentParcel
                                                              .creationDate,
                                                          dayActivitiesCount:
                                                          currentParcel
                                                              .dayActivitiesCount,
                                                          modelingsMonitoring:
                                                          currentParcel
                                                              .modelingsMonitoring,
                                                        )),
                                                  );

                                                  Navigator.pop(
                                                      context, true);
                                                }
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    Navigator.pop(context, true);
                                  },
                                ),
                                Container(
                                  height: 10,
                                ),
                                CupertinoButton(
                                  color: Colors.green,
                                  child: Text("Supprimer"),
                                  onPressed: () {
                                    showDialog<void>(
                                      context: context,
                                      barrierDismissible: false,
                                      // user must tap button!
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                              '${AppLocalizations.of(context).settingsParcelDeleteTitle}'),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Text(
                                                    '${AppLocalizations.of(context).settingsParcelDeleteMessage}'),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text(
                                                  '${AppLocalizations.of(context).buttonCancel}'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            FlatButton(
                                              child: Text(
                                                  '${AppLocalizations.of(context).buttonContinue}'),
                                              onPressed: () {
                                                parcelsBloc.add(
                                                    ParcelDeleted(parcelId));


                                                BlocProvider.of<AuthenticationBloc>(context).add(UserUpdated(
                                                    user.copyWith(
                                                        id: user.id,
                                                        pseudo: user.pseudo,
                                                        email: user.email,
                                                        nationality: user.nationality,
                                                        searchKey: user.searchKey,
                                                        gardenCounter: user.gardenCounter,
                                                        accountStatus: user.accountStatus
                                                    )
                                                ),);

                                                Navigator
                                                    .pushNamedAndRemoveUntil(
                                                  context,
                                                  '/',
                                                      (Route<dynamic> route) =>
                                                  false,
                                                );
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ));
                      },
                    )
                  ],
                ),
                body: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                Image.asset(
                                  "assets/gardens_imagery/${currentParcel.currentModelingId}_2.png",
                                  fit: BoxFit.contain,
                                ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: RaisedButton.icon(
                                          color: Theme.of(context).accentColor,
                                          textColor: Colors.white,
                                          onPressed: () => Navigator.pop(context),
                                          icon: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          ),
                                          label: Text('Close')),
                                    ),
                                  ],
                                );
                              });
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            "assets/gardens_imagery/${currentParcel.currentModelingId}_1.png",
                            fit: BoxFit.contain,
                            height: 28 * SizeConfig.heightMultiplier,
                          ),
                        ),
                      ),
                      SchedulerCalendar(
                        parcelId: parcelId,
                        userId: user.id,
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 40)),

                    ]),
                floatingActionButton: ActivitySpeedDial(
                    gardenId: gardenId, parcelId: parcelId, visible: true),
              );
            } else {
              return Scaffold(
                appBar: AppBar(
                  title: Text(currentParcel.name),
                  leading: IconButton(
                    icon: new Icon(Icons.arrow_back_ios),
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/',
                          (Route<dynamic> route) => false,
                    ),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Modifier",
                          style: TextStyle(
                              color: Colors.white,
//                        fontWeight: FontWeight.bold,
                              fontSize: 1.9 * SizeConfig.textMultiplier)),
                      onPressed: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (context) => CupertinoActionSheet(
                              actions: <Widget>[
//                                CupertinoButton(
//                                  color: Colors.green,
//                                  child: Text("Ajouter des personnes"),
//                                  onPressed: null,
//                                ),
                                Container(
                                  height: 10,
                                ),
                                CupertinoButton(
                                  color: Colors.green,
                                  child: Text("Renommer"),
                                  onPressed: () async {
                                    await showDialog<void>(
                                      context: context,
                                      barrierDismissible: false,
                                      // user must tap button!
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title:
                                          Text('Renommer cette parcelle'),
                                          content: TextField(
                                            controller:
                                            _parcelNameTextController,
                                            decoration: InputDecoration(
                                                hintText: "Nom parcelle"),
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text(
                                                  '${AppLocalizations.of(context).buttonCancel}'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            FlatButton(
                                              child: Text('Mettre à jour'),
                                              onPressed: () {
                                                if (_parcelNameTextController
                                                    .text.isNotEmpty) {
                                                  parcelsBloc.add(
                                                    ParcelUpdated(
                                                        currentParcel
                                                            .copyWith(
                                                          name:
                                                          _parcelNameTextController
                                                              .text,
                                                          gardenId: currentParcel
                                                              .gardenId,
                                                          length: currentParcel
                                                              .length,
                                                          width:
                                                          currentParcel.width,
                                                          parcelGround:
                                                          currentParcel
                                                              .parcelGround,
                                                          publicVisibility:
                                                          currentParcel
                                                              .publicVisibility,
                                                          admin:
                                                          currentParcel.admin,
                                                          members: currentParcel
                                                              .members,
                                                          currentModelingId:
                                                          currentParcel
                                                              .currentModelingId,
                                                          currentModelingName:
                                                          currentParcel
                                                              .currentModelingName,
                                                          creationDate:
                                                          currentParcel
                                                              .creationDate,
                                                          dayActivitiesCount:
                                                          currentParcel
                                                              .dayActivitiesCount,
                                                          modelingsMonitoring:
                                                          currentParcel
                                                              .modelingsMonitoring,
                                                        )),
                                                  );

                                                  Navigator.pop(
                                                      context, true);
                                                }
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    Navigator.pop(context, true);
                                  },
                                ),
                                Container(
                                  height: 10,
                                ),
                                CupertinoButton(
                                  color: Colors.green,
                                  child: Text("Supprimer"),
                                  onPressed: () {
                                    showDialog<void>(
                                      context: context,
                                      barrierDismissible: false,
                                      // user must tap button!
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                              '${AppLocalizations.of(context).settingsParcelDeleteTitle}'),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Text(
                                                    '${AppLocalizations.of(context).settingsParcelDeleteMessage}'),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text(
                                                  '${AppLocalizations.of(context).buttonCancel}'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            FlatButton(
                                              child: Text(
                                                  '${AppLocalizations.of(context).buttonContinue}'),
                                              onPressed: () {
                                                parcelsBloc.add(
                                                    ParcelDeleted(parcelId));


                                                BlocProvider.of<AuthenticationBloc>(context).add(UserUpdated(
                                                    user.copyWith(
                                                        id: user.id,
                                                        pseudo: user.pseudo,
                                                        email: user.email,
                                                        nationality: user.nationality,
                                                        searchKey: user.searchKey,
                                                        gardenCounter: user.gardenCounter,
                                                        accountStatus: user.accountStatus
                                                    )
                                                ),);

                                                Navigator
                                                    .pushNamedAndRemoveUntil(
                                                  context,
                                                  '/',
                                                      (Route<dynamic> route) =>
                                                  false,
                                                );
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ));
                      },
                    )
                  ],
                ),
                body: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            "assets/utils_image/empty_parcel.jpg",
                            fit: BoxFit.contain,
                            height: 28 * SizeConfig.heightMultiplier,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          final List<ModelingSchedule> schedule = await BlocProvider.of<ParcelsBloc>(context).dataRepository.fetchModelingActivities(currentParcel.currentModelingId);

                          BlocProvider.of<ParcelsBloc>(context).add(ModelingAdded(gardenId, currentParcel.id, schedule));
                          BlocProvider.of<ParcelsBloc>(context).add(ParcelUpdated(
                              currentParcel.copyWith(
                                  name: currentParcel.name, gardenId: currentParcel.gardenId, length: currentParcel.length, width: currentParcel.width, parcelGround: currentParcel.parcelGround,
                                  publicVisibility:currentParcel.publicVisibility , admin:currentParcel.admin , members:currentParcel.members, currentModelingId: currentParcel.currentModelingId,
                                  currentModelingName: currentParcel.currentModelingName, creationDate: currentParcel.creationDate, dayActivitiesCount: schedule.isNotEmpty ? schedule[0].dayActivities.length : 0,
                                  modelingsMonitoring: [currentParcel.currentModelingId], id: currentParcel.id, isActive: true
                              )),);

                        },
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            child: Container(
                              color: Color.fromRGBO(214, 211, 94, 1),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text("Lancer la culture",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 2.5 * SizeConfig.textMultiplier))
                                      ],
                                    ),
                                    Text(
                                      "Cliquer ici pour démarrer l'aventure !",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 2 * SizeConfig.textMultiplier,
                                      ),
                                      maxLines: 3,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ),
                      )
                    ]),
//                floatingActionButton: ActivitySpeedDial(
//                    gardenId: gardenId, parcelId: parcelId, visible: true),
              );
            }
          } else {
            return Container();
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    );

  }
}


class DetailsParcelScreenArguments {
  final String gardenId;
  final String parcelId;
  final ParcelsBloc parcelsBloc;

  DetailsParcelScreenArguments(this.parcelsBloc, this.gardenId, this.parcelId);
}

