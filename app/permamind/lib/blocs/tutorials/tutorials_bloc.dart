import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:meta/meta.dart';
import 'package:permamind/blocs/blocs.dart';



class TutorialsBloc extends Bloc<TutorialsEvent, TutorialsState> {
  final FirebaseDataRepository dataRepository;

  TutorialsBloc({@required this.dataRepository});

  StreamSubscription _tutosSubscription;
//  StreamSubscription _activitiesSubscription;



  @override
  TutorialsState get initialState => TutosLoading();

  @override
  Stream<TutorialsState> mapEventToState(TutorialsEvent event) async* {
    if (event is LoadTutos) {
      yield* _mapLoadTutosToState();
    }
//    else if (event is LoadTutoActivities) {
//      yield* _mapLoadTutoActivitiesToState(event);
//    }
    else if (event is CompleteActivity) {
      yield* _mapCompleteActivityToState(event);
    } else if (event is TutosUpdated) {
      yield* _mapTutosUpdateToState(event);
    } else if (event is TutoActivitiesUpdated) {
      yield* _mapActivitiesUpdateToState(event);
    }
  }


  Stream<TutorialsState> _mapLoadTutosToState() async* {
    _tutosSubscription?.cancel();
    _tutosSubscription = dataRepository.loadTutorials().listen(
          (tutorials) {
            final Map<int, List<Tutorial>> mapTutorials = Map<int, List<Tutorial>>();

            tutorials.forEach( (item) {

              if (mapTutorials[item.tutorialClassificationOrder] == null) {
                mapTutorials[item.tutorialClassificationOrder] = [item];
              } else {
                mapTutorials[item.tutorialClassificationOrder].addAll([item]);
              }
            });

            add(TutosUpdated(mapTutorials),
        );
      },
    );
  }

//  Stream<TutorialsState> _mapLoadTutoActivitiesToState(LoadTutoActivities event) async* {
//    _activitiesSubscription?.cancel();
//    _activitiesSubscription = dataRepository.fetchTutoActivities(event.tutoId).listen(
//          (activities) {
//        add(
//          TutoActivitiesUpdated(activities),
//        );
//      },
//    );
//  }

  // TODO COnnect activities
//  Stream<TutorialsState> _mapLoadTutoActivitiesToState() async* {
//    _tutosSubscription = dataRepository.loadTutorials();
//  }

  Stream<TutorialsState> _mapCompleteActivityToState(
      CompleteActivity event) async* {

  }



  Stream<TutorialsState> _mapActivitiesUpdateToState(TutoActivitiesUpdated event) async* {
//    yield ActivitiesLoaded(event.activities);
  }


  Stream<TutorialsState> _mapTutosUpdateToState(TutosUpdated event) async* {
    yield TutosLoaded(event.tutorials);
  }

  @override
  void dispose() {
    _tutosSubscription?.cancel();
//    _activitiesSubscription?.cancel();
//    super.dispose();
  }
}