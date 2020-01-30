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
  final String _userId;

  EnumeratedGardens({Key key, @required DataRepository dataRepository, @required String userId})
      : assert(dataRepository != null),
        assert(userId != null),
        _userId = userId,
        _dataRepository = dataRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<GardensBloc, GardensState>(
      builder: (context, state) {
        if (state is GardensLoaded) {
          final gardens = state.gardens;

          final localizations = ArchSampleLocalizations.of(context);

          return Padding(
              padding: EdgeInsets.all(10.0),
              child: ListView.builder(
                key: ArchSampleKeys.todoList,
                itemCount: gardens.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkResponse(
                    enableFeedback: true,
                    child: GardenItem(name: gardens[index].name, modelingName: gardens[index].modelingName, membersCount: gardens[index].members.length.toString(), index: index),
                    onTap: () async {
                      final removedGarden = await Navigator.of(context).push(
                          MaterialPageRoute(

                              builder: (_) {

                            return BlocProvider(
                                create: (context) => ActivitiesBloc(
                                    dataRepository:_dataRepository,
                                    gardensBloc: BlocProvider.of<GardensBloc>(context),
                                    gardenId: gardens[index].id
                                )..add(LoadActivities()),
                                child: DetailsGardenScreen(gardenId: gardens[index].id, userId: _userId),
                            );

                          })
                      );
                      if (removedGarden != null) {

                        if (removedGarden['action'] == 'Delete') {
                          final snackBar = SnackBar(
                            content: Text('Delete ${removedGarden['garden'].name}'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                BlocProvider.of<GardensBloc>(context).add(CopyGarden(removedGarden['garden']));
                                BlocProvider.of<GardensBloc>(context).add(CopyActivities(removedGarden['activities']));
                              },
                            ),
                          );

                          Scaffold.of(context).showSnackBar(snackBar);

                        } else {

                          final snackBar = SnackBar(
                            content: Text('Leave ${removedGarden['garden'].name}'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                BlocProvider.of<GardensBloc>(context).add(UpdateGarden(removedGarden['garden']));
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