import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/screens/screens.dart';
import 'package:data_repository/data_repository.dart';

class AddEditGardenScreen extends StatefulWidget {
  final bool isEditing;
  final Garden garden;
  final FirebaseDataRepository dataProvider;

  AddEditGardenScreen(
      {Key key,
      @required this.dataProvider,
      @required this.isEditing,
      this.garden})
      : super(key: key ?? ArchSampleKeys.addTodoScreen);

  @override
  _AddEditGardenScreenState createState() => _AddEditGardenScreenState();
}

class _AddEditGardenScreenState extends State<AddEditGardenScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _gardenNameController = TextEditingController();

  final String _publicTitle = "Public";

  final String _privateTitle = "Private";

  final String _privateParagraph =
      "Private gardens are accessible by invitation only and are not displayed on the map";

  final String _publicParagraph =
      "Public gardens are accessible and are  displayed on the map";

  bool _validate = false;

  bool _gardenVisibility = false;

  bool get isEditing => widget.isEditing;

  @override
  Widget build(BuildContext context) {
    final localizations = ArchSampleLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;

    List<String> _gardenMembers = [];

    var queryResProfile = [];

    return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is LightThemeSelected) {
            return Scaffold(
                appBar: AppBar(
                  title: Text("Create a garden"),
                ),
                body: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Form(
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Create a garden",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        TextFormField(
                          controller: _gardenNameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Garden's name",
                            hintText: "Enter a Garden's name",
                            errorText: _validate ? 'Value Can\'t Be Empty' : null,
                          ),
                          onChanged: (value) {
                            _gardenNameController.text.isEmpty
                                ? _validate = true
                                : _validate = false;
                            setState(() {});
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: SwitchListTile(
                            title: Text(
                                "${_gardenVisibility == false ? _privateTitle : _publicTitle}",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20)),
                            value: _gardenVisibility,
                            onChanged: (bool value) {
                              setState(() {
                                _gardenVisibility = value;
                              });
                            },
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                                "${_gardenVisibility == false ? _privateParagraph : _publicParagraph}",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14))
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 35.0, bottom: 10),
                          child: Text(
                            "Invite collaborators (Optional)",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),ChipsInput(
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
                          findSuggestions: (String query) async {
                            queryResProfile = [];
                            if (query.length != 0) {
                              _gardenMembers = [];
                              var queryRes =
                              await widget.dataProvider.searchByName(query);

                              for (int i = 0; i < queryRes.documents.length; ++i) {
                                var data = queryRes.documents[i].data;
                                queryResProfile.add(AppProfile(
                                    data["id"],
                                    data["pseudo"],
                                    data["email"],
                                    'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX4057996.jpg'));
                              }
                            }
                            return queryResProfile;
                          },
                          onChanged: (data) {

                            _gardenMembers.clear();
                            data.forEach((elem){
                              _gardenMembers.add(elem.id);
                            });
                          },
                          chipBuilder: (context, state, profile) {
                            return InputChip(
                              key: ObjectKey(profile),
                              label: Text(profile.pseudo),
                              avatar: CircleAvatar(
                                backgroundImage: NetworkImage(profile.imageUrl),
                              ),
                              onDeleted: () => state.deleteChip(profile),
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            );
                          },
                          suggestionBuilder: (context, state, profile) {
                            return ListTile(
                              key: ObjectKey(profile),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(profile.imageUrl),
                              ),
                              title: Text(profile.pseudo),
                              subtitle: Text(profile.email),
                              onTap: () => state.selectSuggestion(profile),
                            );
                          },
                        ),

                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: ButtonTheme(
                              minWidth: 200.0,
                              height: 50.0,
                              buttonColor: Colors.yellow,
                              child: RaisedButton(
                                onPressed: () {
                                  if (_gardenNameController.text.isNotEmpty) {
                                    Navigator.pushNamed(
                                      context,
                                      ArchSampleRoutes.discoverModelings,
                                      arguments: ModelingsScreenArguments(
                                          '${_gardenNameController.text}', _gardenVisibility, _gardenMembers),
                                    );
                                  } else {
                                    setState(() {
                                      _gardenNameController.text.isEmpty
                                          ? _validate = true
                                          : _validate = false;
                                    });
                                  }
                                },
                                child: Text(
                                  "Create a garden",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                )

            );
          } else {
            return Scaffold(
                appBar: AppBar(
                  title: Text("Create a garden"),
                ),
                body: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Form(
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Create a garden",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        TextFormField(
                          controller: _gardenNameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Garden's name",
                            hintText: "Enter a Garden's name",
                            errorText: _validate ? 'Value Can\'t Be Empty' : null,
                          ),
                          onChanged: (value) {
                            _gardenNameController.text.isEmpty
                                ? _validate = true
                                : _validate = false;
                            setState(() {});
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: SwitchListTile(
                            title: Text(
                                "${_gardenVisibility == false ? _privateTitle : _publicTitle}",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20)),
                            value: _gardenVisibility,
                            onChanged: (bool value) {
                              setState(() {
                                _gardenVisibility = value;
                              });
                            },
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                                "${_gardenVisibility == false ? _privateParagraph : _publicParagraph}",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14))
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 35.0, bottom: 10),
                          child: Text(
                            "Invite collaborators (Optional)",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),ChipsInput(
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
                          findSuggestions: (String query) async {
                            queryResProfile = [];
                            if (query.length != 0) {
                              _gardenMembers = [];
                              var queryRes =
                              await widget.dataProvider.searchByName(query);

                              for (int i = 0; i < queryRes.documents.length; ++i) {
                                var data = queryRes.documents[i].data;
                                queryResProfile.add(AppProfile(
                                    data["id"],
                                    data["pseudo"],
                                    data["email"],
                                    'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX4057996.jpg'));
                              }
                            }
                            return queryResProfile;
                          },
                          onChanged: (data) {

                            _gardenMembers.clear();
                            data.forEach((elem){
                              _gardenMembers.add(elem.id);
                            });
                          },
                          chipBuilder: (context, state, profile) {
                            return InputChip(
                              key: ObjectKey(profile),
                              label: Text(profile.pseudo),
                              avatar: CircleAvatar(
                                backgroundImage: NetworkImage(profile.imageUrl),
                              ),
                              onDeleted: () => state.deleteChip(profile),
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            );
                          },
                          suggestionBuilder: (context, state, profile) {
                            return ListTile(
                              key: ObjectKey(profile),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(profile.imageUrl),
                              ),
                              title: Text(profile.pseudo),
                              subtitle: Text(profile.email),
                              onTap: () => state.selectSuggestion(profile),
                            );
                          },
                        ),

                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: ButtonTheme(
                              minWidth: 200.0,
                              height: 50.0,
                              buttonColor: state.theme.accentColor,
                              child: RaisedButton(
                                onPressed: () {
                                  if (_gardenNameController.text.isNotEmpty) {
                                    Navigator.pushNamed(
                                      context,
                                      ArchSampleRoutes.discoverModelings,
                                      arguments: ModelingsScreenArguments(
                                          '${_gardenNameController.text}', _gardenVisibility, _gardenMembers),
                                    );
                                  } else {
                                    setState(() {
                                      _gardenNameController.text.isEmpty
                                          ? _validate = true
                                          : _validate = false;
                                    });
                                  }
                                },
                                child: Text(
                                  "Create a garden",
                                  style: TextStyle(fontSize: 22),
                                ),
                                textColor: state.theme.canvasColor
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                )

            );
          }
        }
    );


  }
}

class AppProfile {
  final String id;
  final String pseudo;
  final String email;
  final String imageUrl;

  const AppProfile(this.id, this.pseudo, this.email, this.imageUrl);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppProfile &&
          runtimeType == other.runtimeType &&
          pseudo == other.pseudo &&
          id == other.id;

  @override
  int get hashCode => pseudo.hashCode;

  @override
  String toString() {
    return pseudo;
  }
}
