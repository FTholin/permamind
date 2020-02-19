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

          return Scaffold(
            appBar: AppBar(
              title: const Text('Parcel settings'),
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
                              "Parcel's name",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          TextFormField(
                            controller: _newParcelNameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: parcel != null ? "${parcel.name}" : "",
                              errorText: _newParcelNameValidate ? 'Value Can\'t Be Empty' : null,
                            ),
                            onChanged: (value) {
                              _newParcelNameController.text.isEmpty
                                  ? _newParcelNameValidate = true
                                  : _newParcelNameValidate = false;
                              setState(() {});
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Parcel friends 😃",
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

                                    if (_newParcelNameController.text.isNotEmpty || listEquals(_gardenMembers, widget.initialMembersData) == false ) {

                                      if (_newParcelNameController.text.isEmpty) {
                                        _newParcelNameController.text = parcel.name;
                                      }

                                      _gardenMembers.add(GardenMember(id: widget.user.id, pseudo: widget.user.pseudo));

//                                      BlocProvider.of<ParcelsBloc>(context).add(
//                                        UpdateParcel(
//                                          parcel.copyWith(
//                                              name: _newParcelNameController.text,
//                                              id: parcel.id,
//                                              publicVisibility: parcel.publicVisibility,
//                                              members: _gardenMembers
//                                          ),
//                                        ),
//                                      );
                                    }

                                    Navigator.pop(context, true);
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
//                                    BlocProvider.of<ParcelsBloc>(context).add(
//                                        LeaveParcel(
//                                            garden,
//                                            widget.user.id
//                                        ));
                                    Navigator.pop(context, false);
                                  },
                                  child: Text(
                                    "Leave a Parcel",
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
                                    Navigator.pop(context, false);
                                  },
                                  child: Text(
                                    "Delete a Parcel",
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
  }
}

class SettingsParcelScreenArguments {
  final String id;
  SettingsParcelScreenArguments(this.id);
}