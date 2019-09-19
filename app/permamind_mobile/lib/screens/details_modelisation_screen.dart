import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind_mobile/arch_bricks/arch_bricks.dart';
import 'package:permamind_mobile/blocs/blocs.dart';
import 'package:permamind_mobile/screens/screens.dart';
import 'package:permamind_mobile/arch_bricks/flutter_todos_keys.dart';

class DetailsModelisationScreen extends StatelessWidget {
  final String id;

  DetailsModelisationScreen({Key key, @required this.id})
      : super(key: key ?? ArchSampleKeys.todoDetailsScreen);

  @override
  Widget build(BuildContext context) {
    final todosBloc = BlocProvider.of<TodosBloc>(context);
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (BuildContext context, TodosState state) {
        final todo = (state as TodosLoaded)
            .todos
            .firstWhere((todo) => todo.id == id, orElse: () => null);
        final localizations = ArchSampleLocalizations.of(context);
        return Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
//                tooltip: localizations.deleteTodo,
//                key: ArchSampleKeys.deleteTodoButton,
                icon: Icon(Icons.favorite),
                onPressed: () {
//                  todosBloc.dispatch(DeleteTodo(todo));
                  Navigator.pop(context, todo);
                },
              )
            ],
          ),
          body: Container(
            child: Column(
              children: <Widget>[

              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
              key: ArchSampleKeys.editTodoFab,
              tooltip: localizations.editTodo,
              child: Icon(Icons.edit),
              onPressed: todo == null
                  ? null
                  : () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) {
                          return AddEditScreen(
                            key: ArchSampleKeys.editTodoScreen,
                            onSave: (task, note) {
                              todosBloc.dispatch(
                                  UpdateTodo(
                                    todo.copyWith(task: task, note: note),
                                  )
                              );
                            },
                            isEditing: true,
                            todo: todo,
                          );
                        })
                );
              }
          ),
        );
      },
    );
  }
}