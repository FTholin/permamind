import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permamind/Localization.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/blocs/blocs.dart';

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
          child: Image.asset("assets/utils_icons/group.png"),
          backgroundColor: Colors.green,
          onTap: () => Navigator.pushNamed(context, ArchSampleRoutes.joinGarden),
          label: '${DemoLocalizations.of(context).speedDialJoinGarden}',
          labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          labelBackgroundColor: Colors.green,
        ),
        SpeedDialChild(
          child: Image.asset("assets/utils_icons/ecology.png"),
          backgroundColor: Colors.green,
          onTap: () => Navigator.pushNamed(context, ArchSampleRoutes.addGarden),
          label: '${DemoLocalizations.of(context).speedDialCreateGarden}',
          labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
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
