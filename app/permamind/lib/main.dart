import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/screens/contact_us_screen.dart';
import 'package:permamind/screens/screens.dart';
import 'package:data_repository/data_repository.dart';
import 'package:authentication/authentication.dart';
import 'package:arch/arch.dart';
import 'arch_bricks/arch_bricks.dart';
import 'blocs/simple_bloc_delegate.dart';

void main() {
  // add this, and it should be the first line in main method
  WidgetsFlutterBinding.ensureInitialized();

//  BlocSupervisor.delegate = SimpleBlocDelegate();

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
      BlocProvider<ThemeBloc>(
        create: (context) => ThemeBloc(),
      ),
      BlocProvider<GardensBloc>(
        create: (context) {
          return GardensBloc(firebaseRepository);
        },
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

    return LayoutBuilder(
        builder: (context, constraints) {
      return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
              return MaterialApp(
//        title: FlutterBlocLocalizations().appTitle,
                theme: themeState.theme,
                localizationsDelegates: [
                  const AppLocalizationsDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  DefaultCupertinoLocalizations.delegate
                ],
                supportedLocales: [
                  const Locale('en', ''),
                  const Locale('fr', ''),
                ],
                initialRoute: '/',
//        routes: {
//              '/': (context) {
//                return BlocBuilder<AuthenticationBloc, AuthenticationState>(
//                  builder: (context, state) {
//                    if (state is Authenticated) {
//
//                      return MultiBlocProvider(
//                        providers: [
//                          BlocProvider<TabBloc>(
//                            create: (context) => TabBloc(),
//                          ),
//                          BlocProvider<TutorialsBloc>(
//                            create: (context) =>
//                            TutorialsBloc(dataRepository: firebaseRepository)
//                              ..add(LoadTutos()),
//                          ),
//                        ],
//                        child: HomeScreen(dataRepository: firebaseRepository, user: state.userAuthenticated),
//                      );
//                    }
//                    if (state is Unauthenticated) {
//                      return LoginScreen(userRepository: userRepository);
//                    }
//                    return Center(child: CircularProgressIndicator());
//                  },
//                );
//              },
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
//          '/GardenAdded': (context) {},
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
////                              GardenAdded(Garden(gardenName, gardenLength,
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
//          '/settings': (context) {
//            return SettingsScreen();
//          },
//          '/settingsGarden': (context) {
//            return SettingsGardenScreen();
//          },
//          "/joinGarden": (context) {
//            return JoinGardenScreen();
//          },
//          '/tutorialActivities': (context) {
//            return TutorialActivitiesScreen();
//          }
//              '/' : (context) {
//                BlocProvider(
//                  create: (BuildContext context) => SchedulerBloc(),
//                  child: ChildA(),
//                );
//              }
//        },
                onGenerateRoute: (settings) {
                  if (settings.name == "/")  {

                    return PageRouteBuilder(
                        pageBuilder: (_, __, ___) =>
                            BlocBuilder<AuthenticationBloc, AuthenticationState>(
                              builder: (context, state) {
                                if (state is Authenticated) {
                                  BlocProvider.of<GardensBloc>(context).add(GardensLoadedSuccess(state.userAuthenticated.id, state.userAuthenticated.pseudo));
                                return MultiBlocProvider(
                                    providers: [
                                      BlocProvider<TabBloc>(
                                        create: (context) => TabBloc(),
                                      ),
                                      BlocProvider<TutorialsBloc>(
                                        create: (context) => TutorialsBloc(
                                            dataRepository: firebaseRepository)
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
                            ));

                  } else if (settings.name == '/GardenAdded') {

                    return PageRouteBuilder(
                        pageBuilder: (_, __, ___) =>
                            BlocBuilder<AuthenticationBloc, AuthenticationState>(
                              builder: (context, state) {
                                if (state is Authenticated) {
                                  return GardenAddedScreen(
                                      user: state.userAuthenticated,
                                      dataRepository: firebaseRepository);
                                } else if (state is Unauthenticated) {
                                  return LoginScreen(userRepository: userRepository);
                                } else {
                                  return Center(child: CircularProgressIndicator());
                                }
                              },
                            ),
                      transitionsBuilder: (
                          BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          Widget child,
                          ) =>
                          ScaleTransition(
                            scale: Tween<double>(
                              begin: 0.0,
                              end: 1.0,
                            ).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.fastOutSlowIn,
                              ),
                            ),
                            child: child,
                          ),
                    );

                  } else if (settings.name == '/addParcel') {

                    final AddParcelScreenArguments args =
                        settings.arguments;

                    return PageRouteBuilder(
                      pageBuilder: (_, __, ___) =>
                          BlocBuilder<AuthenticationBloc, AuthenticationState>(
                            builder: (context, state) {
                              if (state is Authenticated) {

                                return BlocProvider<ModelingsBloc>(
                                  create: (context) =>
                                  ModelingsBloc(dataRepository: firebaseRepository)
                                    ..add(FetchVeggies()),
                                  child: AddParcelScreen(
                                    garden: args.garden,
                                    user: state.userAuthenticated,
                                    dataRepository: firebaseRepository,
                                  ),
                                );
                              } else if (state is Unauthenticated) {
                                return LoginScreen(userRepository: userRepository);
                              } else {
                                return Center(child: CircularProgressIndicator());
                              }
                            },
                          ),
                      transitionsBuilder: (
                          BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          Widget child,
                          ) =>
                          ScaleTransition(
                            scale: Tween<double>(
                              begin: 0.0,
                              end: 1.0,
                            ).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.fastOutSlowIn,
                              ),
                            ),
                            child: child,
                          ),
                    );

                  } else if (settings.name == '/contactUs') {
                    return PageRouteBuilder(
                      pageBuilder: (_, __, ___) =>
                          BlocBuilder<AuthenticationBloc, AuthenticationState>(
                            builder: (context, state) {
                              if (state is Authenticated) {
//                                return ContactUsScreen(user: state.userAuthenticated);
                              return ContactUsScreen();
                              } else if (state is Unauthenticated) {
                                return LoginScreen(userRepository: userRepository);
                              } else {
                                return Center(child: CircularProgressIndicator());
                              }
                            },
                          ),
                      transitionsBuilder: (
                          BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          Widget child,
                          ) =>
                          ScaleTransition(
                            scale: Tween<double>(
                              begin: 0.0,
                              end: 1.0,
                            ).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.fastOutSlowIn,
                              ),
                            ),
                            child: child,
                          ),
                    );
                  }
                  else if (settings.name == "/settings") {

                    final SettingsScreenArguments args = settings.arguments;

                    return MaterialPageRoute(builder: (context) => SettingsScreen(args.userId));

                  } else if (settings.name == "/settingsGarden") {

                    return MaterialPageRoute(
                        builder: (context) => SettingsGardenScreen());

                  } else if (settings.name == "/eula") {
                    return MaterialPageRoute(
                        builder: (context) => EulaScreen());
                  } else if (settings.name == "/acknowledgement") {
                    return MaterialPageRoute(
                        builder: (context) => AcknowledgementScreen());
                  }
                  else if (settings.name == "/joinGarden") {

                    return MaterialPageRoute(builder: (context) => JoinGardenScreen());

                  } else if (settings.name == "/tutorialActivities") {

                    return MaterialPageRoute(
                        builder: (context) => TutorialActivitiesScreen());

                  } else {
                    return PageRouteBuilder(
                        pageBuilder: (_, __, ___) =>
                            BlocBuilder<AuthenticationBloc, AuthenticationState>(
                              builder: (context, state) {
                                if (state is Authenticated) {
                                  return MultiBlocProvider(
                                    providers: [
                                      BlocProvider<TabBloc>(
                                        create: (context) => TabBloc(),
                                      ),
                                      BlocProvider<TutorialsBloc>(
                                        create: (context) => TutorialsBloc(
                                            dataRepository: firebaseRepository)
                                          ..add(LoadTutos()),
                                      ),
                                    ],
                                    child: HomeScreen(
                                        dataRepository: firebaseRepository,),
                                  );
                                }
                                if (state is Unauthenticated) {
                                  return LoginScreen(userRepository: userRepository);
                                }
                                return Center(child: CircularProgressIndicator());
                              },
                            ));

                  }
                },
              );
            });

          });
        }
    );
  }
}
