import 'package:arch/arch.dart';
import 'package:authentication/authentication.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/models/models.dart';
import 'package:permamind/widgets/parcel_carrousel.dart';

class GardenItem extends StatelessWidget {
  final String name;
  final Garden garden;
  final User user;
  final int index;
  final int dayActivitiesCount;

  GardenItem({
    @required this.name,
    @required this.garden,
    @required this.user,
    @required this.index,
    this.dayActivitiesCount
  });

  // TODO Internationalisation des labels !!

  @override
  Widget build(BuildContext context) {

    TextEditingController _gardenNameTextController = TextEditingController();

    final gardensBloc = BlocProvider.of<GardensBloc>(context);


    return Padding(
      padding: EdgeInsets.only(top: 2 * SizeConfig.heightMultiplier),
      child: Container(
        height: 34 * SizeConfig.heightMultiplier,
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
                  height: 11 * SizeConfig.heightMultiplier,
//                color: Colors.blue,
                  child: Padding(
                    padding: EdgeInsets.all(0.1 * SizeConfig.heightMultiplier),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                                "$name",
                                style: TextStyle(
                                    color: const Color(0xFF01534F),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 2.7 * SizeConfig.textMultiplier
                                )
                            ),
                            FlatButton(
                              child: Text(
                                  "Modifier",
                                  style: TextStyle(
                                      color: const Color(0xFF4FB06E),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 2 * SizeConfig.textMultiplier
                                  )
                              ),
                              onPressed: () {
                                showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) => CupertinoActionSheet(
                                      actions: <Widget>[
                                        CupertinoButton(
                                          color: Colors.green,
                                          child: Text("Ajouter des personnes"),
                                          onPressed: null,
                                        ),
                                        Container(height: 10,),
                                        CupertinoButton(
                                          color: Colors.green,
                                          child: Text("Renommer"),
                                          onPressed: () {
                                            return showDialog<void>(
                                              context: context,
                                              barrierDismissible: false, // user must tap button!
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text('Renommer ce jardin'),
                                                  content: TextField(
                                                    controller: _gardenNameTextController,
                                                    decoration: InputDecoration(hintText: "Nom jardin"),
                                                  ),
                                                  actions: <Widget>[
                                                    FlatButton(
                                                      child: Text('${AppLocalizations.of(context).buttonCancel}'),
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                    ),
                                                    FlatButton(
                                                      child: Text('Mettre à jour'),
                                                      onPressed: () {

                                                        if (_gardenNameTextController.text.isNotEmpty) {

                                                          gardensBloc.add(
                                                            GardenUpdated(
                                                                garden.copyWith(
                                                                    name: _gardenNameTextController.text,
                                                                    id: garden.id,
                                                                    publicVisibility: garden.publicVisibility ,
                                                                    admin: garden.admin,
                                                                    members: garden.members,
                                                                    creationDate: garden.creationDate,
                                                                    dayActivitiesCount: garden.dayActivitiesCount
                                                                )
                                                            ),
                                                          );
                                                          Navigator.pushNamedAndRemoveUntil(
                                                            context,
                                                            '/',
                                                                (Route<dynamic> route) => false,
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
                                        Container(height: 10,),
                                        CupertinoButton(
                                          color: Colors.green,
                                          child: Text("Supprimer"),
                                          onPressed: (){
                                            return showDialog<void>(
                                              context: context,
                                              barrierDismissible: false, // user must tap button!
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text('${AppLocalizations.of(context).settingsGardenDeleteTitle}'),
                                                  content: SingleChildScrollView(
                                                    child: ListBody(
                                                      children: <Widget>[
                                                        Text('${AppLocalizations.of(context).settingsGardenDeleteMessage}'),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    FlatButton(
                                                      child: Text('${AppLocalizations.of(context).buttonCancel}'),
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                    ),
                                                    FlatButton(
                                                      child: Text('${AppLocalizations.of(context).buttonContinue}'),
                                                      onPressed: () {
                                                        gardensBloc.add(GardenDeleted(garden));
                                                        Navigator.pushNamedAndRemoveUntil(
                                                          context,
                                                          '/',
                                                              (Route<dynamic> route) => false,
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
                                    )
                                );
                              },
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 0.3 * SizeConfig.heightMultiplier, bottom: 0.3 * SizeConfig.heightMultiplier),
                              child: Text(
                                  "$dayActivitiesCount activités à réaliser aujourd'hui.",
                                  style: TextStyle(
                                      color: const Color(0xFF01534F),
                                      fontSize: 2.2 * SizeConfig.textMultiplier
                                  )
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
              ),

              ParcelCarouselWithIndicator(
                  garden, user),

//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Padding(
//                        padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),
//                        child: Text(
//                            "Voir mes parcelles",
//                            style: TextStyle(
//                                color: const Color(0xFF01534F),
//                                fontWeight: FontWeight.normal,
//                                fontSize: 2.2 * SizeConfig.textMultiplier
//                            )
//                        ),
//                      ),
//                    ],
//                  )
            ],
          ),
        ),
      ),
    );
  }


}
