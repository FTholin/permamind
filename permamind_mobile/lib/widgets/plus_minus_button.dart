import 'package:flutter/material.dart';

/*
*  This class create a minus plus button and handle his behaviors
* */

class PlusMinusButton extends StatefulWidget {

  final double height, width;
  PlusMinusButton({Key key, this.height, this.width}): super(key: key);


  @override
  _PlusMinusButtonState createState() => new _PlusMinusButtonState();
}

class _PlusMinusButtonState extends State<PlusMinusButton>{

  TextEditingController _controller = new TextEditingController();

  int _value = 0;

  void _add() {
    setState(() {
      _value++;
      _controller.text = '${_value}';
    });
  }

  void _subtract() {
    setState(() {
      if(_value > 0) {
        _value--;
        _controller.text = '${_value}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
              color: Colors.green,
              width: 2.0
          )
      ),
      child: new Row(
        //crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
          // Minus button
          new Expanded(
              child: new FlatButton(
                  padding: EdgeInsets.all(2.0),
                  onPressed: _subtract,
                  child: Icon(Icons.remove)
              )
          ),
          // TextField linked with buttons
          new Expanded(
              child: new Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                          color: Colors.green,
                          width: 2.0
                      )
                  ),
                padding: EdgeInsets.all(2.0),
                child: new TextField(
                    decoration: new InputDecoration.collapsed(hintText: '${_value}'),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: _controller

                )
              ),
          ),
          // Plus button
          new Expanded(
              child: new FlatButton(
                  padding: EdgeInsets.all(2.0),
                  onPressed: _add,
                  child: Icon(Icons.add)
              )
          )
        ],
      )
    );
  }
}