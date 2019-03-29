import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


class PlusMinusButton extends StatefulWidget {
  @override
  _PlusMinusButtonState createState() => new _PlusMinusButtonState();
}

class _PlusMinusButtonState extends State<PlusMinusButton>{

  int _value = 0;

  void _add() {
    setState(() {
      _value++;
    });
  }

  void _subtract() {
    setState(() {
      _value--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: Colors.green[100],
        child: new Center(
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(icon: new Icon(Icons.remove), iconSize: 20.0, onPressed: _subtract),
              IconButton(icon: new Icon(Icons.add),iconSize: 20.0, onPressed: _add),
            ],
          ),
        ),
      ),
    );
  }
}