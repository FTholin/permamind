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

class EnumeratedGardens extends StatelessWidget {
  final DataRepository _dataRepository;
  final User _user;

  EnumeratedGardens(
      {Key key, @required DataRepository dataRepository, @required User user})
      : assert(dataRepository != null),
        assert(user != null),
        _user = user,
        _dataRepository = dataRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GardensBloc, GardensState>(
        builder: (context, state) {
      if (state is GardensLoaded) {
        final gardens = state.gardens;

        return Padding(
            padding: EdgeInsets.all(10.0),
            child: ListView.builder(
              key: ArchSampleKeys.todoList,
              itemCount: gardens.length,
              itemBuilder: (BuildContext context, int index) {
                return InkResponse(
                  enableFeedback: true,
                  child: GardenItem(
                      name: gardens[index].name,
                      membersCount: gardens[index].members.length.toString(),
                      index: index,
                      dayActivitiesCount: gardens[index].dayActivitiesCount),
                  onTap: () async {
                    final alteredGarden = await Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) {

                      return BlocProvider<ParcelsBloc>(
                        create: (context) => ParcelsBloc(
                            gardensBloc: BlocProvider.of<GardensBloc>(context),
                            dataRepository: _dataRepository)
                          ..add(LoadParcels(gardens[index].id, _user.pseudo, _user.id)),
                        child: DetailsGardenScreen(gardenId: gardens[index].id, user: _user, dataRepository: _dataRepository,),);


                    }));
                    if (alteredGarden != null) {
                      if (alteredGarden['action'] == 'Delete') {
                        final snackBar = SnackBar(
                          content:
                              Text('Delete ${alteredGarden['garden'].name}'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              BlocProvider.of<GardensBloc>(context)
                                  .add(CopyGarden(alteredGarden['garden']));
                              BlocProvider.of<GardensBloc>(context).add(
                                  CopyActivities(alteredGarden['activities']));
                            },
                          ),
                        );

                        Scaffold.of(context).showSnackBar(snackBar);
                      } else {
                        final snackBar = SnackBar(
                          content:
                              Text('Leave ${alteredGarden['garden'].name}'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              BlocProvider.of<GardensBloc>(context)
                                  .add(UpdateGarden(alteredGarden['garden']));
                            },
                          ),
                        );

                        Scaffold.of(context).showSnackBar(snackBar);
                      }
                    }
                  },
                );
              },
            ));
      } else {
        return Container();
      }
    });
  }
}
