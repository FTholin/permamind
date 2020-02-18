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

  final DataRepository _dataRepository;
  final User _user;

  EnumeratedParcels({Key key, @required DataRepository dataRepository, @required User user})
      :
        assert(dataRepository != null),
        assert(user != null),
        _user = user,
        _dataRepository = dataRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ParcelsBloc, ParcelsState>(
        builder: (context, state) {
          if (state is ParcelsLoaded) {
            final parcels = state.parcels;

            return Padding(
                padding: EdgeInsets.all(10.0),
                child: ListView.builder(
                  key: ArchSampleKeys.todoList,
                  itemCount: parcels.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkResponse(
                      enableFeedback: true,
                      child: ParcelItem(name: parcels[index].name, modelingName: parcels[index].modelingName, membersCount: parcels[index].members.length.toString(), index: index, dayActivitiesCount: parcels[index].dayActivitiesCount),
                      onTap: () async {
                        final removedParcel = await Navigator.of(context).push(
                            MaterialPageRoute(

                                builder: (_) {

                                  return MultiBlocProvider(
                                    providers: [
                                      BlocProvider<ActivitiesBloc>(
                                        create: (context) => ActivitiesBloc(
                                            dataRepository: _dataRepository,
                                            parcelsBloc: BlocProvider.of<ParcelsBloc>(context),
                                            parcelId: parcels[index].id
                                        )..add(LoadActivities()),
                                      ),
//                                      BlocProvider<DesignBloc>(
//                                        create: (BuildContext context) => DesignBloc(
//                                            dataRepository: _dataRepository,
//                                            activitiesBloc: BlocProvider.of<ActivitiesBloc>(context),
//                                            parcelId: parcels[index].id
//                                        )..add(LoadDesign()),
//                                      )
                                    ],
                                    child: DetailsParcelScreen(parcelId: parcels[index].id, user: _user),
                                  );

                                })
                        );
                        if (removedParcel != null) {

                          if (removedParcel['action'] == 'Delete') {
                            final snackBar = SnackBar(
                              content: Text('Delete ${removedParcel['parcel'].name}'),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  BlocProvider.of<ParcelsBloc>(context).add(ParcelCopied(removedParcel['parcel']));
                                  BlocProvider.of<ParcelsBloc>(context).add(ActivitiesCopied(removedParcel['activities']));
                                },
                              ),
                            );

                            Scaffold.of(context).showSnackBar(snackBar);

                          } else {

                            final snackBar = SnackBar(
                              content: Text('Leave ${removedParcel['parcel'].name}'),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  BlocProvider.of<ParcelsBloc>(context).add(ParcelUpdated(removedParcel['parcel']));
                                },
                              ),
                            );

                            Scaffold.of(context).showSnackBar(snackBar);
                          }

                        }
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