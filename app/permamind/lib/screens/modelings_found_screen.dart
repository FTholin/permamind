import 'package:arch/arch.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/blocs/blocs.dart';


class ModelingsFoundScreen extends StatefulWidget {
 
//  final Parcel parcel;

  ModelingsFoundScreen(
//    @required this.parcel
  );

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
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                            child: Row(
                              children: <Widget>[
                                Expanded(child: Container(),),
                                IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    size: 7 * SizeConfig.widthMultiplier,
                                  ),
                                  onPressed: () {
                                    BlocProvider.of<ModelingsBloc>(context).add(FetchVeggies());
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            )
                        ),
                        Flexible(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: Container(
                                color: Colors.green,
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
                        children: state.modelingsFetched.map((modeling) {
                          return Container(
                            margin: EdgeInsets.all(5.0),
                            child: InkWell(
                                onTap: () {},
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  child: Container(
                                    color: Color.fromRGBO(214, 211, 94, 1),
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Container(color: Colors.red, child: Text("${modeling.name}"),),
                                              Container(color: Colors.blue, child: Text("${modeling.name}"),),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                          );
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