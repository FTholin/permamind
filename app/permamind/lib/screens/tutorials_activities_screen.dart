import 'package:carousel_slider/carousel_slider.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';


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
  TutorialActivities createState() => TutorialActivities();
}

class TutorialActivities extends State<TutorialActivitiesScreen> {

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
            isActive: i - 1 == _index,
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
                color: const Color(0xFF01534F),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Center(
                    child: Text(
                      "${activity.content}",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
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
//      RaisedButton(
//        padding: const EdgeInsets.all(8.0),
//        textColor: Colors.white,
//        color: Colors.blue,
//        onPressed: () => print("Boutton pressé"),
//        child: new Text("Continuer"),
//      ),
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



