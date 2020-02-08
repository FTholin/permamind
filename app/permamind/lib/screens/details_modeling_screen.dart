import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/screens/screens.dart';
import 'package:data_repository/data_repository.dart';


typedef SaveGardenCallback = Function(String gardenName,
    bool publicVisibility,
    List<GardenMember> gardenMembers,
    String gardenModelisationId,
    String modelisationName,
    double gardenLength,
    double gardenWidth,
    bool gardenGround,
    List<ModelingSchedule> schedule
    );

class DetailsModelingScreen extends StatelessWidget {

  final SaveGardenCallback onSaveGarden;

  DetailsModelingScreen({@required this.onSaveGarden});

  @override
  Widget build(BuildContext context) {

    final DetailsModelingsScreenArguments args =
        ModalRoute.of(context).settings.arguments;


    final mediaWidth =  MediaQuery.of(context).size.width;
    final mediaHeight =  MediaQuery.of(context).size.height;

    print("width = $mediaWidth");
    print("height = $mediaHeight");


    return Scaffold(
      appBar: AppBar(
        title: Text('${args.modeling.composition.join('-')}'),
      ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  color: Colors.red,height: mediaHeight * 230 / 896,
                  child: Center(
                    child: Image.asset(
                      'assets/modelings/${args.modeling.name}.png',
                      fit: BoxFit.cover,
                    )
                  )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Container(
                    color: Colors.green,
                    height: mediaHeight * 65 / 896,
                    child: _buildModelingSchedule(
                      mediaHeight,
                      mediaWidth,
                      args.modeling.culturePeriod,
                      args.modeling.sowingPeriod,
                      args.modeling.harvestPeriod
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 90),
                child:Container(
                  color: Colors.purpleAccent,
                  height: mediaHeight * 70 / 896,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Container(
                    color: Colors.green,
                  height: mediaHeight * 70 / 896,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                    child: Center(
                                      child: Text(
                                          "Difficulty",
                                          style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 19)
                                      ),
                                    ),
                                ),
                                Expanded(
                                  child: _buildModelingNotation(context, args.modeling.difficultyLevel),
                                )
                              ],
                            ),
                          ),
                        ),
                        VerticalDivider(),
                        Expanded(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Center(
                                    child: Text(
                                        "Yield",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 19)
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: _buildModelingNotation(context, args.modeling.difficultyLevel),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  color: Colors.green,
                  height: mediaHeight * 70 / 896,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Center(
                                  child: Text(
                                      "Sun",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 19)
                                  ),
                                ),
                              ),
                              Expanded(
                                child: _buildModelingNotation(context, args.modeling.sunlightRequirement),
                              )
                            ],
                          ),
                        ),
                      ),
                      VerticalDivider(),
                      Expanded(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Center(
                                  child: Text(
                                      "Water",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 19)
                                  ),
                                ),
                              ),
                              Expanded(
                                child: _buildModelingNotation(context, args.modeling.waterRequirement),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 90),
                child: Container(
                  color: Colors.green,
                  height: mediaHeight * 70 / 896,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Center(
                                  child: Text(
                                      "Duration",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 19)
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                      "${args.modeling.productionDuration} months",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        //TODO Changer la localisation et le tooltip
          key: ArchSampleKeys.editTodoFab,
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
            onSaveGarden(
                args.gardenName,
                args.publicVisibility,
                args.gardenMembers,
                args.modeling.id,
                args.modeling.composition.join("-"),
                args.gardenLength,
                args.gardenWidth,
                args.gardenGround,
                args.schedule
            );

            Navigator.pushNamedAndRemoveUntil(context, ArchSampleRoutes.home, (_) => false);

          }),

    );

  }

  Widget _buildModelingSchedule(
      double mediaHeight,
      double mediaWidth,
      List<int> culturePeriod,
      List<int> sowingPeriod,
      List<int> harvestPeriod) {

    // TODO Faire plus propre dans un fichier central pour l'internationalisation
    List<String> months = ["J","F","M","A","M","J","J","A","S","O","N","D"];

    List<Widget> monthsBoxList = List<Widget>();
    for (int i = 0; i < months.length; i++) {
      Color monthColor;

      if (sowingPeriod.contains(i)) {
        monthColor = Colors.yellow;
      } else if (harvestPeriod.contains(i)) {
        monthColor = Colors.red;
      } else if (culturePeriod.contains(i)) {
        monthColor = Colors.blue;
      } else {
        monthColor = Colors.black;
      }

      monthsBoxList.add(
        Expanded(
          child: Container(
            color: culturePeriod.contains(i) ? Colors.green : Colors.black,
            child: Center(
              child: Container(
                height: mediaHeight * 30 / 896,
                width:  mediaWidth * 30 / 414,
//                padding: EdgeInsets.all(12),
                decoration: new BoxDecoration(
                  color: monthColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                    child: Text(
                      '${months[i]}',
                      style: TextStyle(fontSize: mediaHeight * 20 / 896, color: Colors.white),
                    )
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Row(
      children: monthsBoxList
    );
  }

}

Widget _buildModelingNotation(BuildContext context,
    int difficulty) {

  List<Widget> notationsRowItems = List<Widget>();

  for(var i = 1; i <= 3; i++) {
    if (i <= difficulty) {
      notationsRowItems.add(
          Expanded(
              child:  Icon(
                Icons.star ,
                color: Colors.black,
                size: MediaQuery.of(context).size.width / 14,
              )
          )
    );
    } else {
      notationsRowItems.add(
          Expanded(
              child: Icon(
                Icons.star_border ,
                color: Colors.black,
                size: MediaQuery.of(context).size.width / 14,
              )
          )
      );
    }
  }

  return Row(
      children: notationsRowItems
  );

}

Widget _buildModelingImage(BuildContext context, String modelingName) {
  return Image.asset(
      'assets/modelings/$modelingName.png',
      fit: BoxFit.cover,
    );
}

class DetailsModelingsScreenArguments {
  final Modeling modeling;
  final String gardenName;
  final bool publicVisibility;
  final List<GardenMember> gardenMembers;
  final List<ModelingSchedule> schedule;
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

