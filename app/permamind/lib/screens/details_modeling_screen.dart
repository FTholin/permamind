import 'package:arch/arch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:data_repository/data_repository.dart';
import 'package:permamind/screens/screens.dart';

class DetailsModelingScreen extends StatelessWidget {

  final Parcel parcel;
  final Modeling modeling;
  final List<ModelingSchedule> schedule;
  final String gardenId;
  final List<Design> designs;
  final List<String> veggiesList;

  DetailsModelingScreen({
    Key key,
    @required this.gardenId,
    @required this.parcel,
    @required this.modeling,
    @required this.schedule,
    @required this.designs,
    @required this.veggiesList
  }): assert(parcel != null), assert(modeling != null), assert(schedule != null), assert(designs != null), assert(gardenId != null);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RaisedButton.icon(
                elevation: 0,
                color: Colors.white,
                icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black,),
                label: Text(
                    "Retour",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 2.2 * SizeConfig.textMultiplier
                    )
                ),
                onPressed: () {
//                  BlocProvider.of<ModelingsBloc>(context).add(FetchVeggies(veggiesList));
                  Navigator.of(context).pop();
                },
              ),
               Flexible(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: <Widget>[
                     Flexible(
                         flex: 5,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: <Widget>[
                             Flexible(
                                 flex: 1,
                                 child: Container(
                                   decoration: BoxDecoration(
                                     color: Color.fromRGBO(214, 211, 94, 1),
                                     borderRadius:
                                     BorderRadius.all(
                                         Radius.circular(5)),
                                   ),
                                   height: 4.5 *
                                       SizeConfig.heightMultiplier,
                                   child: Padding(
                                     padding: EdgeInsets.all(6),
                                     child: Text("${modeling.name}",
                                         maxLines: 2,
                                         textAlign:
                                         TextAlign.left,
                                         style: TextStyle(
                                           color: const Color(0xFF01534F),
                                           fontSize: 2.2 *
                                               SizeConfig
                                                   .textMultiplier,
                                         )),
                                   ),)
                             ),
                             // TODO Mettre du texte scrollable ici
                             Flexible(
                               flex: 5,
                               child: Container(
                               color: Colors.pink,
                                   child: Text("On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. L'avantage du Lorem Ipsum sur un texte générique comme 'Du texte.",
                                       maxLines: 10,
//                                   textAlign: TextAlign.center,
                                       style: TextStyle(
                                         color: const Color(0xFF01534F),
                                         fontSize: 2 *
                                             SizeConfig
                                                 .textMultiplier,

                                       ))
                               ),
                             ),

                             Flexible(
                               flex: 3,
                               child: Container(
//                                 color: Colors.orange,
                                 child: ListView.builder(
                                     scrollDirection:
                                     Axis.horizontal,
                                     itemCount: modeling.composition.length,
                                     itemBuilder: (context, index) {
                                       return Container(
                                         width: 22 *
                                             SizeConfig
                                                 .widthMultiplier,
                                         child: Card(
                                           color: const Color(
                                               0xFFE6F1D9),
                                           child: Column(
//                                                        mainAxisAlignment: MainAxisAlignment.center,
                                             children: <Widget>[
                                               Flexible(
                                                 flex: 1,
                                                 child: Container(),
                                               ),
                                               Flexible(
                                                 flex: 4,
                                                 child: Image.asset(
                                                   "assets/utils_image/tree.png",
                                                   fit: BoxFit
                                                       .scaleDown,
                                                 ),
                                               ),
                                               Flexible(
                                                   flex: 3,
                                                   child: Center(
                                                     child: Text(
                                                         "${modeling.composition[index]}",
                                                         textAlign:
                                                         TextAlign
                                                             .center,
                                                         style:
                                                         TextStyle(
                                                           color: const Color(
                                                               0xFF01534F),
                                                           fontSize: 1.4 *
                                                               SizeConfig
                                                                   .textMultiplier,
                                                           fontWeight:
                                                           FontWeight
                                                               .bold,
                                                         )),
                                                   ))
                                             ],
                                           ),
                                         ),
                                       );
                                     }),
                               ),
                             ),

                             Flexible(
                               flex: 2,
                               child: Container(
                                 decoration: BoxDecoration(
                                   color: const Color(
                                       0xFFE6F1D9),
                                   borderRadius: BorderRadius.all(
                                       Radius.circular(8)),
                                 ),
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: <Widget>[
                                     Flexible(
                                         flex: 1,
                                         child: Padding(
                                           padding: EdgeInsets.all(1),
                                           child: Padding(
                                             padding: EdgeInsets.all(5),
                                             child: Row(
//                                               mainAxisAlignment: MainAxisAlignment.start,
                                               children: <Widget>[
                                                 Container(
                                                   height: 3 * SizeConfig.heightMultiplier,
                                                   width:  25 * SizeConfig.widthMultiplier,
                                                   child: Row(
                                                     //                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                     children: <Widget>[
                                                       Flexible(
                                                           flex: 1,
                                                           child: Padding(
                                                             padding: EdgeInsets.all(2),
                                                             child: Container(
                                                               decoration: BoxDecoration(
                                                                 color: Colors.amber,
                                                                 borderRadius: BorderRadius.all(
                                                                     Radius.circular(8)),
                                                               ),
                                                             ),
                                                           )
                                                       ),
                                                       Flexible(
                                                           flex: 3,
                                                           child: Center(
                                                             child: Text(
                                                                 "Semi",
                                                                 textAlign:
                                                                 TextAlign
                                                                     .center,
                                                                 style:
                                                                 TextStyle(
                                                                   color: const Color(
                                                                       0xFF01534F),
                                                                   fontSize: 1.7 *
                                                                       SizeConfig
                                                                           .textMultiplier,
                                                                 )),
                                                           ))
                                                     ],
                                                   ),
                                                 ),
                                                 Container(
//                                                   color: Colors.white,
                                                   height: 3 * SizeConfig.heightMultiplier,
                                                   width: 25 * SizeConfig.widthMultiplier,
                                                   child: Row(
//                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                     children: <Widget>[
                                                       Flexible(
                                                           flex: 1,
                                                           child: Padding(
                                                             padding: EdgeInsets.all(2),
                                                             child: Container(
                                                               decoration: BoxDecoration(
                                                                 color: Colors.green,
                                                                 borderRadius: BorderRadius.all(
                                                                     Radius.circular(8)),
                                                               ),
                                                             ),
                                                           )
                                                       ),
                                                       Flexible(
                                                           flex: 3,
                                                           child: Center(
                                                             child: Text(
                                                                 "Récolte",
                                                                 textAlign:
                                                                 TextAlign
                                                                     .center,
                                                                 style:
                                                                 TextStyle(
                                                                   color: const Color(
                                                                       0xFF01534F),
                                                                   fontSize: 1.7 *
                                                                       SizeConfig
                                                                           .textMultiplier,
                                                                 )),
                                                           ))
                                                     ],
                                                   ),
                                                 ),
                                               ],
                                             ),
                                           ),
                                         )
                                     ),
                                     Flexible(
                                       flex: 1,
                                       child: Container(
//                                         color: Colors.yellow,
                                         child: Padding(
                                             padding: EdgeInsets.all(5),
                                             child: _buildModelingSchedule(
                                                 modeling.culturePeriod,
                                                 modeling.sowingPeriod,
                                                 modeling.harvestPeriod)
                                         ),
                                       ),
                                     )
                                   ],
                                 ),
                               ),
                             ),

                             Flexible(
                               flex: 2,
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: <Widget>[
                                   Flexible(
                                     flex: 12,
                                     child: Container(
                                       decoration: BoxDecoration(
                                         color: const Color(
                                             0xFFE6F1D9),
                                         borderRadius: BorderRadius.all(
                                             Radius.circular(8)),
                                       ),
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: <Widget>[
                                           Flexible(
                                               flex: 1,
                                               child: Padding(
                                                 padding: EdgeInsets.only(left: 10),
                                                 child: Text(
                                                     "Difficulté",
                                                     textAlign:
                                                     TextAlign.left,
                                                     style:
                                                     TextStyle(
                                                       color: const Color(
                                                           0xFF01534F),
                                                       fontSize: 2.3 *
                                                           SizeConfig
                                                               .textMultiplier,
                                                     )),
                                               )
                                           ),
                                           Flexible(
                                             flex: 1,
                                             child: Padding(
                                               padding: EdgeInsets.only(top: 7, left: 5, right: 7),
                                               child: _buildModelingNotation(context,modeling.difficultyLevel),
                                             )
                                           )
                                         ],
                                       ),
                                     ),
                                   ),
                                   Flexible(
                                     flex: 1,
                                     child: Container(),
                                   ),
                                   Flexible(
                                     flex: 12,
                                     child: Container(
                                       decoration: BoxDecoration(
                                         color: Colors.green,
                                         borderRadius: BorderRadius.all(
                                             Radius.circular(8)),
                                       ),
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: <Widget>[
                                           Flexible(
                                               flex: 1,
                                               child: Padding(
                                                 padding: EdgeInsets.all(5),
                                                 child: Text(
                                                     "Rendement",
                                                     textAlign:
                                                     TextAlign.left,
                                                     style:
                                                     TextStyle(
                                                       color: const Color(
                                                           0xFF01534F),
                                                       fontSize: 2.3 *
                                                           SizeConfig
                                                               .textMultiplier,
                                                     )),
                                               )
                                           ),
                                           Flexible(
                                             flex: 2,
                                             child: Container(
                                               color: Colors.green,
                                             ),
                                           )
                                         ],
                                       ),
                                     ),
                                   )
                                 ],
                               )
                             ),
                             Flexible(
                               flex: 2,
                               child: Container(
                                 color: Colors.red,
                               ),
                             ),

                             Flexible(
                               flex: 2,
                               child: Container(
                                 color: Colors.red,
                               ),
                             ),
                           ],
                         )
                     ),
                   ],
                 ),
               )
            ],
          )
      ),
    );


//    return Scaffold(
//      appBar: AppBar(
//        title: Text('${parcel.name}'),
//      ),
//        body: Padding(
//          padding: EdgeInsets.all(20.0),
//          child: Column(
//            children: <Widget>[
//              Padding(
//                padding: EdgeInsets.symmetric(vertical: 10),
//                child: Container(
//                  height: mediaHeight * 230 / 896,
//                  child: Center(
//                    child: Image.asset(
//                      'assets/modelings/${modeling.name}.png',
//                      fit: BoxFit.cover,
//                    )
//                  )),
//              ),
//              Padding(
//                padding: EdgeInsets.symmetric(vertical: 5),
//                child: Container(
//                  height: mediaHeight * 50 / 896,
//                  child: ClipRRect(
//                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                    child: Center(
//                      child: Text(
//                          "${modeling.composition.join(" - ")}",
//                          style: TextStyle(
//                              color: const Color(0xFF01534F),
//                              fontWeight: FontWeight.bold,
//                              fontSize: 19)
//                      ),
//                    )
//                  ),
//                  decoration: BoxDecoration(
//                    border: Border.all(color: const Color(0xFF01534F), width: 2),
//                    borderRadius: BorderRadius.all(Radius.circular(18)),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.symmetric(vertical: 5),
//                child: Container(
//                    height: mediaHeight * 65 / 896,
//                    child: ClipRRect(
//                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                        child: _buildModelingSchedule(
//                            mediaHeight,
//                            mediaWidth,
//                            modeling.culturePeriod,
//                            modeling.sowingPeriod,
//                            modeling.harvestPeriod
//                        ),
//                    ),
//                  decoration: BoxDecoration(
//                    border: Border.all(color: const Color(0xFF01534F), width: 2),
//                    borderRadius: BorderRadius.all(Radius.circular(18)),
//                  ),
//                ),
//              ),
//
//              Padding(
//                padding: EdgeInsets.symmetric(vertical: 10),
//                child: Container(
//                  height: mediaHeight * 70 / 896,
//                  child: Row(
//                    children: <Widget>[
//                      Expanded(
//                        child: Container(
//                          child: Column(
//                            children: <Widget>[
//                              Expanded(
//                                child: Row(
//                                  children: <Widget>[
//                                    Flexible(
//                                      child: Center(
//                                        child: Container(
//                                          height: mediaHeight * 27 / 896,
//                                          width:  mediaWidth * 27 / 414,
//                                          padding: EdgeInsets.all(12),
//                                          decoration: new BoxDecoration(
//                                            color: Colors.yellow,
//                                            borderRadius: BorderRadius.circular(15),
//                                          ),
//                                        ),
//                                      ),
//                                    ),
//                                    Flexible(
//                                      flex: 2,
//                                      child: Center(
//                                        child: Text(
//                                            "${AppLocalizations.of(context).detailsModelingScreenSowingTitle}",
//                                            style: TextStyle(
//                                                color: const Color(0xFF01534F),
//                                                fontSize: 14)
//                                        ),
//                                      ),
//                                    ),
//
//                                  ],
//                                ),
//                              ),
//                              Expanded(
//                                child: Row(
//                                  children: <Widget>[
//                                    Flexible(
//                                      child: Center(
//                                        child: Container(
//                                          height: mediaHeight * 27 / 896,
//                                          width:  mediaWidth * 27 / 414,
//                                          padding: EdgeInsets.all(12),
//                                          decoration: new BoxDecoration(
//                                            color: Colors.red,
//                                            borderRadius: BorderRadius.circular(15),
//                                          ),
//                                        ),
//                                      ),
//                                    ),
//                                    Flexible(
//                                      flex: 2,
//                                      child: Center(
//                                        child: Text(
//                                            "  ${AppLocalizations.of(context).detailsModelingScreenHarvestTitle}",
//                                            style: TextStyle(
//                                                color: const Color(0xFF01534F),
//                                                fontSize: 14)
//                                        ),
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ],
//                          ),
//                        ),
//                      ),
//                      Container(height: mediaHeight * 40 / 896, child: VerticalDivider(color: const Color(0xFF01534F))),
//                      Expanded(
//                        child: Container(
//                          height: mediaHeight * 70 / 896,
//                          child: Row(
//                            children: <Widget>[
//                              Expanded(
//                                child: Container(
//                                  child: Column(
//                                    children: <Widget>[
//                                      Expanded(
//                                        child: Center(
//                                          child: Text(
//                                              "${AppLocalizations.of(context).detailsModelingScreenDurationTitle}",
//                                              style: TextStyle(
//                                                  color: const Color(0xFF01534F),
//                                                  fontWeight: FontWeight.bold,
//                                                  fontSize: 19)
//                                          ),
//                                        ),
//                                      ),
//                                      Expanded(
//                                        child: Center(
//                                          child: Text(
//                                              "${modeling.productionDuration} ${AppLocalizations.of(context).detailsModelingScreenMonthsLabel}",
//                                              style: TextStyle(
//                                                  color: const Color(0xFF01534F),
//                                                  fontSize: 14)
//                                          ),
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ),
//                            ],
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                  decoration: BoxDecoration(
//                    border: Border.all(color: const Color(0xFF01534F), width: 2.5),
//                    borderRadius: BorderRadius.all(Radius.circular(18)),
//                  ),
//                ),
//              ),
//
//              Padding(
//                padding: EdgeInsets.symmetric(vertical: 10),
//                child: Container(
//                  height: mediaHeight * 70 / 896,
//                    child: Row(
//                      children: <Widget>[
//                        Expanded(
//                          child: Container(
//                            child: Column(
//                              children: <Widget>[
//                                Expanded(
//                                    child: Center(
//                                      child: Text(
//                                          "${AppLocalizations.of(context).detailsModelingScreenDifficultyTitle}",
//                                          style: TextStyle(
//                                                color: const Color(0xFF01534F),
//                                                fontWeight: FontWeight.bold,
//                                                fontSize: 19)
//                                      ),
//                                    ),
//                                ),
//                                Expanded(
//                                  child: _buildModelingNotation(context, modeling.difficultyLevel),
//                                )
//                              ],
//                            ),
//                          ),
//                        ),
//                        Container(height: mediaHeight * 40 / 896, child: VerticalDivider(color: const Color(0xFF01534F))),
//                        Expanded(
//                          child: Container(
//                            child: Column(
//                              children: <Widget>[
//                                Expanded(
//                                  child: Center(
//                                    child: Text(
//                                        "${AppLocalizations.of(context).detailsModelingScreenYieldTitle}",
//                                        style: TextStyle(
//                                            color: const Color(0xFF01534F),
//                                            fontWeight: FontWeight.bold,
//                                            fontSize: 19)
//                                    ),
//                                  ),
//                                ),
//                                Expanded(
//                                  child: _buildModelingNotation(context, modeling.difficultyLevel),
//                                )
//                              ],
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  decoration: BoxDecoration(
//                    border: Border.all(color: const Color(0xFF01534F), width: 2.5),
//                    borderRadius: BorderRadius.all(Radius.circular(18)),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.symmetric(vertical: 10),
//                child: Container(
//                  height: mediaHeight * 70 / 896,
//                  child: Row(
//                    children: <Widget>[
//                      Expanded(
//                        child: Container(
//                          child: Column(
//                            children: <Widget>[
//                              Expanded(
//                                child: Center(
//                                  child: Text(
//                                      "${AppLocalizations.of(context).detailsModelingScreenSunlightTitle}",
//                                      style: TextStyle(
//                                          color: const Color(0xFF01534F),
//                                          fontWeight: FontWeight.bold,
//                                          fontSize: 19)
//                                  ),
//                                ),
//                              ),
//                              Expanded(
//                                child: _buildModelingNotation(context, modeling.sunlightRequirement),
//                              )
//                            ],
//                          ),
//                        ),
//                      ),
//                      Container(height: mediaHeight * 40 / 896, child: VerticalDivider(color: const Color(0xFF01534F))),
//                      Expanded(
//                        child: Container(
//                          child: Column(
//                            children: <Widget>[
//                              Expanded(
//                                child: Center(
//                                  child: Text(
//                                      "${AppLocalizations.of(context).detailsModelingScreenWaterTitle}",
//                                      style: TextStyle(
//                                          color: const Color(0xFF01534F),
//                                          fontWeight: FontWeight.bold,
//                                          fontSize: 19)
//                                  ),
//                                ),
//                              ),
//                              Expanded(
//                                child: _buildModelingNotation(context, modeling.waterRequirement),
//                              )
//                            ],
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                  decoration: BoxDecoration(
//                    border: Border.all(color: const Color(0xFF01534F), width: 2.5),
//                    borderRadius: BorderRadius.all(Radius.circular(18)),
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ),
//      floatingActionButton: FloatingActionButton(
//          child: Icon(Icons.check, color: Colors.white,),
//          onPressed: modeling == null
//              ? null
//              : () async {
//
//              Parcel alteredParcel = parcel.copyWith(
//                  name: parcel.name, gardenId: parcel.gardenId, length: parcel.length, width: parcel.width, parcelGround: parcel.parcelGround,
//                  publicVisibility:parcel.publicVisibility , admin:parcel.admin , members:parcel.members, currentModelingId: modeling.id,
//                  currentModelingName: modeling.composition.join("-"), creationDate: parcel.creationDate, dayActivitiesCount: schedule.isNotEmpty ? schedule[0].dayActivities.length : 0,
//                  modelingsMonitoring: [modeling.id], id: parcel.id);
//
//              BlocProvider.of<GardensBloc>(context).add(ParcelUpdated(alteredParcel));
//              BlocProvider.of<GardensBloc>(context).add(ModelingAdded(gardenId, parcel.id, schedule));
//              BlocProvider.of<GardensBloc>(context).add(DesignParcelAdded(gardenId, parcel.id, designs));
//
//              Navigator.pushNamedAndRemoveUntil(
//                context,
//                '/detailsGarden',
//                (Route<dynamic> route) => false,
//                arguments: DetailsParcelScreenArguments(
//                    gardenId,
//                    parcel.id
//                ),
//              );
//
//          }),
//
//    );

  }

  Widget _buildModelingSchedule(
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
          borderRadius: BorderRadius.circular(3),
        );

        textMonthColor = Colors.white;
      } else if (harvestPeriod.contains(i)) {
        monthSpot = new BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(3),
        );
        textMonthColor = Colors.white;

      }  else {
        monthSpot = new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
        );
        textMonthColor = Colors.black;
      }

      monthsBoxList.add(

//        Expanded(
//          child: Container(
//            color: culturePeriod.contains(i) ? const Color(0xFF01534F) : Colors.white,
//            child: Center(
//              child: Container(
//                height: 20,
//                width: 200,
////                padding: EdgeInsets.all(12),
//                decoration: monthSpot,
//                child: Center(
//                    child: Text(
//                      '${months[i]}',
//                      style: TextStyle(fontSize: 1.7 * SizeConfig.textMultiplier, color: textMonthColor),
//                    )
//                ),
//              ),
//            ),
//          ),
//        ),
        Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: 2, right: 2),
              child: Container(
                width: 7 * SizeConfig.widthMultiplier,
                  decoration: monthSpot,
                  child: Center(
                  child: Text(
                    '${months[i]}',
                    style: TextStyle(fontSize: 2.6 * SizeConfig.textMultiplier, color: textMonthColor),
                  ),
                )
              ),
            )
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: monthsBoxList
    );
  }

}

Widget _buildModelingNotation(BuildContext context,
    int difficulty) {

  List<Widget> notationsRowItems = List<Widget>();

  for(var i = 1; i <= 5; i++) {
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



