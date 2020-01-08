import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/screens/screens.dart';
import 'package:data_repository/data_repository.dart';


typedef SaveGardenCallback = Function(String gardenName,
    bool publicVisibility,
    List<String> gardenMembers,
    String gardenModelisationId,
    String modelisationName,
    double gardenLength,
    double gardenWidth,
    bool gardenGround,
    List<PlanningDay> schedule);

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
           title: Text('${args.modeling.composition.join("-")}'),
          ),
          body: Container(
            child: Column(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildModelingImage(context, args.modeling.name),
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
                                        child: Text('Production duration',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 18))),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Container(
                                        color: Colors.lightBlueAccent,
                                        width: MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.only(top: 10),

                                        child: Text('${args.modeling.productionDuration} months',
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
                                    flex: 2,
                                    child: Container(
                                        color: Colors.lightBlueAccent,
                                        width: MediaQuery.of(context).size.width,
                                        child: Text('Difficulty Level',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 18))),
                                  ),
                                  _buildModelingNotation(context, args.modeling.difficultyLevel),
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
                                        child: Text('Sunlight requirements',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 18))),
                                  ),
                                  _buildModelingNotation(context, args.modeling.sunlightRequirement),
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
                                        child: Text('Water requiremements',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 18))),
                                  ),
                                  _buildModelingNotation(context, args.modeling.waterRequirement),
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
                                                fontSize: 18))),
                                  ),
                                  _buildModelingNotation(context, args.modeling.yield),
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
                                                fontSize: 18))),
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
                  : () async {
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
//                gardensBloc.d
                onSaveGarden(args.gardenName,
                    args.publicVisibility,
                    args.gardenMembers,
                    args.modeling.id,
                    args.modeling.composition.join("-"),
                    args.gardenLength,
                    args.gardenWidth,
                    args.gardenGround,
                    args.schedule);

                Navigator.pushNamedAndRemoveUntil(context, ArchSampleRoutes.home, (_) => false);

              }),
        );
  }
}

Widget _buildModelingNotation(BuildContext context, int difficulty) {
  Row notationsRowItems = Row(
    children: <Widget>[
    ],
  );

  for(var i = 1; i <= 3; i++) {
    if (i <= difficulty) {
      notationsRowItems.children.add( Flexible(
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
    );
    } else {
      notationsRowItems.children.add( Flexible(
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
      );
    }
  }
  return Flexible(
      child: notationsRowItems
  );
}

Widget _buildModelingImage(BuildContext context, String modelisationName) {

  return Flexible(
    flex: 3,
    child: Image.asset(
      'assets/modelings/$modelisationName.png',
      fit: BoxFit.cover,
    ),
  );
}

class DetailsModelingsScreenArguments {
  final Modeling modeling;
  final String gardenName;
  final bool publicVisibility;
  final List<String> gardenMembers;
  final List<PlanningDay> schedule;
  final double gardenLength;
  final double gardenWidth;
  final bool gardenGround;

//  final SaveGardenCallback onSaveGarden;

  DetailsModelingsScreenArguments({Key key,
    @required this.modeling,
    @required this.gardenName,
    @required this.gardenLength,
    @required this.gardenWidth,
    @required this.gardenGround,
    @required this.publicVisibility,
    @required this.gardenMembers,
    @required this.schedule
//    @required this.onSaveGarden,
  });
}

