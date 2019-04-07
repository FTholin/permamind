import 'package:flutter/material.dart';
import 'package:permamind_mobile/blocs/garden_designer_bloc.dart';

String dropdownValue = 'Humifère';

class GardenSoilList extends StatefulWidget {

  final GardenDesignerBloc bloc;

  GardenSoilList({
    Key key,
    this.bloc
  }):super(key: key);

  @override
  _GardenSoilListState createState() => _GardenSoilListState();
}

class _GardenSoilListState extends State<GardenSoilList> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Choisis ton type de sol: "),
            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              }, // TODO A terme les items devront être sélectionnés dans la base
              items: <String>['Humifère', 'Argileux', 'Sableux', 'Limoneux', 'ArgileuxHumique']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )
          ],
        )
      ),
    );
  }
}