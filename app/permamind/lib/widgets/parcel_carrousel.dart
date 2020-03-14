import 'package:arch/arch.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ParcelCarouselWithIndicator extends StatefulWidget {

//  final List<TutorialActivity> activities;

  List<String> activities = ["a"];

  List<Widget> content = List<Widget>();

  ParcelCarouselWithIndicator(this.activities) {
    for (final activity in this.activities) {
      content.add(
          InkWell(
            onTap: () => print("Container pressed"),
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Container(
                  color: const Color(0xFF4FB06E),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                                "Bac terrasse",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 2.5 * SizeConfig.textMultiplier
                                )
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                                "Vous avez 4 tâches à effectuer",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 2 * SizeConfig.textMultiplier
                                )
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                                "Les trois soeurs",
                                style: TextStyle(
                                    color: Color.fromRGBO(214, 211, 94, 1),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 2 * SizeConfig.textMultiplier
                                )
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
      );
    }
    content.add(
        Container(
          margin: EdgeInsets.all(5.0),
          child: InkWell(
              onTap: () => print("Container pressed"), // handle your onTap here
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Container(
                  color: Color.fromRGBO(214, 211, 94, 1),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.add, size: 28, color: Colors.white,),
                            Text(
                                "Ajouter une parcelle",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 2.5 * SizeConfig.textMultiplier
                                )
                            ),
                          ],
                        ),
                        Text(
                          "Cliquer ici pour ajouter une parcelle à votre potager",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 2 * SizeConfig.textMultiplier,
                          ),
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ),
              )
          ),
        )
    );
  }

  @override
  _ParcelCarouselWithIndicatorState createState() => _ParcelCarouselWithIndicatorState();
}

class _ParcelCarouselWithIndicatorState extends State<ParcelCarouselWithIndicator> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.content,
      autoPlay: false,
      enlargeCenterPage: true,
      height: 17 * SizeConfig.heightMultiplier,
//      aspectRatio: 3.5,
//      viewportFraction: 0.9,
      enableInfiniteScroll: false,
      onPageChanged: (index) {
        setState(() {
          _current = index;
        });
      },

    );
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }


}