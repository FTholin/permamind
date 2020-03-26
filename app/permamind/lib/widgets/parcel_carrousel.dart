import 'package:arch/arch.dart';
import 'package:authentication/authentication.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/models/parcel_carousel_data.dart';
import 'package:permamind/screens/add_parcel_screen.dart';
import 'package:permamind/screens/screens.dart';

class ParcelCarouselWithIndicator extends StatefulWidget {
  final User user;
  final Garden garden;

  final List<ParcelCarouselData> parcels;

  ParcelCarouselWithIndicator(this.parcels, this.garden, this.user);

  @override
  _ParcelCarouselWithIndicatorState createState() =>
      _ParcelCarouselWithIndicatorState();
}

class _ParcelCarouselWithIndicatorState
    extends State<ParcelCarouselWithIndicator> {
  int _current = 0;

  List<Widget> content = List<Widget>();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: loadCarouselContent(context),
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

  List<Widget> loadCarouselContent(BuildContext context) {
    List<Widget> carouselContent = List<Widget>();

    for (final parcel in widget.parcels) {
      carouselContent.add(InkWell(
        onTap: () =>  Navigator.pushNamed(
          context,
          '/detailsParcel',
          arguments: DetailsParcelScreenArguments(
              widget.garden.id,
              parcel.parcelId
          ),
        ),
        child: Container(
          color: Colors.green,
          child: Stack(
            children: <Widget>[
//              Positioned(
//                top: 6 * SizeConfig.heightMultiplier,
//                left: 55 * SizeConfig.widthMultiplier,
//                child: Image.asset(
//                  'assets/utils_image/tree.png',
//                  width: 20 * SizeConfig.widthMultiplier,
//                ),
//              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Container(
//                color: Colors.green,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("${parcel.parcelName}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 2.5 * SizeConfig.textMultiplier)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text("Vous avez ${parcel.dayActivitiesCount} tâches à effectuer",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 2 * SizeConfig.textMultiplier)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text("${parcel.modelingName}",
                                style: TextStyle(
                                    color: Color.fromRGBO(214, 211, 94, 1),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 2 * SizeConfig.textMultiplier)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ));
    }
    carouselContent.add(
        Container(
      margin: EdgeInsets.all(5.0),
      child: InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            '/addParcel',
            arguments: AddParcelScreenArguments(
              widget.garden,
              widget.user
            ),
          ),// handle your onTap here
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
                        Icon(
                          Icons.add,
                          size: 28,
                          color: Colors.white,
                        ),
                        Text("Ajouter une parcelle",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 2.5 * SizeConfig.textMultiplier)),
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
          )),
    ));

    return carouselContent;
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }
}
