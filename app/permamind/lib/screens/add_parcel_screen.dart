import 'package:arch/arch.dart';
import 'package:authentication/authentication.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/models/member_profile.dart';
import 'package:permamind/screens/screens.dart';

typedef AddParcelCallback = Function(String task, String note);

class AddParcelScreen extends StatefulWidget {

  final Garden garden;
  final User user;
  final DataRepository dataRepository;

  AddParcelScreen({
    Key key,
    @required this.dataRepository,
    @required this.garden,
    @required this.user,
  }) : assert(garden != null), super(key: key);

  @override
  _AddParcelScreenState createState() => _AddParcelScreenState();
}

class _AddParcelScreenState extends State<AddParcelScreen> {

  TextEditingController _parcelName = TextEditingController();


  int _currentStep = 0;
  bool _parcelGround = false;

  bool _parcelNameValidate = false;

  List<GardenMember> _parcelMembers = List<GardenMember>();

  List<MemberProfile> queryResProfile = List<MemberProfile>();

  String gardenLengthValue;

  String gardenWidthValue;

  @override
  void initState() {

    gardenLengthValue = lengths[2];
    gardenWidthValue = widths[1];

    for (final member in widget.garden.members) {
      if (member.id != widget.user.id) {
        _parcelMembers.add(member);
        queryResProfile.add(MemberProfile(
            member.id,
            member.pseudo
        ));
      }
    }
    super.initState();
  }


  final List<String> lengths = <String>[
    "80", "100", "200", "300"
  ];

  final List<String> widths = <String>[
    "60", "80", "100"
  ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: new AppBar(title: new Text('${AppLocalizations.of(context).addParcelTitle}')),
      body: new Stepper(
        type: StepperType.horizontal,
        currentStep: _currentStep,
        onStepTapped: (int step) => setState(() => _currentStep = step),
        controlsBuilder: _createEventControlBuilder,
        onStepContinue:
        _currentStep < 3 ? () => setState(() => _currentStep += 1) : null,
        onStepCancel:
        _currentStep > -1 ? () => setState(() => _currentStep -= 1) : null,
        steps: <Step>[
          new Step(
            title: new Text(''),
            content: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 30),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              '${AppLocalizations.of(context).addParcelNameTitle}',
//                    textAlign: TextAlign.left,
//                        overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 19),
                            )),
                        Container()
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: _parcelName,
                        decoration: InputDecoration(
//                        border: InputBorder.none,
                          hintText: '${AppLocalizations.of(context).addParcelNameHint}',
                          errorText: _parcelNameValidate
                              ? '${AppLocalizations.of(context).addParcelNameError}'
                              : null,
                        ),
                        onChanged: (value) {
                          _parcelName.text.isEmpty
                              ? _parcelNameValidate = true
                              : _parcelNameValidate = false;
                          setState(() {});
                        },
                      ),
                    )
                  ],
                )),
            isActive: _currentStep >= 0,
            state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
          ),
          new Step(
            title: new Text(''),
            content: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 30),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            '${AppLocalizations.of(context).addParcelGardenGroundTitle}',
                            style: TextStyle(fontSize: 19),
                          )),
                      Container()
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: true,
                        groupValue: _parcelGround,
                        onChanged: (bool value) {
                          setState(() {
                            _parcelGround = value;
                          });
                        },
                      ),
                      Text(
                        '${AppLocalizations.of(context).yesChoice}',
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: false,
                        groupValue: _parcelGround,
                        onChanged: (bool value) {
                          setState(() {
                            _parcelGround = value;
                          });
                        },
                      ),
                      Text(
                        '${AppLocalizations.of(context).noChoice}',
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            isActive: _currentStep >= 0,
            state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
          ),
          new Step(
            title: new Text(''),
            content: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 30),
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        '${AppLocalizations.of(context).addParcelDimensionTitle}',
                        maxLines: 3,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 19),
                      )),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          '${AppLocalizations.of(context).addParcelScaleLabel}',
                          textAlign: TextAlign.left,
//                        overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                      ),
                      Container()
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 10, right: 10),
                            child: DropdownButton<String>(
//                                      hint:  Text("Select length"),
                              value:  gardenLengthValue,
                              onChanged: (String value) {
                                setState(() {
                                  gardenLengthValue = value;
                                });
                              },
                              items: lengths.map((String value) {
                                return  DropdownMenuItem<String>(
                                  value: value,
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(width: 10,),
                                      Text(
                                        value,
                                        style:  TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          )
                      ),
                      Expanded(
                        child: Icon(
                          Icons.close,
//                          size: 36.0,
                        ),
                      ),
                      Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: DropdownButton<String>(
                                value:  gardenWidthValue,
                                onChanged: (String value) {
                                  setState(() {
                                    gardenWidthValue = value;
                                  });
                                },
                                items: widths.map((String value) {
                                  return  DropdownMenuItem<String>(
                                    value: value,
                                    child: Row(
                                      children: <Widget>[
                                        SizedBox(width: 10,),
                                        Text(
                                          value,
                                          style:  TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              )
                          )
                      ),
                    ],
                  ),
                ],
              ),
            ),
            isActive: _currentStep >= 0,
            state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
          ),
          new Step(
            title: new Text(''),
            content: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 30),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          '${AppLocalizations.of(context).settingsGardenFriendsTitle}',
                          textAlign: TextAlign.left,
//                        overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 19),
                        ),
                      ),
                      Container()
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          '${AppLocalizations.of(context).optionalTitle}',
                          textAlign: TextAlign.left,
//                        overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                      ),
                      Container()
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ChipsInput(
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
                      initialValue: queryResProfile,
                      findSuggestions: (String query) async {
                        queryResProfile = [];
                        if (query.length != 0) {
                          _parcelMembers = [];

                          var queryRes =
                          await widget.dataRepository.searchByName(query);
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
                        _parcelMembers.clear();
                        data.forEach((elem) {
                          if (elem.id != widget.user.id) {
                            _parcelMembers.add(
                                GardenMember(id: elem.id, pseudo: elem.pseudo));
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
                          materialTapTargetSize:
                          MaterialTapTargetSize.shrinkWrap,
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
                  )
                ],
              ),
            ),
            isActive: _currentStep >= 0,
            state: _currentStep >= 3 ? StepState.complete : StepState.disabled,
          ),
        ],
      ),
    );
  }

  Widget _createEventControlBuilder(BuildContext context,
      {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
    if (_currentStep == 3) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RaisedButton(onPressed: onStepCancel, child: Text('${AppLocalizations.of(context).backButton}')),
            RaisedButton(
                onPressed: () {

                  _parcelMembers.add(GardenMember(id: widget.user.id, pseudo: widget.user.pseudo));

                  final Parcel parcel = Parcel(_parcelName.text, widget.garden.id, double.parse(gardenLengthValue), double.parse(gardenWidthValue), _parcelGround, widget.garden.publicVisibility, '${widget.user.id}', _parcelMembers, '', '', DateTime.now(), 0, []);

                  BlocProvider.of<ParcelsBloc>(context).add(
                      ParcelAdded(
                          parcel
                      ));

                  Navigator.pushNamed(
                    context,
                    '/detailsGarden',
                    arguments: DetailsGardenScreenArguments(
                        widget.dataRepository,
                        widget.garden.id,
                        widget.user
                    ),
                  );


                },
                child: Text('${AppLocalizations.of(context).finalizeButton}')),
          ]);
    } else if (_currentStep == 0) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RaisedButton(onPressed: () {
              Navigator.pop(context);
            }, child:  Text('${AppLocalizations.of(context).backButton}')),
            RaisedButton(
                onPressed: () {
                  if (_parcelName.text.isNotEmpty) {
                    onStepContinue();
                  } else {
                    setState(() {
                      _parcelName.text.isEmpty
                          ? _parcelNameValidate = true
                          : _parcelNameValidate = false;
                    });
                  }
                },
                child:  Text('${AppLocalizations.of(context).continueButton}')),
          ]);
    } else {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RaisedButton(onPressed: onStepCancel, child:  Text('${AppLocalizations.of(context).backButton}')),
            RaisedButton(
                onPressed: onStepContinue, child:  Text('${AppLocalizations.of(context).continueButton}')),
          ]);
    }
  }
}