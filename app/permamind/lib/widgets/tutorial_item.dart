import 'dart:ui';

import 'package:flutter/material.dart';

class TutorialItem extends StatelessWidget {
  final String name;
  final String background;

  TutorialItem({@required this.name, @required this.background});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Stack(children: <Widget>[
//          Image.asset(
//            'assets/tutorials/creer-sol.png',
//            fit: BoxFit.fitWidth,
//          ),

//          Container(
//            height: 200,
//            width: double.maxFinite,
//            decoration: BoxDecoration(
//              image: DecorationImage(
//                image: ExactAssetImage("your_chocolage_image"),
//                fit: BoxFit.cover,
//              ),
//            ),
//            child: ClipRRect( // make sure we apply clip it properly
//              child: BackdropFilter(
//                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//                child: Container(
//                  alignment: Alignment.center,
//                  color: Colors.grey.withOpacity(0.1),
//                  child: Text(
//                    "CHOCOLATE",
//                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                  ),
//                ),
//              ),
//            ),
//          )
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              'assets/tutorials/$background.jpg',
              fit: BoxFit.cover,
              width: 190,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
            child: Container(
              color: Colors.black.withOpacity(0.22),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              '$name',
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.white),
//                textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
        ]));
//    return Container(
//      color: Colors.red,
//      height: MediaQuery.of(context).size.height / 8,
//      width: MediaQuery.of(context).size.width / 8,
//      margin: EdgeInsets.all(15),
//      child: Stack(
//        children: <Widget>[
//          Image.asset("assets/gardens/garden-$index.jpg",
//              width: 100, fit: BoxFit.fill),
//          Positioned(
//            bottom: 20,
//            left: 20,
//            height: 100,
//            width: 100,
//            child: Container(
//              decoration: new BoxDecoration(
//                borderRadius: BorderRadius.circular(9),
//                color: Color(0xFFF9F9F9).withOpacity(0.86),
//              ),
//              child: Padding(
//                padding: EdgeInsets.all(10),
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
//                  ],
//                ),
//              ),
//            ),
//          ),
//          Positioned(
//            bottom: 100,
//            left: 100,
//            height: 30,
//            width: 30,
//            child: Container(
//              padding: EdgeInsets.all(2),
//              decoration: new BoxDecoration(
//                color: Colors.green,
//                borderRadius: BorderRadius.circular(15),
//              ),
//              child: Center(
//                  child: Icon(Icons.check, color: Colors.white,)
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
  }
}
