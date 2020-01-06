import 'package:flutter/material.dart';
import 'package:permamind_mobile/widgets/plus_minus_button.dart';
import 'package:permamind_mobile/blocs/garden_designer_bloc.dart';

class GardenDimensions extends StatelessWidget {

  final GardenDesignerBloc bloc;

  GardenDimensions({
    Key key,
    this.bloc,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          // center the children
          children: <Widget>[
            Text("Longueur (mètre)"),
            PlusMinusButton.heightDimensions(
                height: 40,
                width: 100,
                parentBloc: bloc
            ),
            Text("Largeur (mètre)"),
            PlusMinusButton.widthDimensions(
                height: 40,
                width: 100,
                parentBloc: bloc
            ),
          ],
        ),
      ),
    );
  }
}