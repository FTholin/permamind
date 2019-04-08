import 'package:flutter/material.dart';
import 'package:permamind_mobile/blocs/garden_designer_bloc.dart';
import 'package:permamind_mobile/blocs/garden_designer_bloc.dart';

String dropdownValue = 'Humifère';

class GardenGenerator extends StatefulWidget {

  final GardenDesignerBloc bloc;

  GardenGenerator({
    Key key,
    this.bloc
  }):super(key: key);

  @override
  _GardenGeneratorState createState() => _GardenGeneratorState();
}

class _GardenGeneratorState extends State<GardenGenerator> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new RaisedButton(
                onPressed: () {
                  widget.bloc.generateModel();
                  },
                textColor: Colors.white,
                color: Colors.lightGreenAccent,
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  "Générer",
                ),
              ),
            ],
          )
      ),
    );
  }
}