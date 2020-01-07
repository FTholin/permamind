import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/screens/screens.dart';
import 'package:permamind/arch_bricks/flutter_todos_keys.dart';

// TODO La detail screen sera a changé plus tard nous mettrons les tâches courantes à réaliser dans le jardin
//class DetailsScreen extends StatelessWidget {
//  final String id;
//
//  DetailsScreen({Key key, @required this.id})
//      : super(key: key ?? ArchSampleKeys.todoDetailsScreen);
//
//  @override
//  Widget build(BuildContext context) {
//    final todosBloc = BlocProvider.of<TodosBloc>(context);
//    return BlocBuilder<TodosBloc, TodosState>(
//      builder: (BuildContext context, TodosState state) {
//        final todo = (state as TodosLoaded)
//            .todos
//            .firstWhere((todo) => todo.id == id, orElse: () => null);
//        final localizations = ArchSampleLocalizations.of(context);
//        return Scaffold(
//          appBar: AppBar(
//            title: Text(localizations.todoDetails),
//            actions: <Widget>[
//              IconButton(
//                tooltip: localizations.deleteTodo,
//                key: ArchSampleKeys.deleteTodoButton,
//                icon: Icon(Icons.delete),
//                onPressed: () {
//                  todosBloc.dispatch(DeleteTodo(todo));
//                  Navigator.pop(context, todo);
//                },
//              )
//            ],
//          ),
//          body: todo == null
//              ? Container(key: FlutterTodosKeys.emptyDetailsContainer)
//              : Padding(
//            padding: EdgeInsets.all(16.0),
//            child: ListView(
//              children: <Widget>[
//                Row(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Padding(
//                      padding: EdgeInsets.only(right:8.0),
//                      child: Checkbox(
//                          key: FlutterTodosKeys.detailsScreenCheckBox,
//                          value: todo.complete,
//                          onChanged: (_) {
//                            todosBloc.dispatch(
//                              UpdateTodo(
//                                todo.copyWith(complete: !todo.complete),
//                              )
//                            );
//                          }),
//                    ),
//                    Expanded(
//                      child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Hero(
//                            tag: '${todo.id}__heroTage',
//                            child: Container(
//                              width: MediaQuery.of(context).size.width,
//                              padding: EdgeInsets.only(
//                                top: 8.0,
//                                bottom: 16.0,
//                              ),
//                              child: Text(
//                                "Coucou",
//                                key: ArchSampleKeys.detailsTodoItemTask,
//                                style: Theme.of(context).textTheme.headline,
//                              ),
//                            ),
//                          ),
//                          Text(
//                            todo.note,
//                            key: ArchSampleKeys.detailsTodoItemNote,
//                            style: Theme.of(context).textTheme.subhead,
//                          )
//                        ],
//                      ),
//                    )
//                  ],
//                )
//              ],
//            ),
//          ),
//          floatingActionButton: FloatingActionButton(
//            key: ArchSampleKeys.editTodoFab,
//            tooltip: localizations.editTodo,
//            child: Icon(Icons.edit),
//            onPressed: todo == null
//                ? null
//                : () {
//              Navigator.of(context).push(
//                MaterialPageRoute(
//                    builder: (context) {
//                      return AddEditScreen(
//                        key: ArchSampleKeys.editTodoScreen,
//                        onSave: (task, note) {
//                          todosBloc.dispatch(
//                            UpdateTodo(
//                              todo.copyWith(task: task, note: note),
//                            )
//                          );
//                        },
//                        isEditing: true,
//                        todo: todo,
//                      );
//                    })
//              );
//            }
//          ),
//        );
//      },
//    );
//  }
//}