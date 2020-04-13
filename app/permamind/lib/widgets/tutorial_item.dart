import 'dart:ui';

import 'package:arch/arch.dart';
import 'package:flutter/material.dart';

class TutorialItem extends StatelessWidget {
  final String name;
  final String background;

  TutorialItem({@required this.name, @required this.background});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(8),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        image: new DecorationImage(
          image: new ExactAssetImage('assets/tutorials/$background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
        child: new Container(
          decoration: new BoxDecoration(
              color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child:  Padding(
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
        ),
      ),
    );


//    return Container(
//        margin: EdgeInsets.all(8),
//        decoration: BoxDecoration(
//          color: Colors.green,
//          borderRadius: BorderRadius.all(Radius.circular(12)),
//        ),
//        child: Stack(children: <Widget>[
//                    BackdropFilter(
//            filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
//            child: Container(
//              color: Colors.black.withOpacity(0.22),
//            ),
//          ),
//          ClipRRect(
//            borderRadius: BorderRadius.circular(12.0),
//            child: Image.asset(
//              'assets/tutorials/$background.jpg',
//              fit: BoxFit.cover,
//              width: 45 * SizeConfig.widthMultiplier,
//            ),
//          ),
//
//          Padding(
//            padding: EdgeInsets.all(10),
//            child: Text(
//              '$name',
//              style: TextStyle(
//                  fontStyle: FontStyle.normal,
//                  fontWeight: FontWeight.bold,
//                  fontSize: 17,
//                  color: Colors.white),
////                textAlign: TextAlign.justify,
//              overflow: TextOverflow.ellipsis,
//              maxLines: 3,
//            ),
//          ),
//        ]));
  }
}
