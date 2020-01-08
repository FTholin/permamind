import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/widgets/widgets.dart';
import 'package:permamind/screens/screens.dart';

class EnumeratedGardens extends StatelessWidget {
  EnumeratedGardens({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<GardensBloc, GardensState>(
      builder: (context, state) {
        if (state is GardensLoaded) {
          final gardens = state.gardens;
          final gardensBloc = BlocProvider.of<GardensBloc>(context);

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
                      final removedTodo = await Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) {

                            return BlocProvider(
                                create: (context) => SchedulerBloc(gardensBloc: gardensBloc, gardenId: gardens[index].id),
                                child: DetailsGardenScreen(garden: gardens[index]),
                            );

                          })
                      );
                      if (removedTodo != null) {
                        Scaffold.of(context).showSnackBar(DeleteGardenSnackBar(
                          key: ArchSampleKeys.snackbar,
                          garden: gardens[index],
                          onUndo: () => gardensBloc.add(AddGarden(gardens[index])),
                          localizations: localizations,
                        ));
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