

import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/blocs/blocs.dart';


class ScheduleListItem extends StatefulWidget {

  final Garden garden;
  final int dayIndex;
  final int activityIndex;
//  List<PlanningDay> schedule;

  ScheduleListItem({
    @required this.garden,
//    @required this.schedule,
    @required this.dayIndex,
    @required this.activityIndex,
    Key key}) : super(key: key);

  @override
  _ScheduleListItemState createState() => _ScheduleListItemState();
}

class _ScheduleListItemState extends State<ScheduleListItem> {

  bool checkboxValue;

  @override
  Widget build(BuildContext context) {

//    checkboxValue = widget.schedule[widget.dayIndex].dayActivities[widget.activityIndex].complete;

    return Center(
      child: CheckboxListTile(
//        title: Text(widget.schedule[widget.dayIndex].dayActivities[widget.activityIndex].toString()),
        value: checkboxValue,
        onChanged: (bool value) {
          setState((){
            checkboxValue = value;
//            widget.schedule[widget.dayIndex].dayActivities[widget.activityIndex].complete = checkboxValue;
//            widget.garden.schedule = widget.schedule;

            BlocProvider.of<GardensBloc>(context).add(
                UpdateGarden(widget.garden)
            );
          });
        },
        secondary: const Icon(Icons.hourglass_empty),
      ),
    );
  }
}