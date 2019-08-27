import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_basic_architecture/arch_bricks/localization.dart';
import 'package:flutter_basic_architecture/blocs/blocs.dart';
import 'package:flutter_basic_architecture/screens/screens.dart';
//import 'package:flutter_basic_architecture/arch_bricks/arch_bricks.dart';
import 'package:todos_repository/todos_repository.dart';

import 'arch_bricks/arch_bricks.dart';
import 'blocs/simple_bloc_delegate.dart';

void main() {
  // BlocSupervisor oversees Blocs and delegates to BlocDelegate.
  // We can set the BlocSupervisor's delegate to an instance of `SimpleBlocDelegate`.
  // This will allow us to handle all transitions and errors in SimpleBlocDelegate.
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
    BlocProvider(
      builder: (context) {
        return TodosBloc(
          todosRepository: const TodosRepositoryFlutter(
            fileStorage: const FileStorage(
              '__flutter_bloc_app__',
              getApplicationDocumentsDirectory,
            ),
          ),
        )..dispatch(LoadTodos());
      },
      child: TodosApp(),
    ),
  );
}

class TodosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todosBloc = BlocProvider.of<TodosBloc>(context);
    return MaterialApp(
      title: FlutterBlocLocalizations().appTitle,
      theme: ArchSampleTheme.theme,
      localizationsDelegates: [
        ArchSampleLocalizationsDelegate(),
        FlutterBlocLocalizationsDelegate(),
      ],
      routes: {
        ArchSampleRoutes.home: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<TabBloc>(
                builder: (context) => TabBloc(),
              ),
              BlocProvider<FilteredTodosBloc>(
                builder: (context) => FilteredTodosBloc(todosBloc: todosBloc),
              ),
              BlocProvider<StatsBloc>(
                builder: (context) => StatsBloc(todosBloc: todosBloc),
              ),
            ],
            child: HomeScreen(),
          );
        },
        ArchSampleRoutes.addTodo: (context) {
          return AddEditScreen(
            key: ArchSampleKeys.addTodoScreen,
            onSave: (task, note) {
              todosBloc.dispatch(
                AddTodo(Todo(task, note: note)),
              );
            },
            isEditing: false,
          );
        },
      },
    );
  }
}
