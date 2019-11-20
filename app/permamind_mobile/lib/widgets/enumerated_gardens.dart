import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind_mobile/arch_bricks/arch_bricks.dart';
import 'package:permamind_mobile/blocs/blocs.dart';
import 'package:permamind_mobile/widgets/widgets.dart';
import 'package:permamind_mobile/screens/screens.dart';

class EnumeratedGardens extends StatelessWidget {
  EnumeratedGardens({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<GardensBloc, GardensState>(
      builder: (context, state) {
        if (state is GardensLoaded) {
          final gardens = state.gardens;
          final gardensBloc = BlocProvider.of<GardensBloc>(context);

          return Padding(
              padding: EdgeInsets.all(10.0),
              child: ListView.builder(
                key: ArchSampleKeys.todoList,
                itemCount: gardens.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkResponse(
                    enableFeedback: true,
                    child: GardenItem(name: gardens[index].gardenName, membersCount: gardens[index].gardenMembers.length.toString(), index: index),
                    onTap: () async {
                      final removedTodo = await Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) {
                            return DetailsGardenScreen(garden: gardens[index]);
                          })
                      );
                      if (removedTodo != null) {
                        Scaffold.of(context).showSnackBar(DeleteTodoSnackBar(
                          key: ArchSampleKeys.snackbar,
                          garden: gardens[index],
                          onUndo: () => gardensBloc.dispatch(AddGarden(gardens[index])),
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