
import 'package:data_repository/data_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/arch_bricks/keys.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/models/models.dart';



// TODO Need to check Input entry
class SettingsGardenScreen extends StatefulWidget {
  final bool isEditing;
  final String id;
  final String userId;
  final List<GardenMember> membersData;
  final List<MemberProfile> initialMember;

  SettingsGardenScreen(
      {Key key,
        @required this.isEditing,
        @required this.userId,
        @required this.id,
        @required this.membersData,
        @required this.initialMember
      })
      : super(key: key ?? ArchSampleKeys.addTodoScreen);


  @override
  _SettingsGardenScreenState createState() => _SettingsGardenScreenState();
}


class _SettingsGardenScreenState extends State<SettingsGardenScreen> {


  final TextEditingController _newGardenNameController = TextEditingController();

  bool _newGardenNameValidate = false;

  Widget build(BuildContext context) {

    List<GardenMember> _gardenMembers =  List<GardenMember>.from(widget.membersData);

    List<MemberProfile> queryResProfile = List<MemberProfile>();

    return BlocBuilder<GardensBloc, GardensState>(
    builder: (context, state) {
      final garden = (state as GardensLoaded)
          .gardens.firstWhere((garden) => garden.id == widget.id,
          orElse: () => null);

      return Scaffold(
        appBar: AppBar(
          title: const Text('Garden settings'),
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
                          "Garden's name",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      TextFormField(
                        controller: _newGardenNameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: garden != null ? "${garden.name}" : "",
                          errorText: _newGardenNameValidate ? 'Value Can\'t Be Empty' : null,
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
                          "Garden friends 😃",
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
                            var queryRes = await BlocProvider.of<ActivitiesBloc>(context).dataRepository.searchByName(query);

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
                            _gardenMembers.add(GardenMember(id: elem.id, pseudo: elem.pseudo));
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

                                  if (_newGardenNameController.text.isNotEmpty || listEquals(_gardenMembers, widget.membersData) == false ) {

                                    if (_newGardenNameController.text.isEmpty) {
                                      _newGardenNameController.text = garden.name;
                                    }

                                    // Rajoute mon identifiant sinon plus persone dans la liste des jardins !
                                    for (final member in widget.membersData) {
                                      if (member.id == widget.userId) {
                                        _gardenMembers.add(member);
                                      }
                                    }
//                                    final GardenMember myself = widget.membersData.where((myself) => myself.id == widget.userId) as GardenMember;

//                                    _gardenMembers.add(myself);
//                                  List<GardenMember> newMembers = new List<GardenMember>();
//
//                                  if (_gardenMembers.isNotEmpty) {
//
//                                    for (final item in _gardenMembers) {
//                                      if (newMembers.contains(item.id) == false) {
////                                        newMembers.add(item);
//                                      }
//                                    }
//                                  } else {
//
//                                  }

                                    BlocProvider.of<GardensBloc>(context).add(
                                      UpdateGarden(
                                        garden.copyWith(
                                            name: _newGardenNameController.text,
                                            length: garden.length,
                                            width: garden.width,
                                            gardenGround: garden.gardenGround,
                                            id: garden.id,
                                            publicVisibility: garden.publicVisibility,
                                            modelingId: garden.modelingId,
                                            members: _gardenMembers
                                        ),
                                      ),
                                    );
                                  }

//                                if (_gardenMembers.isNotEmpty || _newGardenNameController.text.isNotEmpty) {
//
//                                  List<String> newMembers = new List<String>.from(garden.members);
//
//                                  if (_gardenMembers.isNotEmpty) {
//
//                                    for (final item in _gardenMembers) {
//                                      if (newMembers.contains(item.id) == false) {
////                                        newMembers.add(item);
//                                      }
//                                    }
//                                  }
//
//                                  if (_newGardenNameController.text.isEmpty) {
//                                    _newGardenNameController.text = garden.name;
//                                  }
//

//                                }

                                  Navigator.pop(context, false);

                                },
                                child: Text(
                                  "Confirm changes",
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
                                Map returnData = {'action': 'Leave', 'garden': garden};
                                Navigator.pop(context, returnData);
                              },
                              child: Text(
                                "Leave a Garden",
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
                                Map returnData = {'action': 'Delete', 'garden': garden};
                                Navigator.pop(context, returnData);
                              },
                              child: Text(
                                "Delete a Garden",
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

    );
//    return Scaffold(
//      appBar: AppBar(
//        title: const Text('Garden settings'),
//      ),
//      body: Center(
//          child: Padding(
//            padding: EdgeInsets.only(left: 20, right: 20, top:10.0),
//            child: Form(
//              child: ListView(
//                children: <Widget>[
//                  Padding(
//                    padding: EdgeInsets.symmetric(vertical: 10),
//                    child: Text(
//                      "Garden's name",
//                      style: TextStyle(fontSize: 20),
//                    ),
//                  ),
//                  TextFormField(
//                    controller: null,
//                    decoration: InputDecoration(
//                      border: OutlineInputBorder(),
//                      hintText: "Enter a Garden's name",
////                      errorText: _gardenNameValidate ? 'Value Can\'t Be Empty' : null,
//                    ),
//                    onChanged: (value) {
////                      _gardenNameController.text.isEmpty
////                          ? _gardenNameValidate = true
////                          : _gardenNameValidate = false;
////                      setState(() {});
//                    },
//                  ),
//                ],
//              ),
//            )
//          )
//      ),
//    );
  }
}

class SettingsGardenScreenArguments {
  final String id;
  SettingsGardenScreenArguments(this.id);
}