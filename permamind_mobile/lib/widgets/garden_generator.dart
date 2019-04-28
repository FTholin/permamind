import 'package:flutter/material.dart';
import 'package:permamind_mobile/blocs/garden_designer_bloc.dart';
import 'package:permamind_mobile/blocs/garden_designer_bloc.dart';
import 'custom_carousel_slider.dart';
import 'garden_chart.dart';
import 'dart:async';
import 'dart:convert';

Map<String, dynamic> jsonMap = jsonDecode('''{"map": {"soilType": "Humifere", "name": "flo_123456789", "sizeW": 3.0, "sizeH": 5.0}, "vegetables": {
    "Ail": {
      "dimX": 0.3,
      "dimY": 3.0,
      "posX": 2.7,
      "posY": 2.0
    },
    "Aneth": {
      "dimX": 0.2,
      "dimY": 2.5,
      "posX": 0.0,
      "posY": 0.3
    },
    "Basilic": {
      "dimX": 0.2,
      "dimY": 1.0,
      "posX": 0.6,
      "posY": 0.0
    },
    "Carotte": {
      "dimX": 0.2,
      "dimY": 2.5,
      "posX": 0.4,
      "posY": 1.7
    },
    "Celeri": {
      "dimX": 0.2,
      "dimY": 3.0,
      "posX": 0.9,
      "posY": 1.7
    },
    "Oignon": {
      "dimX": 1.0,
      "dimY": 0.3,
      "posX": 0.6,
      "posY": 1.2
    },
    "Patate": {
      "dimX": 1.2,
      "dimY": 3.0,
      "posX": 1.3,
      "posY": 1.7
    },
    "Poireau": {
      "dimX": 0.3,
      "dimY": 3.0,
      "posX": 0.6,
      "posY": 1.7
    },
    "Pois": {
      "dimX": 2.0,
      "dimY": 0.5,
      "posX": 1.0,
      "posY": 0.2
    }
  }}''');


enum DialogDemoAction {
  cancel,
  discard,
  disagree,
  agree,
}

class GardenGenerator extends StatefulWidget {

  final GardenDesignerBloc bloc;

  GardenGenerator({
    Key key,
    this.bloc
  }):super(key: key);

  @override
  _GardenGeneratorState createState() => _GardenGeneratorState();
}

class _GardenGeneratorState extends State<GardenGenerator> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  void showDemoDialog<T>({ BuildContext context, Widget child }) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    )
        .then<void>((T value) {
    });
  }

  Widget build(BuildContext context) {

//    final GardenChartWidget myGarden = GardenChartWidget(dataJson: jsonMap, ratio: (MediaQuery.of(context).size.height / 1.2) * 74.7 / 406.0);

    return Scaffold(
      body: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new RaisedButton(
                onPressed: () {
                  widget.bloc.generateConfigurations();
                  showDemoDialog<DialogDemoAction>(
                      context: context,

                      child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new StreamBuilder<List<Map<String, dynamic>>>(
                                    stream: widget.bloc.configurations,
                                    builder: (context, snapshot) {
                                      // If stream empty we display circular indicator
                                      if (!snapshot.hasData) {
                                        return new Container(
                                          padding: EdgeInsets.all(80.0),
                                          child:CircularProgressIndicator()
                                        );
                                      }
                                      else {
                                        return CarouselSlider(
                                            height: MediaQuery.of(context).size.height / 2,
                                            viewportFraction: 1.0,
                                            aspectRatio: 1.0,
                                            autoPlay: false,
                                            enlargeCenterPage: true,
                                            pauseAutoPlayOnTouch: Duration(seconds: 2),
                                            items: snapshot.data.map(
                                                    (jsonItem) => new GardenChartWidget(
                                                        dataJson: jsonItem,
                                                        // Calcul à reprendre
                                                        ratio: (MediaQuery.of(context).size.height / 2) * 74.7 / 406.0
                                                    )
                                            ).toList()
                                        );
                                      }
                                    }
                                ),

//
//                                new CarouselSlider(
//                                    height: MediaQuery.of(context).size.height / 1.2,
//                                    viewportFraction: 1.0,
//                                    aspectRatio: 1.0,
//                                    autoPlay: false,
//                                    enlargeCenterPage: true,
//                                    pauseAutoPlayOnTouch: Duration(seconds: 2),
//                                    items: <Widget>[
//                                      myGarden,
//                                      myGarden,
//                                      myGarden
//                                    ]
//                                ),
                                new Container(),
                                FloatingActionButton(
                                  backgroundColor: Colors.white,
                                  child: new Icon(Icons.close),
                                  onPressed: () => Navigator.pop(context),
                                )
                              ],
                            )
                      )
                  );
                },
                textColor: Colors.white,
                color: Colors.green,
                child: new Text(
                  "Générer",
                )
              ),
            ],
          )
      ),
    );
  }
}