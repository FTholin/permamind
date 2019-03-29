import 'package:flutter/material.dart';
import 'package:permamind_mobile/widgets/plus_minus_button.dart';
class GardenDimensions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          // center the children
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Longueur"),
             Container(
                 height: 40,
                 width: 200,
                 child: PlusMinusButton()
             ),
            Text("Largeur "),
            Container(
                height: 40,
                width: 200,
                child: PlusMinusButton()
            )
          ],
        ),
      ),
    );
  }
}