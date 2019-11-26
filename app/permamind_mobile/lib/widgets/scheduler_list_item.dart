// Flutter code sample for

// ![CheckboxListTile sample](https://flutter.github.io/assets-for-api-docs/assets/material/checkbox_list_tile.png)
//
// This widget shows a checkbox that, when checked, slows down all animations
// (including the animation of the checkbox itself getting checked!).
//
// This sample requires that you also import 'package:flutter/scheduler.dart',
// so that you can reference [timeDilation].

import 'package:flutter/material.dart';


class ScheduleListItem extends StatefulWidget {

  final String data;

  ScheduleListItem({@required this.data, Key key}) : super(key: key);

  @override
  _ScheduleListItemState createState() => _ScheduleListItemState();
}

class _ScheduleListItemState extends State<ScheduleListItem> {
  bool checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CheckboxListTile(
        title: Text(widget.data),
        value: checkboxValue,
        onChanged: (bool value) {
          setState((){
            checkboxValue = value;
          });
        },
        secondary: const Icon(Icons.hourglass_empty),
      ),
    );
  }
}