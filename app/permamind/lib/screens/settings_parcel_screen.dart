import 'package:authentication/authentication.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:permamind/Localization.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/arch_bricks/keys.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/models/models.dart';


class SettingsParcelScreen extends StatefulWidget {
  final bool isEditing;
  final String parcelId;
  final User user;
  final List<GardenMember> initialMembersData;
  final List<MemberProfile> initialMember;

  SettingsParcelScreen(
      {Key key,
        @required this.isEditing,
        @required this.user,
        @required this.parcelId,
        @required this.initialMembersData,
        @required this.initialMember
      })
      : super(key: key ?? ArchSampleKeys.addTodoScreen);


  @override
  _SettingsParcelScreenState createState() => _SettingsParcelScreenState();
}


class _SettingsParcelScreenState extends State<SettingsParcelScreen> {


  final TextEditingController _newParcelNameController = TextEditingController();

  bool _newParcelNameValidate = false;

  List<GardenMember> _gardenMembers =  List<GardenMember>();

  List<MemberProfile> queryResProfile = List<MemberProfile>();

  @override
  void initState() {

    for (final member in widget.initialMembersData) {
      if (member.id != widget.user.id && member.pseudo != widget.user.pseudo)
        _gardenMembers.add(member);
    }

    super.initState();
  }

  Widget build(BuildContext context) {

    return BlocBuilder<ParcelsBloc, ParcelsState>(
        builder: (context, state) {
          final parcel = (state as ParcelsLoaded)
              .parcels.firstWhere((garden) => garden.id == widget.parcelId,
              orElse: () => null);

          if (parcel != null) {
            if (parcel.admin == widget.user.id) {
              return Scaffold(
                appBar: AppBar(
                  title:  Text('${DemoLocalizations.of(context).settingsParcelTitle}'),
                ),
                body: Center(
                    child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top:10.0),
                        child: Form(
                          child: ListView(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "${DemoLocalizations.of(context).addParcelNameHint}",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              TextFormField(
                                controller: _newParcelNameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: parcel != null ? "${parcel.name}" : "",
                                  errorText: _newParcelNameValidate ? '${DemoLocalizations.of(context).addParcelNameError}' : null,
                                ),
                                onChanged: (value) {
                                  _newParcelNameController.text.isEmpty
                                      ? _newParcelNameValidate = true
                                      : _newParcelNameValidate = false;
                                  setState(() {});
                                },
                              ),


                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: ButtonTheme(
                                    minWidth: 200.0,
                                    height: 50.0,
                                    child: RaisedButton(
                                      onPressed: () {

                                        if (_newParcelNameController.text.isNotEmpty || listEquals(_gardenMembers, widget.initialMembersData) == false ) {

                                          if (_newParcelNameController.text.isEmpty) {
                                            _newParcelNameController.text = parcel.name;
                                          }

                                          _gardenMembers.add(GardenMember(id: widget.user.id, pseudo: widget.user.pseudo));

                                          BlocProvider.of<ParcelsBloc>(context).add(
                                            ParcelUpdated(
                                              parcel.copyWith(
                                                name: _newParcelNameController.text,
                                                gardenId: parcel.gardenId,
                                                length: parcel.length,
                                                width: parcel.width,
                                                parcelGround: parcel.parcelGround,
                                                publicVisibility: parcel.publicVisibility,
                                                admin: parcel.admin,
                                                members: parcel.members,
                                                currentModelingId: parcel.currentModelingId,
                                                currentModelingName: parcel.currentModelingName,
                                                creationDate: parcel.creationDate,
                                                dayActivitiesCount: parcel.dayActivitiesCount,
                                                modelingsMonitoring: parcel.modelingsMonitoring,
                                                id: parcel.id,
                                              ),
                                            ),
                                          );
                                        }

                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "${DemoLocalizations.of(context).settingsConfirmChanges}",
                                        style: TextStyle(fontSize: 22),
                                      ),
                                    ),
                                  )
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: ButtonTheme(
                                    buttonColor: Colors.red,
                                    minWidth: 200.0,
                                    height: 50.0,
                                    child: RaisedButton(
                                      onPressed: () {

                                        return showDialog<void>(
                                          context: context,
                                          barrierDismissible: false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('${DemoLocalizations.of(context).settingsParcelDeleteTitle}'),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: <Widget>[
                                                    Text('${DemoLocalizations.of(context).settingsParcelDeleteMessage}'),
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                FlatButton(
                                                  child: Text('${DemoLocalizations.of(context).buttonCancel}'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                FlatButton(
                                                  child: Text('${DemoLocalizations.of(context).continueButton}'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                    Navigator.pop(context, false);
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Text(
                                        "${DemoLocalizations.of(context).settingsParcelDeleteButton}",
                                        style: TextStyle(fontSize: 22),
                                      ),
                                    ),
                                  )
                              ),
                            ],
                          ),
                        )
                    )
                ),
              );

            } else {
              return Scaffold(
                appBar: AppBar(
                  title:  Text('${DemoLocalizations.of(context).addParcelTitle}'),
                ),
                body: Center(
                    child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top:10.0),
                        child: Form(
                          child: ListView(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "${DemoLocalizations.of(context).settingsParcelTitle}",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              TextFormField(
                                controller: _newParcelNameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: parcel != null ? "${parcel.name}" : "",
                                  errorText: _newParcelNameValidate ? '${DemoLocalizations.of(context).addParcelNameError}' : null,
                                ),
                                onChanged: (value) {
                                  _newParcelNameController.text.isEmpty
                                      ? _newParcelNameValidate = true
                                      : _newParcelNameValidate = false;
                                  setState(() {});
                                },
                              ),


                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: ButtonTheme(
                                    minWidth: 200.0,
                                    height: 50.0,
                                    child: RaisedButton(
                                      onPressed: () {

                                        if (_newParcelNameController.text.isNotEmpty || listEquals(_gardenMembers, widget.initialMembersData) == false ) {

                                          if (_newParcelNameController.text.isEmpty) {
                                            _newParcelNameController.text = parcel.name;
                                          }

                                          _gardenMembers.add(GardenMember(id: widget.user.id, pseudo: widget.user.pseudo));

                                          BlocProvider.of<ParcelsBloc>(context).add(
                                            ParcelUpdated(
                                              parcel.copyWith(
                                                name: _newParcelNameController.text,
                                                gardenId: parcel.gardenId,
                                                length: parcel.length,
                                                width: parcel.width,
                                                parcelGround: parcel.parcelGround,
                                                publicVisibility: parcel.publicVisibility,
                                                admin: parcel.admin,
                                                members: parcel.members,
                                                currentModelingId: parcel.currentModelingId,
                                                currentModelingName: parcel.currentModelingName,
                                                dayActivitiesCount: parcel.dayActivitiesCount,
                                                modelingsMonitoring: parcel.modelingsMonitoring,
                                                id: parcel.id,
                                              ),
                                            ),
                                          );
                                        }

                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "${DemoLocalizations.of(context).settingsConfirmChanges}",
                                        style: TextStyle(fontSize: 22),
                                      ),
                                    ),
                                  )
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: ButtonTheme(
                                    buttonColor: Colors.pinkAccent,
                                    minWidth: 200.0,
                                    height: 50.0,
                                    child: RaisedButton(
                                      onPressed: () {

                                        return showDialog<void>(
                                          context: context,
                                          barrierDismissible: false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('${DemoLocalizations.of(context).settingsParcelLeaveTitle}'),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: <Widget>[
                                                    Text('${DemoLocalizations.of(context).settingsParcelLeaveMessage}'),
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                FlatButton(
                                                  child: Text('${DemoLocalizations.of(context).buttonCancel}'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                FlatButton(
                                                  child: Text('${DemoLocalizations.of(context).continueButton}'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                    Navigator.pop(context, true);
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );


                                      },
                                      child: Text(
                                        "${DemoLocalizations.of(context).settingsParcelLeaveButton}",
                                        style: TextStyle(fontSize: 22),
                                      ),
                                    ),
                                  )
                              ),
                            ],
                          ),
                        )
                    )
                ),
              );
            }
          } else {
            return Container();
          }

        }

    );
  }
}


class SettingsParcelScreenArguments {
  final String id;
  SettingsParcelScreenArguments(this.id);
}
//
//showAlertDialog(BuildContext context) {
//
//  // set up the buttons
//  Widget cancelButton = FlatButton(
//    child: Text("Cancel"),
//    onPressed:  () {},
//  );
//  Widget continueButton = FlatButton(
//    child: Text("Continue"),
//    onPressed:  () {},
//  );
//
//  // set up the AlertDialog
//  AlertDialog alert = AlertDialog(
//    title: Text("Delete this parcel ?"),
//    content: Text("This action will result in the permanent removal of the parcel."),
//    actions: [
//      cancelButton,
//      continueButton,
//    ],
//  );
//
//  // show the dialog
//  showDialog(
//    context: context,
//    builder: (BuildContext context) {
//      return alert;
//    },
//  );
//}