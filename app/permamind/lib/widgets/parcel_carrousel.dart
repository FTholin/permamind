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
//  final List<ParcelCarouselData> parcels;

  ParcelCarouselWithIndicator(this.garden, this.user);

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
    return BlocBuilder<ParcelsBloc, ParcelsState>(builder: (context, state) {
      if (state is ParcelsLoadSuccess) {
        return CarouselSlider(
          items: loadCarouselContent(context, state.parcels),
          autoPlay: false,
          enlargeCenterPage: true,
          height: 17 * SizeConfig.heightMultiplier,
          viewportFraction: 0.8,
          enableInfiniteScroll: false,
          onPageChanged: (index) {
            setState(() {
              _current = index;
            });
          },
        );
      } else {
        return CircularProgressIndicator();
      }
    });
  }

  List<Widget> loadCarouselContent(BuildContext context, List<Parcel> parcels) {
    final parcelsBloc = BlocProvider.of<ParcelsBloc>(context);

    List<Widget> carouselContent = List<Widget>();
    for (final parcel in parcels) {
      carouselContent.add(
          InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return MultiBlocProvider(
                    providers: [
                      BlocProvider<ParcelsBloc>.value(value: parcelsBloc),
                      BlocProvider(
                        create: (context) => ActivitiesBloc(
                          parcelsBloc.dataRepository,
                        ),
                      ),
                    ],
                    child: DetailsParcelScreen(
                      user: widget.user,
                      gardenId: widget.garden.id,
                      parcelId: parcel.id,
                    ),
                  );
                },
              ),
            );
          },
          child:  ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            child: Container(
                color: Colors.green,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("${parcel.name}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize:
                                2.5 * SizeConfig.textMultiplier)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        FutureBuilder<int>(
                          future: parcelsBloc.dataRepository.parcelDayActivitiesCounting(parcel.id),
                          builder: (BuildContext context,
                              AsyncSnapshot<int> snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data == 0) {
                                if (parcel.isActive == false) {
                                  return Text(
                                      "En attente",
                                      style: TextStyle(
                                          color: const Color(0xFF01534F),
                                          fontSize: 2.2 *
                                              SizeConfig.textMultiplier));
                                } else {
                                  return Text(
                                      "Pas d'activités à réaliser aujourd'hui.",
                                      style: TextStyle(
                                          color: const Color(0xFF01534F),
                                          fontSize: 1.8 *
                                              SizeConfig.textMultiplier));
                                }
                              } else if (snapshot.data == 1) {
                                return Text(
                                    "${snapshot.data} activité à réaliser aujourd'hui.",
                                    style: TextStyle(
                                        color: const Color(0xFF01534F),
                                        fontSize: 1.8 *
                                            SizeConfig.textMultiplier));
                              } else {
                                return Text(
                                    "${snapshot.data} activités à réaliser aujourd'hui.",
                                    style: TextStyle(
                                        color: const Color(0xFF01534F),
                                        fontSize: 1.8 *
                                            SizeConfig.textMultiplier));
                              }
                            } else {
                              return CircularProgressIndicator();
                            }
                          },
                        )

                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("${parcel.currentModelingName}",
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
          )
      );
    }
    carouselContent.add(
        Container(
      margin: EdgeInsets.all(5.0),
      child: InkWell(
          onTap: () async {

            final int gardenParcelCounter = await BlocProvider.of<GardensBloc>(context).dataRepository.gardenParcelsCounting(widget.garden.id);

            if (widget.user.accountStatus == 0 && gardenParcelCounter >= 3) {

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // TODO Peaufiner ce dialog pour le rentre propre
                  return AlertDialog(
                    title: new Text("Nombre de parcelle dépassé"),
                    content: new Text("Passer à la version premium pour profiter pleinement de l'offre"),
                    actions: <Widget>[
                      // usually buttons at the bottom of the dialog
                      new FlatButton(
                        child: new Text("Close"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            } else {
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return MultiBlocProvider(
                          providers: [
                            BlocProvider<ParcelsBloc>.value(value: parcelsBloc),
                            BlocProvider<ModelingsBloc>(
                              create: (context) => ModelingsBloc(
                                  dataRepository: parcelsBloc.dataRepository)
                                ..add(FetchVeggies()),
                            )
                          ],
                          child: AddParcelScreen(
                            garden: widget.garden,
                            user: widget.user,
                            dataRepository: parcelsBloc.dataRepository,
                          ));
                    },
                  ));
            }
          },
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
