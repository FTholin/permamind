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

  final TextEditingController _gardenLengthController = TextEditingController();
  final TextEditingController _gardenWidthController = TextEditingController();


  final String _publicTitle = "Public";

  final String _privateTitle = "Private";

  final String _bacTitle = "You own a bac";

  final String _groundTitle = "You own a ground";


  final String _privateParagraph =
      "Private gardens are accessible by invitation only and are not displayed on the map";

  final String _publicParagraph =
      "Public gardens are accessible and won't displayed on the map";

  final String _groundParagraph = "To make a garden, you need a piece of land and eternity.";

  final String _bacParagraph = "A garden is an ambiguous place.";

  bool _gardenNameValidate = false;
  bool _gardenLengthValidate = false;
  bool _gardenWidthValidate = false;

  bool _gardenGround = false;

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
                  title: Text("Create your garden"),
                ),
                body: Padding(
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
                          controller: _gardenNameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter a Garden's name",
                            errorText: _gardenNameValidate ? 'Value Can\'t Be Empty' : null,
                          ),
                          onChanged: (value) {
                            _gardenNameController.text.isEmpty
                                ? _gardenNameValidate = true
                                : _gardenNameValidate = false;
                            setState(() {});
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Garden's dimensions (meters)",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 10, right: 20),
                                  child: TextFormField(
                                    controller: _gardenLengthController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Garden's length",
                                      errorText: _gardenLengthValidate ? 'Length Can\'t Be Empty' : null,
                                    ),
                                    onChanged: (value) {
                                      print(_gardenLengthController.text.isEmpty);
                                      _gardenLengthController.text.isEmpty
                                          ? _gardenLengthValidate = true
                                          : _gardenLengthValidate = false;
                                      setState(() {});
                                    },
                                  ),
                                )
                            ),
                            Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 10, left: 20),

                                  child: TextFormField(
                                    controller: _gardenWidthController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Garden's width",
                                      errorText: _gardenWidthValidate ? 'Width Can\'t Be Empty' : null,
                                    ),
                                    onChanged: (value) {
                                      _gardenWidthController.text.isEmpty
                                          ? _gardenWidthValidate = true
                                          : _gardenWidthValidate = false;
                                      setState(() {});
                                    },
                                  ),
                                )
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Garden's Type",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SwitchListTile(
                          title: Text(
                              "${_gardenGround == false ? _bacTitle : _groundTitle}",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20)),
                          value: _gardenGround,
                          onChanged: (bool value) {
                            setState(() {
                              _gardenGround = value;
                            });
                          },
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                                "${_gardenGround == false ? _bacParagraph : _groundParagraph}",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14))
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            "Garden's Visibility",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SwitchListTile(
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
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                                "${_gardenVisibility == false ? _privateParagraph : _publicParagraph}",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14))
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0, bottom: 10),
                          child: Text(
                            "Invite collaborators (Optional)",
                            style: TextStyle(fontSize: 20),
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
                                            '${_gardenNameController.text}', _gardenVisibility, _gardenMembers, double.parse(_gardenLengthController.text), double.parse(_gardenWidthController.text), _gardenGround),
                                      );
                                    } else {
                                      setState(() {

                                        _gardenNameController.text.isEmpty
                                            ? _gardenNameValidate = true
                                            : _gardenNameValidate = false;

                                        _gardenLengthController.text.isEmpty
                                            ? _gardenLengthValidate = true
                                            : _gardenLengthValidate = false;

                                        _gardenWidthController.text.isEmpty
                                            ? _gardenWidthValidate = true
                                            : _gardenWidthValidate = false;
                                      });
                                    }
                                  },
                                  child: Text(
                                    "Create my garden",
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
          } else {
            return Scaffold(
                appBar: AppBar(
                  title: Text("Create your garden"),
                ),
                body: Padding(
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
                          controller: _gardenNameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter a Garden's name",
                            errorText: _gardenNameValidate ? 'Value Can\'t Be Empty' : null,
                          ),
                          onChanged: (value) {
                            _gardenNameController.text.isEmpty
                                ? _gardenNameValidate = true
                                : _gardenNameValidate = false;
                            setState(() {});
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Garden's dimensions (meters)",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 10, right: 20),
                                  child: TextFormField(
                                      controller: _gardenLengthController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "Garden's length",
                                        errorText: _gardenLengthValidate ? 'Length Can\'t Be Empty' : null,
                                      ),
                                    onChanged: (value) {
                                        print(_gardenLengthController.text.isEmpty);
                                      _gardenLengthController.text.isEmpty
                                          ? _gardenLengthValidate = true
                                          : _gardenLengthValidate = false;
                                      setState(() {});
                                    },
                                  ),
                                )
                            ),
                            Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 10, left: 20),

                                  child: TextFormField(
                                      controller: _gardenWidthController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "Garden's width",
                                        errorText: _gardenWidthValidate ? 'Width Can\'t Be Empty' : null,
                                      ),
                                    onChanged: (value) {
                                      _gardenWidthController.text.isEmpty
                                          ? _gardenWidthValidate = true
                                          : _gardenWidthValidate = false;
                                      setState(() {});
                                    },
                                  ),
                                )
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Garden's Type",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SwitchListTile(
                          title: Text(
                              "${_gardenGround == false ? _bacTitle : _groundTitle}",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20)),
                          value: _gardenGround,
                          onChanged: (bool value) {
                            setState(() {
                              _gardenGround = value;
                            });
                          },
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                                "${_gardenGround == false ? _bacParagraph : _groundParagraph}",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14))
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            "Garden's Visibility",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SwitchListTile(
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
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                                "${_gardenVisibility == false ? _privateParagraph : _publicParagraph}",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14))
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0, bottom: 10),
                          child: Text(
                            "Invite collaborators (Optional)",
                            style: TextStyle(fontSize: 20),
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
                                          '${_gardenNameController.text}', _gardenVisibility, _gardenMembers, double.parse(_gardenLengthController.text), double.parse(_gardenWidthController.text), _gardenGround),
                                    );
                                  } else {
                                    setState(() {

                                      _gardenNameController.text.isEmpty
                                          ? _gardenNameValidate = true
                                          : _gardenNameValidate = false;

                                      _gardenLengthController.text.isEmpty
                                          ? _gardenLengthValidate = true
                                          : _gardenLengthValidate = false;

                                      _gardenWidthController.text.isEmpty
                                          ? _gardenWidthValidate = true
                                          : _gardenWidthValidate = false;
                                    });
                                  }
                                },
                                child: Text(
                                  "Create my garden",
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
