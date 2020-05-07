import 'package:arch/arch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:Permamind/blocs/blocs.dart';
import 'package:Permamind/screens/screens.dart';

class ActivitySpeedDial extends StatefulWidget {
  final bool visible;
  final String gardenId;
  final String parcelId;

  ActivitySpeedDial({this.visible, this.gardenId, this.parcelId});

  @override
  ActivitySpeedDialState createState() => ActivitySpeedDialState();
}

class ActivitySpeedDialState extends State<ActivitySpeedDial>
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
          child:  Icon(
            Icons.event,
            color: Colors.white,
            semanticLabel: '${AppLocalizations.of(context).speedDialActivityAdded}',
          ),
          backgroundColor: Colors.green,
          onTap: () async {

            final addedActivity = await Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (_) {

                      return BlocProvider.value(
                        value: BlocProvider.of<ActivitiesBloc>(context),
                        child: ActivityAddedScreen(gardenId: widget.gardenId, parcelId: widget.parcelId),
                      );

                    })
            );

//
//            if (addedActivity != null) {
//
//              if (addedActivity != false) {
//                BlocProvider.of<GardensBloc>(context).add(
//                    GardenDeleted(currentGarden));
//                BlocProvider.of<ActivitiesBloc>(context).close();
//                Navigator.pop(context, currentGarden);
//              }
//            }
          },
          label: '${AppLocalizations.of(context).speedDialActivity}',
          labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),
          labelBackgroundColor: Colors.green,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildSpeedDial();
  }
}