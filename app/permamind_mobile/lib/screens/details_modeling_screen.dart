import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind_mobile/arch_bricks/arch_bricks.dart';
import 'package:permamind_mobile/blocs/blocs.dart';
import 'package:permamind_mobile/screens/screens.dart';
import 'package:data_repository/data_repository.dart';


typedef SaveGardenCallback = Function(String gardenName, bool publicVisibility);

class DetailsModelingScreen extends StatelessWidget {

  final SaveGardenCallback onSaveGarden;

  DetailsModelingScreen({@required this.onSaveGarden});

  @override
  Widget build(BuildContext context) {
    final gardensBloc = BlocProvider.of<GardensBloc>(context);
    final localizations = ArchSampleLocalizations.of(context);

    final DetailsModelingsScreenArguments args =
        ModalRoute.of(context).settings.arguments;

        return Scaffold(
          appBar: AppBar(
           title: Text("${args.gardenName}"),
          ),
          body: Container(
            child: Column(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: Container(
                      color: Colors.lightGreenAccent,
                      margin: const EdgeInsets.only(top: 10, left: 40, right: 40),
//                      width: MediaQuery.of(context).size.width,
                      child: Container()),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                      color: Colors.indigoAccent,
                      margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Text('Planning',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 20))),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                      color: Colors.yellow,
                      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: Container(
                                color: Colors.red,
                                child: Text('J',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20))),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                                color: Colors.red,
                                child: Text('F',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20))),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                                color: Colors.red,
                                child: Text('M',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20))),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                                color: Colors.red,
                                child: Text('A',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20))),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                                color: Colors.red,
                                child: Text('M',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20))),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                                color: Colors.red,
                                child: Text('J',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20))),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                                color: Colors.red,
                                child: Text('J',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20))),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                                color: Colors.red,
                                child: Text('A',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20))),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                                color: Colors.red,
                                child: Text('S',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20))),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                                color: Colors.red,
                                child: Text('O',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20))),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                                color: Colors.red,
                                child: Text('N',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20))),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                                color: Colors.red,
                                child: Text('D',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 20))),
                          ),
                        ],
                      )),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                      color: Colors.indigoAccent,
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Text('Features',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 20))),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
//                      color: Colors.yellow,
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: Container(
                              color: Colors.tealAccent,
                              child: Column(
//                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                        color: Colors.lightBlueAccent,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Text('Name',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20))),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                        color: Colors.lightBlueAccent,
                                        width: MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.only(top: 10),

                                        child: Text('${args.modeling.modelingName}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16))),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              color: Colors.tealAccent,
                              child: Column(
//                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                        color: Colors.lightBlueAccent,
                                        width: MediaQuery.of(context).size.width,
                                        child: Text('Duration',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20))),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                      padding: EdgeInsets.only(top: 10),
                                        color: Colors.lightBlueAccent,
                                        width: MediaQuery.of(context).size.width,
                                        child: Text('${args.modeling.modelingAverageDuration} weeks',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16))),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: Container(
                              color: Colors.tealAccent,
                              child: Column(
//                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                        color: Colors.lightBlueAccent,
                                        width: MediaQuery.of(context).size.width,
                                        child: Text('Season',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20))),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Row(
                                      children: <Widget>[
                                        Flexible(
                                          flex: 2,
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.brightness_high ,
                                                color: Colors.black,
                                                size: MediaQuery.of(context).size.width / 9,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              color: Colors.tealAccent,
                              child: Column(
                                children: <Widget>[
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                        color: Colors.lightBlueAccent,
                                        width:
                                        MediaQuery.of(context).size.width,
                                        child: Text('Difficulty level',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20))),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Row(
                                      children: <Widget>[
                                        Flexible(
                                          flex: 2,
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.star ,
                                                color: Colors.black,
                                                size: MediaQuery.of(context).size.width / 9,
                                              )
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.star_half ,
                                                color: Colors.black,
                                                size: MediaQuery.of(context).size.width / 9,
                                              )
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.star_border ,
                                                color: Colors.black,
                                                size: MediaQuery.of(context).size.width / 9,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
//                      color: Colors.yellow,
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: Container(
                              color: Colors.tealAccent,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                        color: Colors.lightBlueAccent,
                                        width:
                                        MediaQuery.of(context).size.width,
                                        child: Text('Yield',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20))),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Row(
                                      children: <Widget>[
                                        Flexible(
                                          flex: 2,
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.star ,
                                                color: Colors.black,
                                                size: MediaQuery.of(context).size.width / 9,
                                              )
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.star_border ,
                                                color: Colors.black,
                                                size: MediaQuery.of(context).size.width / 9,
                                              )
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.star_border ,
                                                color: Colors.black,
                                                size: MediaQuery.of(context).size.width / 9,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              color: Colors.tealAccent,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                        color: Colors.lightBlueAccent,
                                        width:
                                        MediaQuery.of(context).size.width,
                                        child: Text('Composition',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20))),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Row(
                                      children: <Widget>[
                                        Flexible(
                                          flex: 2,
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.local_florist ,
                                                color: Colors.black,
                                                size: MediaQuery.of(context).size.width / 9,
                                              )
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.local_florist ,
                                                color: Colors.black,
                                                size: MediaQuery.of(context).size.width / 9,
                                              )
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.local_florist ,
                                                color: Colors.black,
                                                size: MediaQuery.of(context).size.width / 9,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            //TODO Changer la localisation et le tooltip
              key: ArchSampleKeys.editTodoFab,
              tooltip: localizations.editTodo,
              child: Icon(Icons.local_florist),
              onPressed: args.modeling == null
                  ? null
                  : () {
//                      Navigator.of(context)
//                          .push(MaterialPageRoute(builder: (context) {
////                        return AddEditScreen(
////                          key: ArchSampleKeys.editGardenScreen,
////                          onSave: (task, note) {
////                            gardensBloc.dispatch(UpdateGarden(
////                              modeling.copyWith(modelingId: modeling.modelingId, note: note),
////                            ));
////                          },
////                          isEditing: true,
////                          garden: modeling,
////                        );
//                      }));
                onSaveGarden(args.gardenName, args.publicVisibility);
                Navigator.pushNamedAndRemoveUntil(context, ArchSampleRoutes.home, (_) => false);

              }),
        );
  }
}

class DetailsModelingsScreenArguments {
  final Modeling modeling;
  final String gardenName;
  final bool publicVisibility;

//  final SaveGardenCallback onSaveGarden;

  DetailsModelingsScreenArguments({Key key, @required this.modeling,
    @required this.gardenName,
    @required this.publicVisibility,
//    @required this.onSaveGarden,
  });
}