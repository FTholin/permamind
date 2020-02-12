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
        title: Text('${args.gardenName}'),
      ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: mediaHeight * 230 / 896,
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
                  height: mediaHeight * 50 / 896,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    child: Center(
                      child: Text(
                          "${args.modeling.composition.join(" - ")}",
                          style: TextStyle(
                              color: const Color(0xFF01534F),
                              fontWeight: FontWeight.bold,
                              fontSize: 19)
                      ),
                    )
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF01534F), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Container(
                    height: mediaHeight * 65 / 896,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        child: _buildModelingSchedule(
                            mediaHeight,
                            mediaWidth,
                            args.modeling.culturePeriod,
                            args.modeling.sowingPeriod,
                            args.modeling.harvestPeriod
                        ),
                    ),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF01534F), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: mediaHeight * 70 / 896,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: Center(
                                        child: Container(
                                          height: mediaHeight * 27 / 896,
                                          width:  mediaWidth * 27 / 414,
                                          padding: EdgeInsets.all(12),
                                          decoration: new BoxDecoration(
                                            color: Colors.yellow,
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 2,
                                      child: Center(
                                        child: Text(
                                            "Sowing period",
                                            style: TextStyle(
                                                color: const Color(0xFF01534F),
                                                fontSize: 14)
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: Center(
                                        child: Container(
                                          height: mediaHeight * 27 / 896,
                                          width:  mediaWidth * 27 / 414,
                                          padding: EdgeInsets.all(12),
                                          decoration: new BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 2,
                                      child: Center(
                                        child: Text(
                                            "Harvest period",
                                            style: TextStyle(
                                                color: const Color(0xFF01534F),
                                                fontSize: 14)
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(height: mediaHeight * 40 / 896, child: VerticalDivider(color: const Color(0xFF01534F))),
                      Expanded(
                        child: Container(
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
                                                  color: const Color(0xFF01534F),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 19)
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                              "${args.modeling.productionDuration} months",
                                              style: TextStyle(
                                                  color: const Color(0xFF01534F),
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
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF01534F), width: 2.5),
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                ),
              ),






//              Padding(
//                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 90),
//                child: Container(
//                  height: mediaHeight * 70 / 896,
//                  child: Row(
//                    children: <Widget>[
//                      Expanded(
//
//                      ),
//                    ],
//                  ),
//                  decoration: BoxDecoration(
//                    border: Border.all(color: const Color(0xFF01534F), width: 2.5),
//                    borderRadius: BorderRadius.all(Radius.circular(18)),
//                  ),
//                ),
//              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Container(
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
                                                color: const Color(0xFF01534F),
                                                fontWeight: FontWeight.bold,
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
                        Container(height: mediaHeight * 40 / 896, child: VerticalDivider(color: const Color(0xFF01534F))),
                        Expanded(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Center(
                                    child: Text(
                                        "Yield",
                                        style: TextStyle(
                                            color: const Color(0xFF01534F),
                                            fontWeight: FontWeight.bold,
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
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF01534F), width: 2.5),
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Container(
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
                                          color: const Color(0xFF01534F),
                                          fontWeight: FontWeight.bold,
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
                      Container(height: mediaHeight * 40 / 896, child: VerticalDivider(color: const Color(0xFF01534F))),
                      Expanded(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Center(
                                  child: Text(
                                      "Water",
                                      style: TextStyle(
                                          color: const Color(0xFF01534F),
                                          fontWeight: FontWeight.bold,
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
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF01534F), width: 2.5),
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                ),
              ),
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        //TODO Changer la localisation et le tooltip
          key: ArchSampleKeys.editTodoFab,
          child: Icon(Icons.check, color: Colors.white,),
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
      BoxDecoration monthSpot;
      Color textMonthColor;

      if (sowingPeriod.contains(i)) {
        monthSpot = new BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(15),
        );

        textMonthColor = Colors.white;
      } else if (harvestPeriod.contains(i)) {
        monthSpot = new BoxDecoration(
          color: Colors.deepOrangeAccent,
          borderRadius: BorderRadius.circular(15),
        );
        textMonthColor = Colors.white;

      } else if (culturePeriod.contains(i)) {
        monthSpot = new BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(15),
        );
        textMonthColor = Colors.white;

      } else {
        monthSpot = new BoxDecoration(
          border: Border.all(color: const Color(0xFF01534F)),
          borderRadius: BorderRadius.circular(15),
        );
        textMonthColor = const Color(0xFF01534F);
      }

      monthsBoxList.add(
        Expanded(
          child: Container(
            color: culturePeriod.contains(i) ? const Color(0xFF01534F) : Colors.white,
            child: Center(
              child: Container(
                height: mediaHeight * 30 / 896,
                width:  mediaWidth * 30 / 414,
//                padding: EdgeInsets.all(12),
                decoration: monthSpot,
                child: Center(
                    child: Text(
                      '${months[i]}',
                      style: TextStyle(fontSize: mediaHeight * 20 / 896, color: textMonthColor),
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
                color: const Color(0xFF01534F),
                size: MediaQuery.of(context).size.width / 14,
              )
          )
    );
    } else {
      notationsRowItems.add(
          Expanded(
              child: Icon(
                Icons.star_border ,
                color: const Color(0xFF01534F),
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

