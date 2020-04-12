import 'package:arch/arch.dart';
import 'package:authentication/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:data_repository/data_repository.dart';
import 'package:permamind/screens/screens.dart';
import 'package:uuid/uuid.dart';

class DetailsModelingScreen extends StatelessWidget {

  final Parcel parcel;
  final Modeling modeling;
  final String gardenId;
  final Map<String, Vegetable> veggiesComposition;
  final User user;

  DetailsModelingScreen({
    Key key,
    @required this.user,
    @required this.gardenId,
    @required this.parcel,
    @required this.modeling,
    @required this.veggiesComposition
  }): assert(user != null), assert(parcel != null), assert(modeling != null), assert(gardenId != null);

  @override
  Widget build(BuildContext context) {

    final parcelsBloc = BlocProvider.of<ParcelsBloc>(context);

    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RaisedButton.icon(
                elevation: 0,
                // TODO
                color: Color(0xFFF9F9F9),
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
//                               color: Colors.pink,
                                   child: Text("${modeling.descriptionFr}",
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
                                                   "assets/veggies/${veggiesComposition[modeling.composition[index]].imageName}.png",
                                                   fit: BoxFit
                                                       .scaleDown,
                                                 ),
                                               ),
                                               Flexible(
                                                   flex: 3,
                                                   child: Center(
                                                     child: Text(
                                                         "${veggiesComposition[modeling.composition[index]].nameFr}",
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
                                             child: _buildModelingSchedule(modeling.sowingPeriod, Colors.amber
                                         ),
                                       ),
                                     ),
                                     )
                                   ],
                                 ),
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
                                           child: _buildModelingSchedule(modeling.harvestPeriod, Colors.green
                                           ),
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
                                                     "Ensoleillement",
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
                                               child: _buildModelingNotation(context,modeling.sunlightRequirement),
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
                                                     "Eau",
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
                                                 child: _buildModelingNotation(context,modeling.waterRequirement),
                                               )
                                           )
                                         ],
                                       ),
                                     ),
                                   ),
                                 ],
                               )
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
                                                 flex: 1,
                                                 child: Padding(
                                                   padding: EdgeInsets.only(top: 7, left: 5, right: 7),
                                                   child: _buildModelingNotation(context,modeling.yield),
                                                 )
                                             )
                                           ],
                                         ),
                                       ),
                                     ),
                                   ],
                                 )
                             ),

                             Flexible(
                               flex: 2,
                               child: Padding(
                                 padding: EdgeInsets.all(3),
                                 child: InkWell(
                                   onTap: () async {
                                     Parcel completedParcel = parcel.copyWith(
                                         name: parcel.name, gardenId: parcel.gardenId, length: parcel.length, width: parcel.width, parcelGround: parcel.parcelGround,
                                         publicVisibility:parcel.publicVisibility , admin:parcel.admin , members:parcel.members, currentModelingId: modeling.id,
                                         currentModelingName: modeling.name, creationDate: parcel.creationDate, dayActivitiesCount:  0,
                                         modelingsMonitoring: [modeling.id], id: Uuid().v4(), isActive: false);

                                     BlocProvider.of<ParcelsBloc>(context).add(ParcelAdded(completedParcel));
//                                     BlocProvider.of<ParcelsBloc>(context).add(ModelingAdded(gardenId, completedParcel.id, schedule));

                                     // TODO Rajouter ici une mise à jour de jardin pour le daysActivitiesCount
//                                     BlocProvider.of<GardensBloc>(context).add((gardenId, completedParcel.id, designs));

                                     Navigator.of(context).push(
                                       MaterialPageRoute(
                                         builder: (context) {
                                           return MultiBlocProvider(
                                             providers: [
                                               BlocProvider<ParcelsBloc>.value(value: parcelsBloc),
                                               BlocProvider(
                                                 create: (context) => ActivitiesBloc(
                                                   parcelsBloc.dataRepository,
                                                 ),
                                               ),
                                             ],
                                             child: DetailsParcelScreen(
                                               user: user,
                                               gardenId: gardenId,
                                               parcelId: completedParcel.id,
                                             ),
                                           );
                                         },
                                       ),
                                     );
                                   },
                                   child: Container(
                                     decoration: BoxDecoration(
                                       color: Colors.green,
                                       borderRadius:
                                       BorderRadius.all(
                                           Radius.circular(5)),
                                     ),
                                     height: 6 *
                                         SizeConfig.heightMultiplier,
                                     width: double.infinity,
                                     child: Padding(
                                       padding: EdgeInsets.all(15),
                                       child: Text("Sélectionner l'association",
                                           maxLines: 2,
                                           textAlign:
                                           TextAlign.center,
                                           style: TextStyle(
                                             color: const Color(0xFFF9F9F9),
                                             fontSize: 2.5 *
                                                 SizeConfig
                                                     .textMultiplier,
//                                             fontWeight: FontWeight.bold
                                           )),
                                     ),),
                                 ),
                               )
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

  }

  Widget _buildModelingSchedule(List<int> period, Color monthColor) {

    // TODO Faire plus propre dans un fichier central pour l'internationalisation
    List<String> months = ["J","F","M","A","M","J","J","A","S","O","N","D"];

    List<Widget> monthsBoxList = List<Widget>();
    for (int i = 0; i < months.length; i++) {
      BoxDecoration monthSpot;
      Color textMonthColor;

      if (period.contains(i)) {
        monthSpot = new BoxDecoration(
          color: monthColor,
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
            child: Image.asset("assets/utils_image/full_leaf.png", fit: BoxFit.scaleDown),
          )
    );
    } else {
      notationsRowItems.add(
          Expanded(
            child: Image.asset("assets/utils_image/transparent_leaf.png", fit: BoxFit.scaleDown),
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



