import 'package:flutter/material.dart';
import 'package:permamind_mobile/blocs/garden_designer_bloc.dart';
import 'package:permamind_mobile/blocs/bloc_provider.dart';
import 'custom_carousel_slider.dart';
import 'package:permamind_mobile/screens/models_list.dart';
import 'garden_chart.dart';

//
//
//
//enum DialogDemoAction {
//  cancel,
//  discard,
//  disagree,
//  agree,
//}
//
//class GardenGenerator extends StatefulWidget {
//
//  final GardenDesignerBloc bloc;
//
//  GardenGenerator({
//    Key key,
//    this.bloc
//  }):super(key: key);
//
//  @override
//  _GardenGeneratorState createState() => _GardenGeneratorState();
//}
//
//class _GardenGeneratorState extends State<GardenGenerator> {
//
//  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//  @override
//  void initState() {
//    super.initState();
//  }
//
//  void showDemoDialog<T>({ BuildContext context, Widget child }) {
//    showDialog<T>(
//      context: context,
//      builder: (BuildContext context) => child,
//    )
//        .then<void>((T value) {
//    });
//  }
//
//  Widget build(BuildContext context) {
//
//    return Scaffold(
//      body: new Center(
//          child: new Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              new RaisedButton(
//                onPressed: () {
//                  widget.bloc.generateConfigurations();
//                  showDemoDialog<DialogDemoAction>(
//                      context: context,
//
//                      child: Container(
//                            child: Column(
//                              crossAxisAlignment: CrossAxisAlignment.center,
//                              mainAxisAlignment: MainAxisAlignment.center,
//                              children: <Widget>[
//                                new StreamBuilder<List<Map<String, dynamic>>>(
//                                    stream: widget.bloc.configurations,
//                                    builder: (context, snapshot) {
//                                      // If stream empty we display circular indicator
//                                      if (!snapshot.hasData) {
//                                        return new Container(
//                                          padding: EdgeInsets.all(80.0),
//                                          child:CircularProgressIndicator()
//                                        );
//                                      }
//                                      else {
//                                        return CarouselSlider(
//                                            height: MediaQuery.of(context).size.height / 2,
//                                            viewportFraction: 1.0,
//                                            aspectRatio: 1.0,
//                                            autoPlay: false,
//                                            enlargeCenterPage: true,
//                                            pauseAutoPlayOnTouch: Duration(seconds: 2),
//                                            items: snapshot.data.map(
//                                                    (jsonItem) => new GardenChartWidget(
//                                                        dataJson: jsonItem,
//                                                        ratio: (MediaQuery.of(context).size.height / 2) * 74.7 / 406.0
//                                                    )
//                                            ).toList()
//                                        );
//                                      }
//                                    }
//                                ),
//
////
//                                          CarouselSlider(
//                                            viewportFraction: 1.0,
//                                            aspectRatio: 1.0,
//                                            autoPlay: false,
//                                            enlargeCenterPage: true,
//                                            pauseAutoPlayOnTouch: Duration(seconds: 2),
//                                            items: [1].map((i) {
//                                              return Builder(
//                                              builder: (BuildContext context) {
//                                                return new GardenChartWidget(
//                                                    dataJson: jsonData,
////                                                    ratio: (MediaQuery.of(context).size.height / 2) * 74.7 / 406.0
//                                                ratio: (MediaQuery.of(context).size.height / 2)
//                                                );
//                                                },
//                                              );
//                                            }).toList()),
//
//                                new Container(),
//                                FloatingActionButton(
//                                  backgroundColor: Colors.white,
//                                  child: new Icon(Icons.close),
//                                  onPressed: () => Navigator.pop(context),
//                                )
//                              ],
//                            )
//                      )
//                  );
//                },
//                textColor: Colors.white,
//                color: Colors.green,
//                child: new Text(
//                  "Générer",
//                )
//              ),
//            ],
//          )
//      ),
//    );
//  }
//}


//Map<String, dynamic> jsonData = {"map": {"sizeW": 6.0, "soilType": "Humifere", "sizeH": 6.0}, "vegetables": {"truc": {"posY": 0.0, "posX": 0.0, "dimY": 1.0, "dimX": 1.0}, "truc2": {"posY": 1.0, "posX": 0.0, "dimY": 1.0, "dimX": 1.0}, "truc3": {"posY": 2.0, "posX": 0.0, "dimY": 1.0, "dimX": 1.0}, "Ail": {"posY": 0.5, "posX": 1.1, "dimY": 0.1, "dimX": 0.1}, "Pois": {"posY": 1.1, "posX": 1.4, "dimY": 0.5, "dimX": 0.2}, "Poireau": {"posY": 0.0, "posX": 1.2, "dimY": 0.3, "dimX": 0.1}, "Asperge": {"posY": 1.8, "posX": 1.2, "dimY": 0.5, "dimX": 0.2}}};



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

    return Scaffold(
      body: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new RaisedButton(
                    onPressed: () async {
                      String result = await widget.bloc.generateConfigurations();
                      if (result as String == "200") {
                        _gardensModels(context, widget.bloc);
                      }
                      else {
                        _ackAlert(context);
                      }
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

void _gardensModels(BuildContext context, GardenDesignerBloc parentBloc) {
  Navigator
      .of(context)
      .push(MaterialPageRoute(builder: (BuildContext context) {
    return  ModelsListPage(bloc: parentBloc);
  }));
}



Future<void> _ackAlert(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {

        return AlertDialog(
          backgroundColor: Colors.red[300],
          title: Text('Dommage'),
          content: const Text("La modélisation n'a pu être réaliséz"),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
  );
}