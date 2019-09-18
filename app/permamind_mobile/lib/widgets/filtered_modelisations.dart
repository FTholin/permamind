import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind_mobile/arch_bricks/arch_bricks.dart';
import 'package:permamind_mobile/blocs/blocs.dart';
import 'package:permamind_mobile/widgets/widgets.dart';
import 'package:permamind_mobile/screens/screens.dart';
import 'package:permamind_mobile/arch_bricks/flutter_todos_keys.dart';

class FilteredModelisations extends StatelessWidget {
  FilteredModelisations({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final todosBloc = BlocProvider.of<TodosBloc>(context);
    final localizations = ArchSampleLocalizations.of(context);

    return BlocBuilder<ModelisationsBloc, ModelisationsState>(
        builder: (context, state) {
          if (state is ModelisationsLoading) {
            return LoadingIndicator(key: ArchSampleKeys.todosLoading);
          } else if (state is ModelisationsLoaded) {
            final todos = state.plantsFetched;

            return GridView.builder(
              key: ArchSampleKeys.todoList,
              itemCount: todos.length,
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
                          '${todos[index].id}',
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
                          return DetailsScreen(id: todos[index].id);
                        })
                    );
                    if (removedTodo != null) {
                      Scaffold.of(context).showSnackBar(DeleteTodoSnackBar(
                        key: ArchSampleKeys.snackbar,
                        todo: todos[index],
                        onUndo: () => todosBloc.dispatch(AddTodo(todos[index])),
                        localizations: localizations,
                      ));
                    }
                  },
                );

              },
            );

          }
          else {
            return Container(key: FlutterTodosKeys.filteredTodosEmptyContainer);
          }
        }
    );
  }
}