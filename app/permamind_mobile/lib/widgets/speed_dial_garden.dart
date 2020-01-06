import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permamind_mobile/arch_bricks/arch_bricks.dart';

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
          onTap: null,
          label: 'Join a garden',
          labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          labelBackgroundColor: Colors.green,
        ),
        SpeedDialChild(
          child: Image.asset("assets/utils_icons/ecology.png"),
          backgroundColor: Colors.green,
          onTap: () => Navigator.pushNamed(context, ArchSampleRoutes.addGarden),
          label: 'Create a garden',
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
