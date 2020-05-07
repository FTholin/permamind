import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Permamind/blocs/blocs.dart';
import 'package:Permamind/screens/screens.dart';
import 'package:Permamind/widgets/widgets.dart';



//class EnumeratedTutorials extends StatelessWidget {
//  EnumeratedTutorials({Key key}) : super(key: key);
//

class EnumeratedTutorials extends StatefulWidget {
  @override
  _StepperState createState() => _StepperState();
}

class _StepperState extends State<EnumeratedTutorials> {

  var _index = 0;

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<TutorialsBloc, TutorialsState>(
      builder: (context, state) {
        if (state is TutosLoading) {
          return Container();
        } else if (state is TutosLoaded) {
          final tutorials = state.tutorials;

          return Padding(
              padding: EdgeInsets.all(8),
              child: GridView.count(
                primary: true,
                crossAxisCount: 2,
                childAspectRatio: 1.6,
//              mainAxisSpacing: 2.0,
                children: List.generate(tutorials.keys.length, (index) {

                  return InkResponse(
                    enableFeedback: true,
                    child: TutorialItem(name: tutorials[index][0].tutorialHeading, background: tutorials[index][0].background),
                    onTap: () async {
                      await Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                        return TutorialActivitiesScreen(
                          tutorialHeading: tutorials[index][0].tutorialHeading,
                          tutorialActivities: tutorials[index],
                        );
                      }));
                    },
                  );

                }),
              )
          );

//          return ListView.builder(
//            itemCount: tutorials.length,
//            itemBuilder: (context, index) {
//              return Card(
//                child: ListTile(
//                  leading: CircularCheckBox(
//                      value: false,
//                      materialTapTargetSize:
//                      MaterialTapTargetSize.padded,
//                      onChanged: (bool x) {
//
//                      }),
//                  title: Text(tutorials[index][0].tutorialHeading),
//                  trailing: Icon(Icons.keyboard_arrow_right),
//                  onTap: () async {
//                    await Navigator.of(context).push(MaterialPageRoute(builder: (_) {
//                      return TutorialActivitiesScreen(
//                        tutorialHeading: tutorials[index][0].tutorialHeading,
//                        tutorialActivities: tutorials[index],
//                      );
//                        }));
//                  },
//                ),
//              );
//            },
//          );

        } else {
          return Container();
        }
      },
    );
  }
}





//Card getStructuredGridCell(Country country) {
//  return new Card(
//      elevation: 1.5,
//      child: new Column(
//        crossAxisAlignment: CrossAxisAlignment.stretch,
//        mainAxisSize: MainAxisSize.min,
//        verticalDirection: VerticalDirection.down,
//        children: <Widget>[
//          new SvgPicture.network(
//            country.flag.replaceAll('https', 'http'),
//            height: 130.0,
//            width: 100.0,
//            placeholderBuilder: (BuildContext context) => new Container(
//                padding: const EdgeInsets.all(60.0),
//                child: const CircularProgressIndicator()),
//          ),
//          new Padding(
//            padding: EdgeInsets.only(left: 10.0),
//            child: new Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                new Text(country.name),
//                new Text(country.nativeName),
//                new Text(country.capital),
//              ],
//            ),
//          )
//        ],
//      ));
//}





//class EnumeratedTutorials extends StatelessWidget {
//  EnumeratedTutorials({Key key}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    final localizations = ArchSampleLocalizations.of(context);
//
//    return BlocBuilder<TutorialsBloc, TutorialsState>(
//      builder: (context, state) {
//        if (state is TutosLoading) {
//          return Container(
//            child: Text("TutosLoading"),
//          );
//        } else if (state is TutosLoaded) {
//          final tutorials = state.tutorials;
//          return Column(
//            children: <Widget>[
//              Expanded(
//                flex: 1,
//                child: Column(
//                  children: <Widget>[
//                    Container(
//                      child: Text(
//                        'Welcome to Tutorials',
//                        textAlign: TextAlign.center,
//                        style: TextStyle(
//                          fontFamily: 'Georgia',
//                          fontSize: 20,
//                            fontWeight: FontWeight.bold
//                        ),
//                      ),
//                      margin: EdgeInsets.only(top: 10, bottom: 10),
//                    ),
//                    Text(
//                      'We believe the world is more interesting with some key concepts in pockets.',
//                      textAlign: TextAlign.center,
//                      style: TextStyle(
//                        fontFamily: 'Georgia',
//                        fontSize: 18,
//                      ),
//                    )
//                  ],
//                ),
//              ),
//              Expanded(
//                  flex: 6,
//                  child: Container(
//                      child: ListView.builder(
//                          itemCount: tutorials.length,
//                          itemBuilder: (BuildContext context, int index) {
//                            return Card(
//                              child: ListTile(
//                                title: Text('${tutorials[index].heading}'),
//                                leading: CircularCheckBox(
//                                    value: false,
//                                    materialTapTargetSize:
//                                        MaterialTapTargetSize.padded,
//                                    onChanged: (bool x) {}),
//                                trailing: Icon(
//                                  Icons.chev ron_right,
//                      semanticLabel: @'',
//                                ),

//                              ),
//                            );
//                          })))
//            ],
//          );
//        } else {
//          return Container();
//        }
//      },
//    );
//  }
//}
