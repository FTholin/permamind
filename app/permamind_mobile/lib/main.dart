import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind_mobile/blocs/blocs.dart';
import 'package:permamind_mobile/screens/screens.dart';
import 'package:data_repository/data_repository.dart';
import 'package:authentication/authentication.dart';
import 'arch_bricks/arch_bricks.dart';
import 'blocs/simple_bloc_delegate.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final userRepository = UserRepository();

  final firebaseRepository = FirebaseDataRepository();

  final authenticationBloc = AuthenticationBloc(userRepository: userRepository);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthenticationBloc>(
        builder: (context) {
          return authenticationBloc..dispatch(AppStarted());
        },
      ),
      BlocProvider<GardensBloc>(
        builder: (context) {
          return GardensBloc(authenticationBloc, firebaseRepository)
            ..dispatch(GardensInit());
        },
      ),
      BlocProvider<ThemeBloc>(
        builder: (context) => ThemeBloc(),
      ),
    ],
    child: App(
        userRepository: userRepository, firebaseRepository: firebaseRepository),
  ));
}

class App extends StatelessWidget {


  final UserRepository userRepository;

  final FirebaseDataRepository firebaseRepository;

  App({@required this.userRepository, @required this.firebaseRepository});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            title: FlutterBlocLocalizations().appTitle,
            theme: themeState.theme,
            localizationsDelegates: [
              ArchSampleLocalizationsDelegate(),
              FlutterBlocLocalizationsDelegate(),
            ],
            routes: {
              '/': (context) {
                return BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    if (state is Authenticated) {
                      final gardensBloc = BlocProvider.of<GardensBloc>(context);

                      return MultiBlocProvider(
                        providers: [
                          BlocProvider<TabBloc>(
                            builder: (context) => TabBloc(),
                          ),
                          BlocProvider<StatsBloc>(
                            builder: (context) =>
                                StatsBloc(gardensBloc: gardensBloc),
                          ),
                          BlocProvider<TutorialsBloc>(
                            builder: (context) =>
                            TutorialsBloc(tutosRepository: firebaseRepository)
                              ..dispatch(LoadTutos()),
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
//        '/addTodo': (context) {
//          final gardensBloc = BlocProvider.of<GardensBloc>(context);
//          return AddEditScreen(
//            onSave: (task, note) {
//              gardensBloc.dispatch(
//                Add(Todo(task, note: note)),
//              );
//            },
//            isEditing: false,
//          );
//        },
              '/addGarden': (context) {
                final gardensBloc = BlocProvider.of<GardensBloc>(context);
//            return MultiBlocProvider(
//              providers: [
//                BlocProvider<ModelingsBloc>(
//                  builder: (context) =>
//                  ModelingsBloc(gardensRepository: firebaseRepository)..dispatch(FetchModelings()),
//                ),
//            ],
//            child: DiscoverModelingsScreen(),
//            );
                return AddEditGardenScreen(
                  dataProvider: firebaseRepository,
//              onSave: (task, note) {
//                gardensBloc.dispatch(
//                  AddTodo(Todo(task, note: note)),
//                );
//              },
                  isEditing: false,
                );
              },
              '/discoverModelings': (context) {
                return BlocProvider<ModelingsBloc>(
                  builder: (context) =>
                  ModelingsBloc(dataRepository: firebaseRepository)
                    ..dispatch(FetchModelings()),
                  child: DiscoverModelingsScreen(),
                );
              },
              '/detailsModeling': (context) {
                return BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    if (state is Authenticated) {
                      final gardensBloc = BlocProvider.of<GardensBloc>(context);
                      return DetailsModelingScreen(
                          onSaveGarden: (gardenName, publicVisibility,
                              gardenMembers, modelisationId) {
                            List<String> allGardenMembers = new List.from(
                                [state.userId])
                              ..addAll(gardenMembers);
                            gardensBloc.dispatch(
                              AddGarden(Garden(gardenName, publicVisibility,
                                  allGardenMembers, modelisationId)),
                            );
                          }
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                );
              },
              '/settings': (context) {
                return SettingsScreen();
              }
            },
          );
        }
    );
  }
}
