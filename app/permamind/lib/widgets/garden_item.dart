import 'package:arch/arch.dart';
import 'package:flutter/material.dart';
import 'package:permamind/widgets/parcel_carrousel.dart';

class GardenItem extends StatelessWidget {
  final String name;
  final String membersCount;
  final int index;
  final int dayActivitiesCount;

  GardenItem({
    @required this.name,
    @required this.membersCount,
    @required this.index,
    this.dayActivitiesCount
  });

  // TODO Internationalisation des labels !!

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2 * SizeConfig.heightMultiplier),
      child: Container(
        height: 34 * SizeConfig.heightMultiplier,
        decoration: BoxDecoration(
          color: Color.fromRGBO(253, 255, 242, 1),
          border: Border.all(
            color: Colors.black,
            width: 0.1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.all(1 * SizeConfig.heightMultiplier),
          child: Column(
            children: <Widget>[
              Container(
                  height: 11 * SizeConfig.heightMultiplier,
//                color: Colors.blue,
                  child: Padding(
                    padding: EdgeInsets.all(0.1 * SizeConfig.heightMultiplier),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                                "$name",
                                style: TextStyle(
                                    color: const Color(0xFF01534F),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 2 * SizeConfig.textMultiplier
                                )
                            ),
                            FlatButton(
                              child: Text(
                                  "Modifier",
                                  style: TextStyle(
                                      color: const Color(0xFF4FB06E),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 2 * SizeConfig.textMultiplier
                                  )
                              ),
                              onPressed: () {},
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 0.3 * SizeConfig.heightMultiplier, bottom: 0.3 * SizeConfig.heightMultiplier),
                              child: Text(
                                  "8 tâches à réaliser aujourd'hui.",
                                  style: TextStyle(
                                      color: const Color(0xFF01534F),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 2.2 * SizeConfig.textMultiplier
                                  )
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
              ),
              ParcelCarouselWithIndicator(["1er élément", "second élément"]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 1 * SizeConfig.heightMultiplier),
                    child: Text(
                        "Voir mes parcelles",
                        style: TextStyle(
                            color: const Color(0xFF01534F),
                            fontWeight: FontWeight.normal,
                            fontSize: 2.2 * SizeConfig.textMultiplier
                        )
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


  // TODO Design potager sans parcelle
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: EdgeInsets.only(top: 2 * SizeConfig.heightMultiplier),
//      child: Container(
//        height: 19 * SizeConfig.heightMultiplier,
//        decoration: BoxDecoration(
//          color: Color.fromRGBO(253, 255, 242, 1),
//          border: Border.all(
//            color: Colors.black,
//            width: 0.1,
//          ),
//          borderRadius: BorderRadius.circular(12),
//        ),
//        child: Padding(
//          padding: EdgeInsets.all(1 * SizeConfig.heightMultiplier),
//          child: Column(
//            children: <Widget>[
//              Container(
//                height: 11 * SizeConfig.heightMultiplier,
////                color: Colors.blue,
//                child: Padding(
//                  padding: EdgeInsets.all(0.1 * SizeConfig.heightMultiplier),
//                  child: Column(
//                    children: <Widget>[
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Text(
//                              "$name",
//                              style: TextStyle(
//                                  color: const Color(0xFF01534F),
//                                  fontWeight: FontWeight.normal,
//                                  fontSize: 2 * SizeConfig.textMultiplier
//                              )
//                          ),
//                          FlatButton(
//                            child: Text(
//                                "Modifier",
//                                style: TextStyle(
//                                    color: const Color(0xFF4FB06E),
//                                    fontWeight: FontWeight.bold,
//                                    fontSize: 2 * SizeConfig.textMultiplier
//                                )
//                            ),
//                            onPressed: () {},
//                          )
//                        ],
//                      ),
//                      Row(
//                        children: <Widget>[
//                          Padding(
//                            padding: EdgeInsets.only(top: 0.3 * SizeConfig.heightMultiplier, bottom: 0.3 * SizeConfig.heightMultiplier),
//                            child: Text(
//                                "Vous n'avez pas créé de parcelle.",
//                                style: TextStyle(
//                                    color: const Color(0xFF01534F),
//                                    fontWeight: FontWeight.bold,
//                                    fontSize: 2.2 * SizeConfig.textMultiplier
//                                )
//                            ),
//                          ),
//                        ],
//                      )
//                    ],
//                  ),
//                )
//              ),
//              Container(
//                  width: double.infinity,
//                  height: 5.5 * SizeConfig.heightMultiplier,
//              child: RaisedButton.icon(
//                icon: const Icon(Icons.add, size: 20, color: Colors.white,),
//                label: Text(
//                  "Ajouter une parcelle",
//                  style: TextStyle(
//                      color: Colors.white,
//                      fontWeight: FontWeight.bold,
//                      fontSize: 2.2 * SizeConfig.textMultiplier
//                  )
//              ),
//                onPressed: () {},
//              ),
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
}
