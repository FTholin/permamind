import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind_mobile/blocs/blocs.dart';
import 'package:permamind_mobile/screens/screens.dart';
import 'package:todos_repository/todos_repository.dart';
import 'package:authentication/authentication.dart';
import 'arch_bricks/arch_bricks.dart';
import 'blocs/simple_bloc_delegate.dart';

void main() {
//  BlocSupervisor.delegate = SimpleBlocDelegate();
//  final userRepository = UserRepository();
//
//  runApp(App(userRepository: userRepository));


/*
TODO
  - Rajouter AppStarted Event dans TodosBloc comme AuthenticationBloc
  - Remettre TodosBloc comme avant dans un multiBlocProvider
  - Rajouter dans FirebaseTodosBloc un lien à AuthenticationBloc
    -> Voir Bloc-to-Bloc Communication
  - Voir pour requeter sur Firestore
*/


  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      builder: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..dispatch(AppStarted());
      },
      child: App(userRepository: userRepository),
    ),
  );
}

class App extends StatelessWidget {

  final UserRepository userRepository;

  App({@required this.userRepository});

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
        title: FlutterBlocLocalizations().appTitle,
        theme: ArchSampleTheme.theme,
        localizationsDelegates: [
          ArchSampleLocalizationsDelegate(),
          FlutterBlocLocalizationsDelegate(),
        ],
        routes: {
          '/': (context) {
            return BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                if (state is Authenticated) {
//
//                  return BlocProvider<TodosBloc>(
//                    builder: (context) => TodosBloc(
//                            todosRepository: FirebaseTodosRepository(),
//                          )..dispatch(LoadTodos()),
//                    child: context.,
//                  );

//                  return MultiBlocProvider(
//                    providers: [
//                        BlocProvider<TodosBloc>(
//                        builder: (context) {
//                          return TodosBloc(
//                            todosRepository: FirebaseTodosRepository(),
//                          )..dispatch(LoadTodos());
//                        },
//                      ),
//                      BlocProvider<TabBloc>(
//                        builder: (context) => TabBloc(),
//                      ),
//                      BlocProvider<FilteredTodosBloc>(
//                        builder: (context) =>
//                            FilteredTodosBloc(todosBloc: todosBloc),
//                      ),
//                      BlocProvider<StatsBloc>(
//                        builder: (context) => StatsBloc(todosBloc: todosBloc),
//                      ),
//                    ],
//                    child: HomeScreen(),
//                  );
                }
                if (state is Unauthenticated) {
                  return LoginScreen(userRepository: userRepository);
                }
                return Center(child: CircularProgressIndicator());
              },
            );
          },
          '/addTodo': (context) {
            final todosBloc = BlocProvider.of<TodosBloc>(context);
            return AddEditScreen(
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