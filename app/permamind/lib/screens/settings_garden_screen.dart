
import 'package:arch/arch.dart';
import 'package:authentication/authentication.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/arch_bricks/keys.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/models/models.dart';



class SettingsGardenScreen extends StatefulWidget {
  final bool isEditing;
  final String gardenId;
  final User user;
  final List<GardenMember> initialMembersData;
  final List<MemberProfile> initialMember;

  SettingsGardenScreen(
      {Key key,
        @required this.isEditing,
        @required this.user,
        @required this.gardenId,
        @required this.initialMembersData,
        @required this.initialMember
      })
      : super(key: key ?? ArchSampleKeys.addTodoScreen);


  @override
  _SettingsGardenScreenState createState() => _SettingsGardenScreenState();
}


class _SettingsGardenScreenState extends State<SettingsGardenScreen> {


  final TextEditingController _newGardenNameController = TextEditingController();

  bool _newGardenNameValidate = false;

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

    return BlocBuilder<GardensBloc, GardensState>(
    builder: (context, state) {
      final garden = (state as GardensLoaded)
          .gardens.firstWhere((garden) => garden.id == widget.gardenId,
          orElse: () => null);

      if (garden != null) {
        if (widget.user.id == garden.admin) {
          return Scaffold(
            appBar: AppBar(
              title: Text('${AppLocalizations.of(context).settingsGardenTitle}'),
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
                              "${AppLocalizations.of(context).settingsGardenName}",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          TextFormField(
                            controller: _newGardenNameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: garden != null ? "${garden.name}" : "",
                              errorText: _newGardenNameValidate ? '${AppLocalizations.of(context).settingsGardenNameError}' : null,
                            ),
                            onChanged: (value) {
                              _newGardenNameController.text.isEmpty
                                  ? _newGardenNameValidate = true
                                  : _newGardenNameValidate = false;
                              setState(() {});
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "${AppLocalizations.of(context).settingsGardenFriendsTitle}",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),


                          ChipsInput(
                            keyboardAppearance: Brightness.dark,
                            textCapitalization: TextCapitalization.words,
                            enabled: true,
                            maxChips: 15,
                            textStyle: TextStyle(
                                height: 1.5, fontFamily: "Roboto", fontSize: 16),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              // hintText: formControl.hint,
                              // enabled: false,
                              // errorText: field.errorText,
                            ),
                            // TODO Changer ici
                            initialValue: widget.initialMember,
                            findSuggestions: (String query) async {
                              queryResProfile = [];
                              if (query.length != 0) {
                                _gardenMembers = [];

                                var queryRes = await BlocProvider.of<ParcelsBloc>(context).dataRepository.searchByName(query);
                                for (int i = 0; i < queryRes.documents.length; ++i) {
                                  var data = queryRes.documents[i].data;
                                  queryResProfile.add(MemberProfile(
                                    data["id"],
                                    data["pseudo"],
//                                  data["email"],
//                                  'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX4057996.jpg'
                                  ));
                                }

                              }
                              return queryResProfile;
                            },
                            onChanged: (data) {
                              _gardenMembers.clear();
                              data.forEach((elem){
                                if (elem.pseudo != widget.user.pseudo) {
                                  _gardenMembers.add(GardenMember(id: elem.id, pseudo: elem.pseudo));
                                }
                              });
                            },
                            chipBuilder: (context, state, profile) {
                              return InputChip(
                                key: ObjectKey(profile),
                                label: Text(profile.pseudo),
//                            avatar: CircleAvatar(
//                              backgroundImage: NetworkImage(profile.imageUrl),
//                            ),
                                onDeleted: () => state.deleteChip(profile),
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              );
                            },
                            suggestionBuilder: (context, state, profile) {
                              return ListTile(
                                key: ObjectKey(profile),
//                            leading: CircleAvatar(
//                              backgroundImage: NetworkImage(profile.imageUrl),
//                            ),
                                title: Text(profile.pseudo),
//                            subtitle: Text(profile.email),
                                onTap: () => state.selectSuggestion(profile),
                              );
                            },
                          ),

                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: ButtonTheme(
                                minWidth: 200.0,
                                height: 50.0,
//                            buttonColor: state.theme.accentColor,
                                child: RaisedButton(
                                  onPressed: () {

                                    if (_newGardenNameController.text.isNotEmpty || listEquals(_gardenMembers, widget.initialMembersData) == false ) {

                                      if (_newGardenNameController.text.isEmpty) {
                                        _newGardenNameController.text = garden.name;
                                      }

                                      _gardenMembers.add(GardenMember(id: widget.user.id, pseudo: widget.user.pseudo));

                                      BlocProvider.of<GardensBloc>(context).add(
                                        UpdateGarden(
                                          garden.copyWith(
                                              name: _newGardenNameController.text,
                                              id: garden.id,
                                              publicVisibility: garden.publicVisibility,
                                              members: _gardenMembers
                                          ),
                                        ),
                                      );
                                    }

                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "${AppLocalizations.of(context).settingsConfirmChanges}",
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
//                            buttonColor: state.theme.accentColor,
                                child: RaisedButton(
                                  onPressed: () {

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
                                    "${AppLocalizations.of(context).settingsGardenDelete}",
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
              title: Text('${AppLocalizations.of(context).settingsGardenTitle}'),
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
                              "${AppLocalizations.of(context).settingsGardenName}",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          TextFormField(
                            controller: _newGardenNameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: garden != null ? "${garden.name}" : "",
                              errorText: _newGardenNameValidate ? '${AppLocalizations.of(context).settingsGardenNameError}' : null,
                            ),
                            onChanged: (value) {
                              _newGardenNameController.text.isEmpty
                                  ? _newGardenNameValidate = true
                                  : _newGardenNameValidate = false;
                              setState(() {});
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "${AppLocalizations.of(context).settingsGardenFriendsTitle}",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),


                          ChipsInput(
                            keyboardAppearance: Brightness.dark,
                            textCapitalization: TextCapitalization.words,
                            enabled: true,
                            maxChips: 15,
                            textStyle: TextStyle(
                                height: 1.5, fontFamily: "Roboto", fontSize: 16),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              // hintText: formControl.hint,
                              // enabled: false,
                              // errorText: field.errorText,
                            ),
                            // TODO Changer ici
                            initialValue: widget.initialMember,
                            findSuggestions: (String query) async {
                              queryResProfile = [];
                              if (query.length != 0) {
                                _gardenMembers = [];

                                var queryRes = await BlocProvider.of<ParcelsBloc>(context).dataRepository.searchByName(query);
                                for (int i = 0; i < queryRes.documents.length; ++i) {
                                  var data = queryRes.documents[i].data;
                                  queryResProfile.add(MemberProfile(
                                    data["id"],
                                    data["pseudo"],
//                                  data["email"],
//                                  'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX4057996.jpg'
                                  ));
                                }

                              }
                              return queryResProfile;
                            },
                            onChanged: (data) {
                              _gardenMembers.clear();
                              data.forEach((elem){
                                if (elem.pseudo != widget.user.pseudo) {
                                  _gardenMembers.add(GardenMember(id: elem.id, pseudo: elem.pseudo));
                                }
                              });
                            },
                            chipBuilder: (context, state, profile) {
                              return InputChip(
                                key: ObjectKey(profile),
                                label: Text(profile.pseudo),
//                            avatar: CircleAvatar(
//                              backgroundImage: NetworkImage(profile.imageUrl),
//                            ),
                                onDeleted: () => state.deleteChip(profile),
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              );
                            },
                            suggestionBuilder: (context, state, profile) {
                              return ListTile(
                                key: ObjectKey(profile),
//                            leading: CircleAvatar(
//                              backgroundImage: NetworkImage(profile.imageUrl),
//                            ),
                                title: Text(profile.pseudo),
//                            subtitle: Text(profile.email),
                                onTap: () => state.selectSuggestion(profile),
                              );
                            },
                          ),

                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: ButtonTheme(
                                minWidth: 200.0,
                                height: 50.0,
//                            buttonColor: state.theme.accentColor,
                                child: RaisedButton(
                                  onPressed: () {

                                    if (_newGardenNameController.text.isNotEmpty || listEquals(_gardenMembers, widget.initialMembersData) == false ) {

                                      if (_newGardenNameController.text.isEmpty) {
                                        _newGardenNameController.text = garden.name;
                                      }

                                      _gardenMembers.add(GardenMember(id: widget.user.id, pseudo: widget.user.pseudo));

                                      BlocProvider.of<GardensBloc>(context).add(
                                        UpdateGarden(
                                          garden.copyWith(
                                              name: _newGardenNameController.text,
                                              id: garden.id,
                                              publicVisibility: garden.publicVisibility,
                                              members: _gardenMembers
                                          ),
                                        ),
                                      );
                                    }

                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "${AppLocalizations.of(context).settingsConfirmChanges}",
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
//                            buttonColor: state.theme.accentColor,
                                child: RaisedButton(
                                  onPressed: () {

                                    return showDialog<void>(
                                      context: context,
                                      barrierDismissible: false, // user must tap button!
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('${AppLocalizations.of(context).settingsGardenLeaveTitle}'),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Text('${AppLocalizations.of(context).settingsGardenLeaveMessage}'),
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
                                    "${AppLocalizations.of(context).settingsGardenLeaveButton}",
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

class SettingsGardenScreenArguments {
  final String id;
  SettingsGardenScreenArguments(this.id);
}