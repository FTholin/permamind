import 'package:flutter/material.dart';
import 'package:permamind_mobile/widgets/plus_minus_button.dart';
class GardenDimensions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          // center the children
          children: <Widget>[
            Text("Longueur"),
            PlusMinusButton(height: 40, width: 100),
            Text("Largeur"),
            PlusMinusButton(height: 40, width: 100),
          ],
        ),
      ),
    );
  }
}