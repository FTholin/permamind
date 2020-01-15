
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/arch_bricks/keys.dart';
import 'package:permamind/blocs/blocs.dart';


class SettingsGardenScreen extends StatefulWidget {
  final bool isEditing;
  final String id;

  SettingsGardenScreen(
      {Key key,
        @required this.isEditing,
        @required this.id})
      : super(key: key ?? ArchSampleKeys.addTodoScreen);


  @override
  _SettingsGardenScreenState createState() => _SettingsGardenScreenState();
}


class _SettingsGardenScreenState extends State<SettingsGardenScreen> {


  final TextEditingController _newGardenNameController = TextEditingController();

  bool _newGardenNameValidate = false;

  Widget build(BuildContext context) {


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
//                          hintText: "${garden.name}",
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
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: ButtonTheme(
                            minWidth: 200.0,
                            height: 50.0,
//                            buttonColor: state.theme.accentColor,
                            child: RaisedButton(
                                onPressed: () {
                                  if (_newGardenNameController.text.isNotEmpty) {
//                                    Navigator.pushNamed(
//                                      context,
//                                      ArchSampleRoutes.discoverModelings,
//                                      arguments: ModelingsScreenArguments(
//                                          '${_gardenNameController.text}', _gardenVisibility, _gardenMembers, double.parse(_gardenLengthController.text), double.parse(_gardenWidthController.text), _gardenGround),
//                                    );


                                  // TODO Apporter toutes les modif ici
                                  BlocProvider.of<GardensBloc>(context).add(
                                    UpdateGarden(
                                      garden.copyWith(name: _newGardenNameController.text),
                                    ),
                                  );

                                  Navigator.pop(context, false);

                                  } else {
                                    setState(() {

                                      _newGardenNameController.text.isEmpty
                                          ? _newGardenNameValidate = true
                                          : _newGardenNameValidate = false;

                                    });
                                  }
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
                            buttonColor: Colors.red,
                            minWidth: 200.0,
                            height: 50.0,
//                            buttonColor: state.theme.accentColor,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.pop(context, garden);
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