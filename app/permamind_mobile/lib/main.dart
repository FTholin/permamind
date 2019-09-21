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


  BlocSupervisor.delegate = SimpleBlocDelegate();
  
  final userRepository = UserRepository();

  final firebaseRepository = FirebaseTodosRepository();

  final authenticationBloc = AuthenticationBloc(userRepository: userRepository);
  
  runApp(
      MultiBlocProvider(
                    providers: [
                      BlocProvider<AuthenticationBloc>(
                        builder: (context) {
                          return authenticationBloc..dispatch(AppStarted());
                        },
                      ),
                      BlocProvider<TodosBloc>(
                        builder: (context) {
                          return TodosBloc(authenticationBloc, firebaseRepository)..dispatch(TodosInit());
                        },
                      ),
                    ],
        child: App(userRepository: userRepository, firebaseRepository: firebaseRepository),
      )
  );
}

class App extends StatelessWidget {

  final UserRepository userRepository;

  final FirebaseTodosRepository firebaseRepository;

  App({@required this.userRepository, @required this.firebaseRepository});

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

                  final todosBloc = BlocProvider.of<TodosBloc>(context);

                  return MultiBlocProvider(
                    providers: [
                      BlocProvider<TabBloc>(
                        builder: (context) => TabBloc(),
                      ),
                      BlocProvider<FilteredTodosBloc>(
                        builder: (context) =>
                            FilteredTodosBloc(todosBloc: todosBloc),
                      ),
                      BlocProvider<StatsBloc>(
                        builder: (context) => StatsBloc(todosBloc: todosBloc),
                      ),
                    ],
                    child: HomeScreen(),
                  );
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
          '/addParcel' : (context) {

            final todosBloc = BlocProvider.of<TodosBloc>(context);

            return MultiBlocProvider(
              providers: [
                BlocProvider<ModellingsBloc>(
                  builder: (context) =>
                  ModellingsBloc(todosRepository: firebaseRepository)..dispatch(FetchModellings()),
                ),
            ],
            child: DiscoverModellingsScreen(),
            );
          }
        },
      );
  }
}