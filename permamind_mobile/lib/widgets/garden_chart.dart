import 'package:flutter/material.dart';
import 'dart:math' as math;



class GardenChartWidget extends StatefulWidget {

  GardenChartWidget({
    Key key,
    @required this.dataJson,
    @required this.ratio,
  }) : super(key: key) {
    gardenProperties = getGardenProperties();
    veggies = getVeggies();
  }


  /// veggies list
  List<Widget> veggies;

  /// garden caracteristics
  Map<String, dynamic> gardenProperties;

  final Map<String, dynamic> dataJson;

  final double ratio;


  @override
  _GardenChartWidgetState createState() => _GardenChartWidgetState();


  List<Widget> getVeggies() {

    List<Widget> itemsList = List<Widget>();

    dataJson['vegetables'].forEach((k,v) {

      itemsList.add(new Positioned(
          bottom: (v['posY'] * gardenProperties['sizeH'] * ratio /  gardenProperties['sizeH']),
          left: (v['posX'] * gardenProperties['sizeW'] * ratio /  gardenProperties['sizeW']),
          child: Container(
            height: (v['dimY'] * gardenProperties['sizeW'] * ratio /  gardenProperties['sizeW']),
            width: (v['dimX'] * gardenProperties['sizeH'] * ratio /  gardenProperties['sizeH']),
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0),
            child: new Text(k,
              style: TextStyle(
                  fontSize: 10.0
              ),
            ),
            alignment: Alignment(0.0, 0.0),
          )
      ));
    });
    return itemsList;
  }

  Map<String, dynamic> getGardenProperties(){
    return dataJson['map'];
  }

}

class _GardenChartWidgetState extends State<GardenChartWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.brown,
        height: (widget.gardenProperties['sizeH'] * widget.ratio),
        width: (widget.gardenProperties['sizeW'] * widget.ratio),
        child: new Stack(
            children: widget.veggies
        )
    );
  }


  @override
  void dispose() {
    super.dispose();
  }
}
