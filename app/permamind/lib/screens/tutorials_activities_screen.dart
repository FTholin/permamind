import 'package:carousel_slider/carousel_slider.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';


//class EnumeratedActivitiesScreen extends StatelessWidget {
//  final String tutorialId;
//  final String tutorialName;
//
//  EnumeratedActivitiesScreen(
//      {@required this.tutorialName, @required this.tutorialId, Key key})
//      : super(key: key ?? ArchSampleKeys.detailsGardenScreen);
//
//  @override
//  Widget build(BuildContext context) {
////    final tutorialsBloc = BlocProvider.of<TutorialsBloc>(context);
//
////    tutorialsBloc.add(LoadTutoActivities(tutorialId));
//
//    return BlocBuilder<TutorialsBloc, TutorialsState>(
//      builder: (context, state) {
//        if (state is ActivitiesLoading) {
//          return Container(
//            child: Text("ActivitiesLoading"),
//          );
//        } else if (state is TutoActivitiesLoaded) {
//          final activities = state.tutoActivities;
//          return Scaffold(
//              appBar: AppBar(
//                  title: Text("${tutorialName}"),
//                  leading: IconButton(
//                      icon: Icon(Icons.arrow_back_ios),
//                      onPressed: () {
////                        tutorialsBloc.add(LoadTutos());
//                        Navigator.pop(context, false);
//                      })),
//              body: ActivitiesPanel(activities));
//        } else {
//          return Scaffold(
//              appBar: AppBar(
//                  title: Text("${tutorialName}"),
//                  leading: IconButton(
//                      icon: Icon(Icons.arrow_back_ios),
//                      onPressed: () {
//                        tutorialsBloc.add(LoadTutos());
//                        Navigator.pop(context, false);
//                      })),
//              );
//        }
//      },
//    );
//  }
//}
//
//class ActivitiesPanel extends StatefulWidget {
//  List<Item> _data = new List<Item>();
//
//  ActivitiesPanel(List<TutorialActivity> activities) {
//    generateItems(activities);
//  }
//
//  @override
//  _ActivitiesPanelState createState() => _ActivitiesPanelState();
//
//  void generateItems(List<TutorialActivity> activities) {
//    for (var item in activities) {
//      _data.add(new Item(
//        id: item.id,
//        headerValue: '${item.heading}',
//        expandedValue: '${item.content}'
//      ));
//    }
//  }
//}
//
//class _ActivitiesPanelState extends State<ActivitiesPanel> {
//  @override
//  Widget build(BuildContext context) {
//    return SingleChildScrollView(
//      child: Container(
//        child: _buildPanel(),
//      ),
//    );
//  }
//
//
//  Widget _buildPanel() {
//    return ExpansionPanelList.radio(
//      expansionCallback: (int index, bool isExpanded) {
//        setState(() {
//          widget._data[index].isExpanded = !isExpanded;
//        });
//      },
//      children: widget._data.map<ExpansionPanelRadio>((Item item) {
//        return ExpansionPanelRadio(
//          value: item.id,
//          headerBuilder: (BuildContext context, bool isExpanded) {
//            return ListTile(
//                title: Text(item.headerValue),
//                leading: CircularCheckBox(
//                    value: item.isChecked,
//                    materialTapTargetSize: MaterialTapTargetSize.padded,
//                    onChanged: null));
//          },
//          body: Card(
//            child: Column(
//              mainAxisSize: MainAxisSize.min,
//              children: <Widget>[
//                Text(
//                  '${item.expandedValue}',
//                  textAlign: TextAlign.center,
//                  style: TextStyle(
//                    fontFamily: 'Georgia',
//                    fontSize: 18,
//                  ),
//                ),
//                Row(
//                  mainAxisSize: MainAxisSize.min,
//                  children: [
//                    Icon(Icons.star, color: Colors.green[500]),
//                    Icon(Icons.star, color: Colors.green[500]),
//                    Icon(Icons.star, color: Colors.green[500]),
//                    Icon(Icons.star, color: Colors.black),
//                    Icon(Icons.star, color: Colors.black),
//                  ],
//                ),
//                Container(
//                  padding: EdgeInsets.all(10),
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                    children: [
//                      Column(
//                        children: [
//                          Icon(Icons.timer, color: Colors.green[500]),
//                          Text('Duration:'),
//                          Text('25 min'),
//                        ],
//                      ),
//                    ],
//                  ),
//                ),
//              ],
//            ),
//          ),
//        );
//      }).toList(),
//    );
//  }
//}


class TutorialActivitiesScreen extends StatefulWidget {

  final String tutorialHeading;

  final List<Tutorial> tutorialActivities;

  TutorialActivitiesScreen({
        @required this.tutorialHeading,
        @required this.tutorialActivities,
        Key key}) {
    tutorialActivities.sort((a, b) => (a.activityClassificationOrder).compareTo(b.activityClassificationOrder));
  }

  @override
  _StepperState createState() => _StepperState();
}

class _StepperState extends State<TutorialActivitiesScreen> {

  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.tutorialHeading),
        ),
        body:  Container(
          margin: EdgeInsets.only(top: 10),
          child: _builderStep(widget.tutorialActivities)
        )
    );
  }


  Widget _builderStep(List<Tutorial> tutorials) {

    List<Step> steps = List<Step>();

    for (int i = 1; i < tutorials.length; i++) {
      steps.add(
        Step(
            title: Text("${tutorials[i].activityHeading}"),
            state: StepState.editing,
            isActive: true,
            content: CarouselWithIndicator(tutorials[i].tutorialActivities)
        ),
      );
    }

    if (steps.isEmpty) {
      return Center(
        child: Text("Under construction ..."),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Stepper(
          steps: steps,
          currentStep: _index,
          onStepTapped: (index) {
            setState(() {
              _index = index;
            });
          },
          controlsBuilder: (BuildContext context,
              {VoidCallback onStepContinue, VoidCallback onStepCancel}) =>
              Container(),
        ),
      );
    }
  }

}

class CarouselWithIndicator extends StatefulWidget {

  final List<TutorialActivity> activities;

  List<Widget> content = List<Widget>();

  CarouselWithIndicator(this.activities) {
    for (final activity in this.activities) {
      content.add(
          Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Container(
                color: Colors.red,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("${activity.content}"),
                )
              ),
            ),
          )
      );




    }
  }

  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: widget.content,
        autoPlay: false,
        enlargeCenterPage: false,
        aspectRatio: 1.5,
        enableInfiniteScroll: false,
        onPageChanged: (index) {
          setState(() {
            _current = index;
          });
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: map<Widget>(
          widget.content,
              (index, url) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4)),
            );
          },
        ),
      ),
    ]);
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }


}



