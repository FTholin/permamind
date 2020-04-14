import 'package:arch/arch.dart';
import 'package:authentication/authentication.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/widgets/widgets.dart';
import 'package:permamind/screens/screens.dart';

class EnumeratedGardens extends StatelessWidget {
  final DataRepository _dataRepository;
  final User user;

  EnumeratedGardens(
      {Key key, @required DataRepository dataRepository, @required User user})
      : assert(dataRepository != null),
        user = user,
        _dataRepository = dataRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<GardensBloc, GardensState>(
        builder: (context, state) {
          if (state is GardensLoadSuccess) {

            List<Garden> gardens = state.gardens as List<Garden>;

            gardens.sort((a, b) => a.creationDate.compareTo(b.creationDate));

            // Si aucun jardin
            if (gardens.length == 0) {
              return Padding(
                padding: EdgeInsets.all(
                  1 * SizeConfig.heightMultiplier,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                        flex: 1,
                        child: Image.asset(
                          'assets/empty_states/empty_garden.png',
                          fit: BoxFit.scaleDown,
                        )),
                    Flexible(
                        flex: 1,
                        child: Text(
                            "Ajoutez votre premier jardin pour débuter l'aventure avec Permamind !",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF01534F),
                              fontSize: 2.5 * SizeConfig.textMultiplier,
//                          fontWeight: FontWeight.bold,
                            )))
                  ],
                ),
              );
            } else {
              return Column(
                children: <Widget>[
                  Expanded(
                      child: ListView.builder(
                        itemCount: gardens.length,
                        itemBuilder: (context, i) {
                          return BlocProvider(
                            create: (BuildContext context) => ParcelsBloc(
                                gardensBloc: BlocProvider.of<GardensBloc>(context),
                                dataRepository: _dataRepository,
                                user: user
                            )..add(ParcelsLoadedSuccess(gardens[i].id, user.id, user.pseudo)),
                            child: GardenItem(
                              name: gardens[i].name,
                              garden: gardens[i],
                              user: user,
                              index: i,
                              dataRepository: _dataRepository,
                            ),
                          );
                        },
                      )
                  ),

                ],
              );
            }
          } else {
            return Container();
          }
        });

//    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
//    builder: (context, state) {
//      if (state is Authenticated) {
//        final user =  state.userAuthenticated;
////        return BlocBuilder<GardensBloc, GardensState>(
////            builder: (context, state) {
////              if (state is GardensLoadSuccess) {
////
////                List<Garden> gardens = state.gardens as List<Garden>;
////
////                gardens.sort((a, b) => a.creationDate.compareTo(b.creationDate));
////
////                // Si aucun jardin
////                if (gardens.length == 0) {
////                  return Padding(
////                    padding: EdgeInsets.all(
////                      1 * SizeConfig.heightMultiplier,
////                    ),
////                    child: Column(
////                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////                      children: <Widget>[
////                        Flexible(
////                            flex: 1,
////                            child: Image.asset(
////                              'assets/empty_states/empty_garden.png',
////                              fit: BoxFit.scaleDown,
////                            )),
////                        Flexible(
////                            flex: 1,
////                            child: Text(
////                                "Ajoutez votre premier jardin pour débuter l'aventure avec Permamind !",
////                                textAlign: TextAlign.center,
////                                style: TextStyle(
////                                  color: const Color(0xFF01534F),
////                                  fontSize: 2.5 * SizeConfig.textMultiplier,
//////                          fontWeight: FontWeight.bold,
////                                )))
////                      ],
////                    ),
////                  );
////                } else {
////                  return Column(
////                    children: <Widget>[
////                      Expanded(
////                          child: ListView.builder(
////                            itemCount: gardens.length,
////                            itemBuilder: (context, i) {
////                              return BlocProvider(
////                                create: (BuildContext context) => ParcelsBloc(
////                                    gardensBloc: BlocProvider.of<GardensBloc>(context),
////                                    dataRepository: _dataRepository,
////                                    user: user
////                                )..add(ParcelsLoadedSuccess(gardens[i].id, user.id, user.pseudo)),
////                                child: GardenItem(
////                                  name: gardens[i].name,
////                                  garden: gardens[i],
////                                  user: user,
////                                  index: i,
////                                  dayActivitiesCount: 0,
////                                ),
////                              );
////                            },
////                          )
////                      ),
////
////                    ],
////                  );
////                }
////              } else {
////                return Container();
////              }
////            });
//
//      } else {
//        return Container();
//      }
//    });

  }
}
