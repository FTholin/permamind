//import 'package:authentication/authentication.dart';
//import 'package:data_repository/data_repository.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/foundation.dart';
//import 'package:flutter/widgets.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:permamind/arch_bricks/arch_bricks.dart';
//import 'package:permamind/blocs/blocs.dart';
//import 'package:permamind/widgets/widgets.dart';
//import 'package:permamind/screens/screens.dart';
//
//class EnumeratedParcels extends StatelessWidget {
//
//  final String gardenId;
//  final DataRepository _dataRepository;
//  final User _user;
//
//  EnumeratedParcels({Key key, @required this.gardenId, @required DataRepository dataRepository, @required User user})
//      : assert(dataRepository != null),
//        assert(user != null),
//        _user = user,
//        _dataRepository = dataRepository,
//        super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//
//    return BlocBuilder<ParcelsBloc, ParcelsState>(
//        builder: (context, state) {
//          if (state is ParcelsLoaded) {
//            final parcels = state.parcels;
//            if (parcels.isEmpty) {
//              return Center(
//                child: Text("Aucune parcelle pour le moment.\n N'hésites pas à en ajouter ! "),
//              );
//            } else {
//              return Padding(
//                  padding: EdgeInsets.all(10.0),
//                  child: ListView.builder(
//                    key: ArchSampleKeys.todoList,
//                    itemCount: parcels.length,
//                    itemBuilder: (BuildContext context, int index) {
//                      return InkResponse(
//                        enableFeedback: true,
//                        child: ParcelItem(name: parcels[index].name, modelingName: parcels[index].currentModelingName, membersCount: parcels[index].members.length.toString(), index: index, dayActivitiesCount: parcels[index].dayActivitiesCount),
//                        onTap: () async {
//                          final alteredParcel = await Navigator.of(context).push(
//                              MaterialPageRoute(
//
//                                  builder: (_) {
//                                    return MultiBlocProvider(
//                                      providers: [
//                                        BlocProvider.value(
//                                            value: BlocProvider.of<ParcelsBloc>(context)),
//                                        BlocProvider(
//                                          create: (context) => ActivitiesBloc(
//                                              dataRepository: _dataRepository,
//                                              parcelsBloc: BlocProvider.of<ParcelsBloc>(context),
//                                              parcelId: parcels[index].id
//                                          )..add(LoadActivities()),
//                                        ),
//                                        BlocProvider(
//                                          create: (context) => DesignBloc(
//                                              dataRepository: _dataRepository,
//                                              activitiesBloc: BlocProvider.of<ActivitiesBloc>(context),
//                                              parcelId: parcels[index].id
//                                          )..add(LoadDesign()),
//                                        ),
//                                      ],
//                                      child: DetailsParcelScreen(gardenId: gardenId, dataRepository: _dataRepository, parcel: parcels[index], user: _user),
//                                    );
//
//
//                                  })
//                          );
//                        if (alteredParcel != null) {
//
//                          if (alteredParcel['action'] == 'Delete') {
//                            final snackBar = SnackBar(
//                              content: Text('Delete ${alteredParcel['garden'].name}'),
//                              action: SnackBarAction(
//                                label: 'Undo',
//                                onPressed: () {
//                                  BlocProvider.of<GardensBloc>(context).add(CopyGarden(alteredParcel['garden']));
//                                  BlocProvider.of<GardensBloc>(context).add(CopyActivities(alteredParcel['activities']));
//                                },
//                              ),
//                            );
//
//                            Scaffold.of(context).showSnackBar(snackBar);
//
//                          } else {
//
//                            final snackBar = SnackBar(
//                              content: Text('Leave ${alteredParcel['garden'].name}'),
//                              action: SnackBarAction(
//                                label: 'Undo',
//                                onPressed: () {
//                                  BlocProvider.of<GardensBloc>(context).add(UpdateGarden(alteredParcel['garden']));
//                                },
//                              ),
//                            );
//
//                            Scaffold.of(context).showSnackBar(snackBar);
//                          }
//
//                        }
//                        },
//                      );
//                     },
//                  )
//              );
//            }
//
//          } else {
//            return Container();
//          }
//        }
//    );
//  }
//}