import 'package:arch/arch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';

class GardenSpeedDial extends StatefulWidget {
  final bool visible;

  GardenSpeedDial({this.visible});

  @override
  GardenSpeedDialState createState() => GardenSpeedDialState();
}

class GardenSpeedDialState extends State<GardenSpeedDial>
    with TickerProviderStateMixin {
  bool addButtonSelected = false;

  SpeedDial buildSpeedDial() {
    return SpeedDial(
      visible: widget.visible,
      child: new IconTheme(
        data: new IconThemeData(color: Colors.white),
        child: new Icon(addButtonSelected ? Icons.clear : Icons.add),
      ),
      animatedIconTheme: IconThemeData(size: 22.0),
      onOpen: () {
        setState(() {
          addButtonSelected = true;
        });
      },
      onClose: () {
        setState(() {
          addButtonSelected = false;
        });
      },
      curve: Curves.bounceIn,
      children: [

        SpeedDialChild(
          child: Icon(Icons.nature, color: Colors.white,),
          backgroundColor: Colors.green,
          onTap: () => Navigator.pushNamed(context, ArchSampleRoutes.addGarden),
          label: '${AppLocalizations.of(context).speedDialCreateGarden}',
          labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),
          labelBackgroundColor: Colors.green,
        ),
        SpeedDialChild(
          child: Icon(Icons.share, color: Colors.white,),
          backgroundColor: Colors.green,
//          onTap: () => Navigator.pushNamed(context, ArchSampleRoutes.joinGarden),
          label: '${AppLocalizations.of(context).speedDialJoinGarden}',
          labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),
          labelBackgroundColor: Colors.green,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildSpeedDial();
  }
}
