import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/screens/screens.dart';
import 'package:data_repository/data_repository.dart';
import 'package:authentication/authentication.dart';
import 'arch_bricks/arch_bricks.dart';
import 'blocs/simple_bloc_delegate.dart';

void main() {

  // add this, and it should be the first line in main method
  WidgetsFlutterBinding.ensureInitialized();


  BlocSupervisor.delegate = SimpleBlocDelegate();

  final userRepository = UserRepository();

  final firebaseRepository = FirebaseDataRepository();

  final authenticationBloc = AuthenticationBloc(userRepository: userRepository);


  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthenticationBloc>(
        create: (context) {
          return authenticationBloc..add(AppStarted());
        },
      ),
      BlocProvider<GardensBloc>(
        create: (context) {
          return GardensBloc(authenticationBloc, firebaseRepository)
            ..add(GardensInit());
        },
      ),
      BlocProvider<ThemeBloc>(
        create: (context) => ThemeBloc(),
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

                      return MultiBlocProvider(
                        providers: [
                          BlocProvider<TabBloc>(
                            create: (context) => TabBloc(),
                          ),
                          BlocProvider<TutorialsBloc>(
                            create: (context) =>
                            TutorialsBloc(dataRepository: firebaseRepository)
                              ..add(LoadTutos()),
                          ),
                        ],
                        child: HomeScreen(dataRepository: firebaseRepository, user: state.userAuthenticated),
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

                return BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    if (state is Authenticated) {
                      return AddGardenScreen(user: state.userAuthenticated, dataRepository: firebaseRepository);
                    }
                    else if (state is Unauthenticated) {
                      return LoginScreen(userRepository: userRepository);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                );

              },
//              '/discoverModelings': (context) {
//                return BlocProvider<ModelingsBloc>(
//                  create: (context) =>
//                  ModelingsBloc(dataRepository: firebaseRepository)
//                    ..add(FetchModelings()),
//                  child: DiscoverModelingsScreen(),
//                );
//              },
//              '/detailsModeling': (context) {
//                return BlocBuilder<AuthenticationBloc, AuthenticationState>(
//                  builder: (context, state) {
//                    if (state is Authenticated) {

//                      return DetailsModelingScreen(
//                          onSaveGarden: (gardenName, publicVisibility,
//                              gardenMembers, modelingId, modelingName, gardenLength,
//                              gardenWidth, gardenGround,
//                              schedule, designs
//                              ) async {
//
//                            gardenMembers.add(GardenMember(id: state.userAuthenticated.id, pseudo: state.userAuthenticated.pseudo));
////
////                            BlocProvider.of<GardensBloc>(context).add(
////                              AddGarden(Garden(gardenName, gardenLength,
////                                  gardenWidth, gardenGround,
////                                  publicVisibility,
////                                  state.userAuthenticated.id,
////                                  gardenMembers,
////                                  modelingId,
////                                  modelingName,
////                                  DateTime.now(), 0),
////                                  schedule
////                              ),
////                            );
//
//                            BlocProvider.of<GardensBloc>(context).add(AddDesignParcel(await firebaseRepository.fetchIdGardenCreated(gardenName), designs));
//
//                          }
//                      );
//                    }
//                    return Center(child: CircularProgressIndicator());
//                  },
//                );
//              },
              '/addParcel' : (context) {
                return AddParcelScreen();
              },
              '/settings': (context) {
                return SettingsScreen();
              },
              '/settingsGarden': (context) {
                return SettingsGardenScreen();
              },
              "/joinGarden": (context) {
                 return JoinGardenScreen();
              },
              '/tutorialActivities': (context) {
                return TutorialActivitiesScreen();
              }
//              '/' : (context) {
//                BlocProvider(
//                  create: (BuildContext context) => SchedulerBloc(),
//                  child: ChildA(),
//                );
//              }
            },
          );
        }
    );
  }
}
