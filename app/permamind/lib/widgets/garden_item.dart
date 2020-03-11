import 'package:arch/arch.dart';
import 'package:flutter/material.dart';

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


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.red
      ),
      width: 50 * SizeConfig.widthMultiplier,
      height: 23 * SizeConfig.heightMultiplier,
      child: Padding(
        padding: EdgeInsets.all(1 * SizeConfig.widthMultiplier),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                        color: Colors.yellow,
                        child: Text(
                            "$name",
                            style: TextStyle(
                                fontSize: 2.7 * SizeConfig.textMultiplier)
                        ),
                      )
                  ),
                  Container(color: Colors.white, child: IconButton(
                      icon: new Icon(Icons.settings),
                      onPressed: () {

                      }
                  ),)
                ],
              ),
            ),

            Expanded(
              flex: 2,
              child: Container(
                color: Colors.blue,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(1 * SizeConfig.widthMultiplier),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                              color: Colors.pink,
                            ),
                          width: 29 * SizeConfig.widthMultiplier,
                          child: Padding(
                            padding: EdgeInsets.all(1 * SizeConfig.widthMultiplier),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    color: Colors.greenAccent,
                                  ),
                                ),
                                Text(
                                    "parcelle 1",
                                    style: TextStyle(
                                        fontSize: 1.8 * SizeConfig.textMultiplier)
                                ),
                              ],
                            )
                          )
                        ),
                    ),


                  ],
                ),
              )
            ),

            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                        color: Colors.yellow,
                        child: Text(
                            "1 parcelle",
                            style: TextStyle(
                                fontSize: 1.7 * SizeConfig.textMultiplier)
                        ),
                      )
                  ),
                ],
              ),
            )
          ],
        )
      )
    );
  }


  // Old container
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      height: MediaQuery.of(context).size.height / 4.5,
//      margin: EdgeInsets.all(15),
//      child: Stack(
//        children: <Widget>[
//          Image.asset("assets/gardens/garden-$index.jpg",
//              width: 400, fit: BoxFit.fill),
//          Positioned(
//            bottom: 20,
//            left: 20,
//            height: 100,
//            width: 250,
//            child: Container(
//              decoration: new BoxDecoration(
//                borderRadius: BorderRadius.circular(9),
//                color: Color(0xFFF9F9F9).withOpacity(0.86),
//              ),
//              child: Padding(
//                  padding: EdgeInsets.all(10),
//                child: Column(
//                  children: <Widget>[
//                    Row(
//                      children: <Widget>[
//                        Text(
//                          '$name',
//                          style: TextStyle(
//                              fontStyle: FontStyle.normal,
//                              fontWeight: FontWeight.bold,
//                              fontSize: 22,
//                              color: Color(0xFF01534F)
//                          ),
//                        ),
//                      ],
//                    ),
//                    Padding(
//                      padding: EdgeInsets.only(top:8),
//                      child: Row(
//                        children: <Widget>[
//                          Icon(
//                            Icons.perm_identity,
//                            color: Color(0xFF4FB06E),
//                          ),
//                          Text('$membersCount'),
//                        ],
//                      ),
//                    )
//                  ],
//                ),
//              ),
//            ),
//          ),
//          Positioned(
//            bottom: 100,
//            left: 250,
//            height: 30,
//            width: 30,
//            child: Container(
//                padding: EdgeInsets.all(2),
//                decoration: new BoxDecoration(
//                  color: Colors.red,
//                  borderRadius: BorderRadius.circular(15),
//                ),
//              child: Center(
//                child: Text(
//                  '$dayActivitiesCount',
//                  style: TextStyle(fontSize: 20,color: Colors.white),
//                )
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
}
