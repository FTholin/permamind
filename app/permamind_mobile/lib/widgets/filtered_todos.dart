import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind_mobile/arch_bricks/arch_bricks.dart';
import 'package:permamind_mobile/blocs/blocs.dart';
import 'package:permamind_mobile/widgets/widgets.dart';
import 'package:permamind_mobile/screens/screens.dart';
import 'package:permamind_mobile/arch_bricks/flutter_gardens_keys.dart';

class FilteredGardens extends StatelessWidget {
  FilteredGardens({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gardensBloc = BlocProvider.of<GardensBloc>(context);
    final localizations = ArchSampleLocalizations.of(context);

    return BlocBuilder<FilteredGardensBloc, FilteredGardensState>(
      builder: (context, state) {
        if (state is FilteredGardensLoading) {
          return LoadingIndicator(key: ArchSampleKeys.gardensLoading);
        } else if (state is FilteredGardensLoaded) {
          final gardens = state.filteredGardens;

          return GridView.builder(
            key: ArchSampleKeys.todoList,
            itemCount: gardens.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return InkResponse(
                enableFeedback: true,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: GridTile(
                      footer: Text(
                        '${gardens[index].id}',
                        textAlign: TextAlign.center,
                      ),
                      child: Icon(Icons.local_florist,
                          size: 40.0, color: Colors.white30),
                    ),
                  ),
                  color: Colors.blue[400],
                  margin: EdgeInsets.all(10.0),
                ),
                onTap: () async {
                  final removedTodo = await Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) {
                        return DetailsScreen(id: gardens[index].id);
                      })
                  );
                  if (removedTodo != null) {
                    Scaffold.of(context).showSnackBar(DeleteTodoSnackBar(
                      key: ArchSampleKeys.snackbar,
                      todo: gardens[index],
                      onUndo: () => gardensBloc.dispatch(AddTodo(gardens[index])),
                      localizations: localizations,
                    ));
                  }
                },
              );

            },
          );

        }
        else {
          return Container(key: FlutterGardensKeys.filteredGardensEmptyContainer);
        }
      }
    );
  }
}