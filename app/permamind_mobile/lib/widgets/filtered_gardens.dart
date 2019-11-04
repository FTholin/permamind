import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind_mobile/arch_bricks/arch_bricks.dart';
import 'package:permamind_mobile/blocs/blocs.dart';
import 'package:permamind_mobile/widgets/widgets.dart';
import 'package:permamind_mobile/screens/screens.dart';

class FilteredGardens extends StatelessWidget {
  FilteredGardens({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gardensBloc = BlocProvider.of<GardensBloc>(context);
    final localizations = ArchSampleLocalizations.of(context);

    return BlocBuilder<FilteredGardensBloc, FilteredGardensState>(
      builder: (context, state) {
        if (state is FilteredGardensLoading) {
          // TODO ArchSampleKeys
          return LoadingIndicator(key: ArchSampleKeys.todosLoading);
        } else if (state is FilteredGardensLoaded) {
          final gardens = state.filteredGardens;

          return ListView.builder(
              key: ArchSampleKeys.todoList,
              itemCount: gardens.length,
            itemBuilder: (BuildContext context, int index) {
              return InkResponse(
                enableFeedback: true,
                child: Container(
                  height: MediaQuery.of(context).size.height / 4.5,
                  margin: EdgeInsets.only(top: 14.0, left:15.0, right: 15.0),
                  child: Center(
                    child: GridTile(
                      footer: Text(
                        '${gardens[index].gardenName}',
                        textAlign: TextAlign.center,
                      ),
                      child: Icon(Icons.local_florist,
                          size: 40.0, color: Colors.white30),
                    ),
                  ),
                  color: Colors.blue[400],
                ),
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
                      localizations: localizations,
                    ));
                  }
                },
              );

//            return Container(
//              height: 100,
//              width: 100,
////              margin: EdgeInsets.all(10.0),
//              color: Colors.red,
//            );

            },
          );

        }
        else {
          // TODO FlutterTodosKeys
          return Container(key: FlutterTodosKeys.filteredTodosEmptyContainer);
        }
      }
    );
  }
}