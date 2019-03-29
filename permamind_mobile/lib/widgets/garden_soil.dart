
import 'package:flutter/material.dart';

class GardenSoil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: DropdownButton<String>(
          items: <String>['A', 'B', 'C', 'D'].map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ),
    );
  }
}
