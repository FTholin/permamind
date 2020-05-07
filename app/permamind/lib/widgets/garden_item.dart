import 'package:arch/arch.dart';
import 'package:authentication/authentication.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Permamind/blocs/blocs.dart';
import 'package:Permamind/models/models.dart';
import 'package:Permamind/widgets/parcel_carrousel.dart';

class GardenItem extends StatelessWidget {
  final String name;
  final Garden garden;
  final User user;
  final int index;
  final DataRepository dataRepository;

  GardenItem({
    @required this.name,
    @required this.garden,
    @required this.user,
    @required this.index,
    @required this.dataRepository,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController _gardenNameTextController = TextEditingController();

    return Padding(
      padding: EdgeInsets.only(top: 2 * SizeConfig.heightMultiplier),
      child: Container(
        height: 37 * SizeConfig.heightMultiplier,
        decoration: BoxDecoration(
          color: Color.fromRGBO(253, 255, 242, 1),
          border: Border.all(
            color: Colors.black,
            width: 0.1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(1 * SizeConfig.heightMultiplier),
          child: Column(
            children: <Widget>[
              Container(
                  height: 15 * SizeConfig.heightMultiplier,
//                color: Colors.blue,
                  child: Padding(
                    padding: EdgeInsets.all(0.1 * SizeConfig.heightMultiplier),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("$name",
                                style: TextStyle(
                                    color: const Color(0xFF01534F),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 2.7 * SizeConfig.textMultiplier)),
                            IconButton(
                            icon: Icon(Icons.edit),
                            tooltip: 'edit garden',
                            onPressed: () {
                              showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) =>
                                      CupertinoActionSheet(
                                        actions: <Widget>[
//                                            CupertinoButton(
//                                              color: Colors.green,
//                                              child:
//                                                  Text("Ajouter des personnes"),
//                                              onPressed: null,
//                                            ),
                                          CupertinoButton(
                                            color: Colors.green,
                                            child: Text('${AppLocalizations
                                                .of(context)
                                                .rename}'),
                                            onPressed: () {
                                              return showDialog<void>(
                                                context: context,
                                                barrierDismissible: false,
                                                // user must tap button!
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        '${AppLocalizations.of(context).gardenItemRenameTitle}'),
                                                    content: TextField(
                                                      controller:
                                                      _gardenNameTextController,
                                                      decoration:
                                                      InputDecoration(
                                                          hintText:
                                                          "${AppLocalizations.of(context).gardenAddedNameHint}"),
                                                    ),
                                                    actions: <Widget>[
                                                      FlatButton(
                                                        child: Text(
                                                            '${AppLocalizations
                                                                .of(context)
                                                                .buttonCancel}'),
                                                        onPressed: () {
                                                          Navigator.of(
                                                              context)
                                                              .pop();
                                                        },
                                                      ),
                                                      FlatButton(
                                                        child: Text(
                                                            '${AppLocalizations.of(context).update}'),
                                                        onPressed: () {
                                                          if (_gardenNameTextController
                                                              .text
                                                              .isNotEmpty) {
                                                            BlocProvider.of<
                                                                GardensBloc>(
                                                                context)
                                                                .add(
                                                              GardenUpdated(
                                                                  garden
                                                                      .copyWith(
                                                                      name: _gardenNameTextController
                                                                          .text,
                                                                      id: garden
                                                                          .id,
                                                                      publicVisibility:
                                                                      garden
                                                                          .publicVisibility,
                                                                      admin: garden
                                                                          .admin,
                                                                      members: garden
                                                                          .members,
                                                                      creationDate:
                                                                      garden
                                                                          .creationDate,
                                                                      dayActivitiesCount:
                                                                      garden
                                                                          .dayActivitiesCount)),
                                                            );
                                                            Navigator
                                                                .pushNamedAndRemoveUntil(
                                                              context,
                                                              '/',
                                                                  (
                                                                  Route<dynamic>
                                                                  route) =>
                                                              false,
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                          Container(
                                            height: 1.5 *
                                                SizeConfig.heightMultiplier,
                                          ),
                                          CupertinoButton(
                                            color: Colors.green,
                                            child: Text("${AppLocalizations
                                                .of(context)
                                                .delete}"),
                                            onPressed: () {
                                              return showDialog<void>(
                                                context: context,
                                                barrierDismissible: false,
                                                // user must tap button!
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        '${AppLocalizations
                                                            .of(context)
                                                            .settingsGardenDeleteTitle}'),
                                                    content:
                                                    SingleChildScrollView(
                                                      child: ListBody(
                                                        children: <Widget>[
                                                          Text(
                                                              '${AppLocalizations
                                                                  .of(context)
                                                                  .settingsGardenDeleteMessage}'),
                                                        ],
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      FlatButton(
                                                        child: Text(
                                                            '${AppLocalizations
                                                                .of(context)
                                                                .buttonCancel}'),
                                                        onPressed: () {
                                                          Navigator.of(
                                                              context)
                                                              .pop();
                                                        },
                                                      ),
                                                      FlatButton(
                                                        child: Text(
                                                            '${AppLocalizations
                                                                .of(context)
                                                                .buttonContinue}'),
                                                        onPressed: () async {
                                                          BlocProvider.of<
                                                              GardensBloc>(
                                                              context)
                                                              .add(
                                                              GardenDeleted(
                                                                  garden));

                                                          final int
                                                          newGardenCounter =
                                                              user
                                                                  .gardenCounter -
                                                                  1;

                                                          final int
                                                          gardenParcelCounter =
                                                          await BlocProvider
                                                              .of<
                                                              GardensBloc>(
                                                              context)
                                                              .dataRepository
                                                              .gardenParcelsCounting(
                                                              garden
                                                                  .id);

                                                          BlocProvider.of<
                                                              AuthenticationBloc>(
                                                              context)
                                                              .add(
                                                            UserUpdated(
                                                                user.copyWith(
                                                                    id: user.id,
                                                                    pseudo: user
                                                                        .pseudo,
                                                                    email: user
                                                                        .email,
                                                                    nationality: user
                                                                        .nationality,
                                                                    searchKey: user
                                                                        .searchKey,
                                                                    gardenCounter:
                                                                    newGardenCounter,
                                                                    accountStatus:
                                                                    user
                                                                        .accountStatus)),
                                                          );

                                                          Navigator
                                                              .pushNamedAndRemoveUntil(
                                                            context,
                                                            '/',
                                                                (Route<dynamic>
                                                            route) =>
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
                            })


                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    top: 0.3 * SizeConfig.heightMultiplier,
                                    bottom: 0.3 * SizeConfig.heightMultiplier),
                                child: FutureBuilder<int>(
                                  future: dataRepository
                                      .gardenDayActivitiesCounting(garden.id),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<int> snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data == 0) {
                                        return Text(
                                            "${AppLocalizations.of(context).gardenItemNoneActivity}",
                                            style: TextStyle(
                                                color: const Color(0xFF01534F),
                                                fontSize: 2.2 *
                                                    SizeConfig.textMultiplier));
                                      }  else if (snapshot.data == 1) {
                                        return Text(
                                            "${snapshot.data} ${AppLocalizations.of(context).gardenItemOneActivity}",
                                            style: TextStyle(
                                                color: const Color(0xFF01534F),
                                                fontSize: 2.2 *
                                                    SizeConfig.textMultiplier));
                                      } else {
                                        return Text(
                                            "${snapshot.data} ${AppLocalizations.of(context).gardenItemMultipleActivity}",
                                            style: TextStyle(
                                                color: const Color(0xFF01534F),
                                                fontSize: 2.2 *
                                                    SizeConfig.textMultiplier));
                                      }
                                    } else {
                                      return CircularProgressIndicator();
                                    }
                                  },
                                )
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
              ParcelCarouselWithIndicator(garden, user),
            ],
          ),
        ),
      ),
    );
  }
}
