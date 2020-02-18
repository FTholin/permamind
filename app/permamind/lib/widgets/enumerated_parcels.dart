import 'package:authentication/authentication.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/widgets/widgets.dart';
import 'package:permamind/screens/screens.dart';

class EnumeratedParcels extends StatelessWidget {

//  final DataRepository _dataRepository;
//  final User _user;

//  EnumeratedParcels({Key key, @required DataRepository dataRepository, @required User user})
//      :
//        assert(dataRepository != null),
//        assert(user != null),
//        _user = user,
//        _dataRepository = dataRepository,
//        super(key: key);

  EnumeratedParcels();

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ParcelsBloc, ParcelsState>(
        builder: (context, state) {
          if (state is ParcelsLoaded) {
            final gardens = state.parcels;

            return Padding(
                padding: EdgeInsets.all(10.0),
                child: ListView.builder(
                  key: ArchSampleKeys.todoList,
                  itemCount: gardens.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkResponse(
                      enableFeedback: true,
                      child: ParcelItem(name: gardens[index].name, modelingName: gardens[index].modelingName, membersCount: gardens[index].members.length.toString(), index: index, dayActivitiesCount: gardens[index].dayActivitiesCount),
                      onTap: () async {
//                        final removedParcel = await Navigator.of(context).push(
//                            MaterialPageRoute(
//
//                                builder: (_) {
//
////                            return BlocProvider(
////                                create: (context) => ActivitiesBloc(
////                                    dataRepository:_dataRepository,
////                                    gardensBloc: BlocProvider.of<ParcelsBloc>(context),
////                                    gardenId: gardens[index].id
////                                )..add(LoadActivities()),
////                                child:
////                            );
//
//                                  return MultiBlocProvider(
//                                    providers: [
//                                      BlocProvider<ActivitiesBloc>(
//                                        create: (context) => ActivitiesBloc(
//                                            dataRepository:_dataRepository,
//                                            gardensBloc: BlocProvider.of<ParcelsBloc>(context),
//                                            gardenId: gardens[index].id
//                                        )..add(LoadActivities()),
//                                      ),
//                                      BlocProvider<DesignBloc>(
//                                        create: (BuildContext context) => DesignBloc(
//                                            dataRepository: _dataRepository,
//                                            activitiesBloc: BlocProvider.of<ActivitiesBloc>(context),
//                                            gardenId: gardens[index].id
//                                        )..add(LoadDesign()),
//                                      )
//                                    ],
//                                    child: DetailsParcelScreen(gardenId: gardens[index].id, user: _user),
//                                  );
//
//                                })
//                        );
//                        if (removedParcel != null) {
//
//                          if (removedParcel['action'] == 'Delete') {
//                            final snackBar = SnackBar(
//                              content: Text('Delete ${removedParcel['garden'].name}'),
//                              action: SnackBarAction(
//                                label: 'Undo',
//                                onPressed: () {
//                                  BlocProvider.of<ParcelsBloc>(context).add(CopyParcel(removedParcel['parcel']));
//                                  BlocProvider.of<ParcelsBloc>(context).add(CopyActivities(removedParcel['activities']));
//                                },
//                              ),
//                            );
//
//                            Scaffold.of(context).showSnackBar(snackBar);
//
//                          } else {
//
//                            final snackBar = SnackBar(
//                              content: Text('Leave ${removedParcel['garden'].name}'),
//                              action: SnackBarAction(
//                                label: 'Undo',
//                                onPressed: () {
//                                  BlocProvider.of<ParcelsBloc>(context).add(UpdateParcel(removedParcel['garden']));
//                                },
//                              ),
//                            );
//
//                            Scaffold.of(context).showSnackBar(snackBar);
//                          }
//
//                        }
                      },
                    );
                  },
                )
            );
          } else {
            return Container();
          }
        }
    );
  }
}