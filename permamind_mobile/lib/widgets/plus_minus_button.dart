import 'package:flutter/material.dart';
import 'package:permamind_mobile/blocs/bloc_provider.dart';
import 'package:permamind_mobile/blocs/garden_designer_bloc.dart';

/*
*  This class create a minus plus button and handle his behaviors
* */

enum ButtonType {
  vegSelection, hDim, wDim
}

class PlusMinusButton extends StatefulWidget {

  final double height, width;
  var vegetableItem;
  var buttonType;

  // TODO A terme ce bloc est généraliste aussi !
  final GardenDesignerBloc parentBloc;


  PlusMinusButton({
    Key key,
    this.height,
    this.width,
    this.parentBloc,
  }): super(key: key);

  PlusMinusButton.vegSelection({
    Key key,
    this.height,
    this.width,
    this.parentBloc,
    this.vegetableItem
  }): super(key: key) {

    buttonType = ButtonType.vegSelection;
  }

  PlusMinusButton.heightDimensions({
    Key key,
    this.height,
    this.width,
    this.parentBloc,
  }): super(key: key) {
    buttonType = ButtonType.hDim;
  }

  PlusMinusButton.widthDimensions({
    Key key,
    this.height,
    this.width,
    this.parentBloc,
  }): super(key: key) {
    buttonType = ButtonType.wDim;
  }

  @override
  _PlusMinusButtonState createState() => new _PlusMinusButtonState();
}

class _PlusMinusButtonState extends State<PlusMinusButton>{

  TextEditingController _controller = new TextEditingController();

  double _value = 0;

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

  void _alterValue(double newValue) {
    if(newValue > 0.0) {
      _value = newValue;
    }
  }


  @override
  Widget build(BuildContext context) {
    if (widget.buttonType == ButtonType.vegSelection) {
      return buildVegSelectionButton();
    }
    else if (widget.buttonType == ButtonType.hDim) {
      return buildHeightDimensionsButton();
    }
    else if (widget.buttonType == ButtonType.wDim) {
      return buildWidthDimensionsButton();
    }
  }

  Widget buildVegSelectionButton(){
    return  Container(
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
                    onPressed: () {
                      _subtract();
                      widget.parentBloc.removeFromGardenVeggies(widget.vegetableItem);
                    },
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
                    onPressed: () {
                      _add();
                      widget.parentBloc.addToGardenVeggies(widget.vegetableItem);
                    },
                    child: Icon(Icons.add)
                )
            )
          ],
        )
    );
  }




  Widget buildHeightDimensionsButton(){

    return  Container(
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
                    onPressed: () {
                      _subtract();
                      widget.parentBloc.alterGardenHeight(_value);
                    },
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
                      controller: _controller,
                      onEditingComplete: () {
                          var newValue = double.parse(_controller.text);
                          _alterValue(newValue);
                          widget.parentBloc.alterGardenHeight(_value);
                      },
                  )
              ),
            ),
            // Plus button
            new Expanded(
                child: new FlatButton(
                    padding: EdgeInsets.all(2.0),
                    onPressed: () {
                      _add();
                      widget.parentBloc.alterGardenHeight(_value);
                    },
                    child: Icon(Icons.add)
                )
            )
          ],
        )
    );
  }


  Widget buildWidthDimensionsButton(){

    return  Container(
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
                    onPressed: () {
                      _subtract();
                      widget.parentBloc.alterGardenWidth(_value);
                    },
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
                      controller: _controller,
                      onEditingComplete: () {
                        var newValue = double.parse(_controller.text);
                        _alterValue(newValue);
                        widget.parentBloc.alterGardenWidth(_value);
                      },

                  )
              ),
            ),
            // Plus button
            new Expanded(
                child: new FlatButton(
                    padding: EdgeInsets.all(2.0),
                    onPressed: () {
                      _add();
                      widget.parentBloc.alterGardenWidth(_value);
                    },
                    child: Icon(Icons.add)
                )
            )
          ],
        )
    );
  }
}