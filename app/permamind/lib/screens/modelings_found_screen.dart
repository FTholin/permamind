import 'package:arch/arch.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:Permamind/arch_bricks/arch_bricks.dart';
import 'package:Permamind/blocs/blocs.dart';
import 'package:Permamind/screens/screens.dart';


class ModelingsFoundScreen extends StatefulWidget {
 
  final Parcel parcel;
  final String gardenId;
  final List<String> veggiesList;

  ModelingsFoundScreen({this.parcel, this.gardenId, this.veggiesList});

  @override
  _ModelingsFoundScreenState createState() => _ModelingsFoundScreenState();
}

class _ModelingsFoundScreenState extends State<ModelingsFoundScreen> {

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ModelingsBloc, ModelingsState>(builder: (context, state) {
      if (state is ModelingsLoaded) {
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
                  BlocProvider.of<ModelingsBloc>(context).add(FetchVeggies());
                  Navigator.of(context).pop();
                },
              ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
//                        Flexible(
//                            child: Row(
//                              children: <Widget>[
//                                Expanded(child: Container(),),
//                                IconButton(
//                                  icon: Icon(
//                                    Icons.close,
//                                    size: 7 * SizeConfig.widthMultiplier,
//                                  ),
//                                  onPressed: () {
//
//                                  },
//                                ),
//                              ],
//                            )
//                        ),
                        Flexible(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: Container(
//                                color: Colors.green,
                                child: Text(
                                    "Voici les associations que nous avons trouvé:",
                                    maxLines: 3,
                                    style: TextStyle(
                                      color: const Color(0xFF01534F),
                                      fontSize: 2.5 *
                                          SizeConfig.textMultiplier,
                                      fontWeight: FontWeight.bold,
                                    )
                                )
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                  Flexible(
                      flex: 6,
                      child: ListView(
                        padding: EdgeInsets.only(top: 1.0),
                        children: state.modelingsFetched.map((modeling) {
                          return InkWell(
                              onTap: () async {
                                return Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) {
                                      return DetailsModelingScreen(
                                          gardenId: widget.gardenId,
                                          parcel: widget.parcel,
                                          modeling: modeling,
                                      );
                                    })
                                );
                              },
                              child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Card(
//                          color: Colors.grey,
                                      child: Container(
                                        height: 29 * SizeConfig.heightMultiplier,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Flexible(
                                              flex: 5,
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                children: <Widget>[
                                                  Flexible(
                                                      flex: 2,
                                                      child: Padding(
                                                        padding: EdgeInsets.all(10),
                                                        child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFFD7D35F),
//                                                  border: Border.all(color: const Color(0xFF01534F), width: 2),
                                                              borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(5)),
                                                            ),
                                                            height: 4.5 *
                                                                SizeConfig.heightMultiplier,
                                                            child: Center(
                                                              child: Text(
                                                                  "${modeling.name}",
                                                                  textAlign:
                                                                  TextAlign.center,
                                                                  style: TextStyle(
                                                                    color: const Color(
                                                                        0xFF01534F),
                                                                    fontSize: 1.7 *
                                                                        SizeConfig
                                                                            .textMultiplier,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                  )),
                                                            )),
                                                      )),
//                                      Spacer(),
                                                  Flexible(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding: EdgeInsets.all(10),
                                                        child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Color(0xFF4BB16C),
                                                              borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(5)),
                                                            ),
                                                            height: 4.5 *
                                                                SizeConfig.heightMultiplier,
                                                            child: Center(
                                                              child: Text("Infos",
                                                                  textAlign:
                                                                  TextAlign.center,
                                                                  style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontSize: 1.7 *
                                                                        SizeConfig
                                                                            .textMultiplier,
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                  )),
                                                            )),
                                                      ))
                                                ],
                                              ),
                                            ),
                                            Flexible(
                                              flex: 8,
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                children: <Widget>[
                                                  Flexible(
                                                      flex: 2,
                                                      child: Padding(
                                                        padding: EdgeInsets.all(5),
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
                                                      )),
                                                ],
                                              ),
                                            ),
                                            Flexible(
                                                flex: 4,
                                                child: Padding(
                                                    padding: EdgeInsets.all(10),
                                                    child: Container(
                                                      child: Text(
                                                          "Ajoutez votre premier jardin pour débuter l'aventure avec Permamind !",
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                            color: const Color(0xFF01534F),
                                                            fontSize: 1.8 * SizeConfig.textMultiplier,
//                          fontWeight: FontWeight.bold,
                                                          )),
                                                    )
                                                )
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )));
                        }).toList(),
                      ),
                  )
                ],
              )
          ),
        );

      } else {
        return Container();
      }
    });

//    return BlocBuilder<ModelingsBloc, ModelingsState>(builder: (context, state) {
//      if (state is VeggiesLoaded) {
//        state.veggies.map((item) => veggiesSelected[item.name] = false);
//
//        return Scaffold(
//          body: Padding(
//              padding: EdgeInsets.all(30),
//              child: Column(
//                children: <Widget>[
//                  Flexible(
//                    flex: 1,
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                      children: <Widget>[
//                        Flexible(
//                            child: Row(
//                              children: <Widget>[
//                                Expanded(child: Container(),),
//                                IconButton(
//                                  icon: Icon(
//                                    Icons.close,
//                                    size: 7 * SizeConfig.widthMultiplier,
//                                  ),
//                                  onPressed: () => Navigator.of(context).pop(),
//                                ),
//                              ],
//                            )
//                        ),
//                        Flexible(
//                          flex: 10,
//                          child: Container(
//                            color: Colors.red,
//                          ),
//                        )
////                        Flexible(
////                            flex: 2,
////                            child: Padding(
////                              padding: EdgeInsets.only(left: 30, right: 30),
////                              child: Container(
////                                color: Colors.green,
////                                child: _currentStep == 4 ? Text(
////                                    "Quels légumes voulez-vous cultiver ?",
////                                    maxLines: 3,
////                                    style: TextStyle(
////                                      color: const Color(0xFF01534F),
////                                      fontSize: 2.5 *
////                                          SizeConfig.textMultiplier,
////                                      fontWeight: FontWeight.bold,
////                                    )
////                                ) : Container(),
////                              ),
////                            )
////                        )
//                      ],
//                    ),
//                  ),
//                ],
//              )
//          ),
//        );
//      } else {
//        return CircularProgressIndicator();
//      }});

  }
}