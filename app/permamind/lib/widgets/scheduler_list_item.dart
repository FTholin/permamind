

import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/blocs/blocs.dart';


class ScheduleListItem extends StatefulWidget {

  final Activity activity;

  ScheduleListItem({
    @required this.activity,
    Key key}) : super(key: key);

  @override
  _ScheduleListItemState createState() => _ScheduleListItemState();
}

class _ScheduleListItemState extends State<ScheduleListItem> {

  bool checkboxValue;

  @override
  Widget build(BuildContext context) {

    checkboxValue = widget.activity.complete;

    return Center(
      child: CheckboxListTile(
        title: Text(widget.activity.title),
        value: checkboxValue,
        onChanged: (bool value) {
          setState((){
            checkboxValue = value;
            // TODO Add user for completeActivityUser
            BlocProvider.of<ActivitiesBloc>(context).add(
                ActivityUpdated(
                    widget.activity.copyWith(
                    id: widget.activity.id,
                    parcelId: widget.activity.parcelId,
                    title: widget.activity.title,
                    complete: checkboxValue,
                    expectedDate: widget.activity.expectedDate,
                    category : widget.activity.category,
                    completeActivityUserId : widget.activity.completeActivityUserId
                ),
                )
            );
          });
        },
        secondary: const Icon(Icons.hourglass_empty),
      ),
    );
  }
}