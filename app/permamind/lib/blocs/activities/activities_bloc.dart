import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:meta/meta.dart';
import 'package:permamind/blocs/blocs.dart';

class ActivitiesBloc extends Bloc<ActivitiesEvent, ActivitiesState> {

  final DataRepository dataRepository;
  StreamSubscription _activitiesSubscription;
  DateTime referenceDate;

  ActivitiesBloc(this.dataRepository){
    DateTime now = new DateTime.now();
    referenceDate = new DateTime(now.year, now.month, now.day, 1);
  }

  @override
  ActivitiesState get initialState => ActivitiesLoadInProgress();

  @override
  Stream<ActivitiesState> mapEventToState(event) async* {
    if (event is ActivitiesLoadedSuccess) {
      yield* _mapActivitiesLoadedToState(event);
    } else if (event is ActivitiesUpdated) {
      yield* _mapActivitiesUpdatedToState(event);
    } else if (event is ActivityUpdated) {
      yield* _mapActivityUpdatedToState(event);
    }
  }

  Stream<ActivitiesState> _mapActivitiesLoadedToState(ActivitiesLoadedSuccess event) async* {
    _activitiesSubscription?.cancel();
    _activitiesSubscription = dataRepository.loadParcelActivities(event.parcelId, event.start, event.last).listen(
          (activities) {
        final Map<DateTime, List> mapActivities = Map<DateTime, List>();

        activities.forEach( (item) {
          if (mapActivities[item.expectedDate] == null) {
            mapActivities[item.expectedDate] = [item];
          } else {
            mapActivities[item.expectedDate].addAll([item]);
          }
        });
        add(ActivitiesUpdated(mapActivities));
      },
    );
  }

  Stream<ActivitiesState> _mapActivitiesUpdatedToState(ActivitiesUpdated event) async* {
    yield ActivitiesLoadSuccess(referenceDate, event.activities);
  }

  Stream<ActivitiesState> _mapActivityUpdatedToState(ActivityUpdated event) async* {
    dataRepository.updateActivity(event.updatedActivity);
  }

  @override
  Future<void> close() {
    _activitiesSubscription?.cancel();
    return super.close();
  }

}







//class ActivitiesBloc extends Bloc<ActivitiesEvent, ActivitiesState> {
//
//  final ParcelsBloc parcelsBloc;
//
//  final DataRepository dataRepository;
//  DateTime referenceDate;
//
//  ActivitiesBloc({
//    @required this.dataRepository,
//    @required this.parcelsBloc,
//  }) {
//    DateTime now = new DateTime.now();
//    referenceDate = new DateTime(now.year, now.month, now.day, 1);
//  }
//
//  @override
//  ActivitiesState get initialState => ActivitiesLoadInProgress();
//
//    @override
//    Stream<ActivitiesState> mapEventToState(ActivitiesEvent event) async* {
//
//      if (event is ActivitiesLoadedSuccess) {
//        yield* _mapActivitiesLoadedToState(event);
//      } else if (event is ActivitiesUpdated) {
//        yield* _mapActivitiesUpdateToState(event);
//      }  else if (event is SelectDayActivities) {
//        yield* _mapSelectDayActivitiesToState(event);
//      } else if (event is ActivityUpdated) {
//        yield* _mapUpdateActivityToState(event);
//      } else if (event is AddActivity) {
//        yield* _mapAddActivityToState(event);
//      } else if (event is ActivitiesDeletedFromParcel) {
//        yield* _mapDeleteActivitiesToState(event);
//      } else {
//        print("ERROR MapEventToState event: $event");
//      }
//
//    }
//
//
//  Stream<ActivitiesState> _mapActivitiesLoadedToState(ActivitiesLoadedSuccess event) async* {
//    _activitiesSubscription?.cancel();
//    _activitiesSubscription = dataRepository.loadParcelActivities(event.parcelId, event.start, event.last).listen(
//          (activities) {
//        final Map<DateTime, List> mapActivities = Map<DateTime, List>();
//
//        activities.forEach( (item) {
//          if (mapActivities[item.expectedDate] == null) {
//            mapActivities[item.expectedDate] = [item];
//          } else {
//            mapActivities[item.expectedDate].addAll([item]);
//          }
//        });
//        add(ActivitiesUpdated(mapActivities));
//      },
//    );
//  }
//
//

//
//  Stream<ActivitiesState> _mapSelectDayActivitiesToState(SelectDayActivities event) async* {
//    referenceDate =  event.selectedDay;
//    yield ActivitiesLoadSuccess(referenceDate, event.dayActivities);
//  }
//
//  Stream<ActivitiesState> _mapDeleteActivitiesToState(ActivitiesDeletedFromParcel event) async* {
//    dataRepository.deleteActivitiesFromParcel(event.parcelId);
//  }
//
//
//  Stream<ActivitiesState> _mapUpdateActivityToState(ActivityUpdated event) async* {
//    dataRepository.updateActivity(event.updatedActivity);
//  }
//
//  Stream<ActivitiesState> _mapAddActivityToState(AddActivity event) async* {
//    dataRepository.addNewActivity(event.newActivity);
//  }
//
//
//  @override
//  Future<void> close() {
//    _activitiesSubscription.cancel();
//    return super.close();
//  }
//
//
//}

