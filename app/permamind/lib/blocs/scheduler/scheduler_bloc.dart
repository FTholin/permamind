import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:meta/meta.dart';
import 'package:permamind/blocs/blocs.dart';


class SchedulerBloc extends Bloc<SchedulerEvent, SchedulerState> {

  final GardensBloc gardensBloc;
  final String gardenId;
  StreamSubscription gardensSubscription;
  StreamSubscription _activitiesSubscription;

  final DataRepository dataRepository;


  SchedulerBloc({
    @required this.dataRepository,
    @required this.gardensBloc,
    @required this.gardenId}) {
    gardensSubscription = gardensBloc.listen((state) {
      if (state is GardensLoaded) {
        print("GardensLoaded");
      }
    });
  }

  @override
  SchedulerState get initialState => ActivitiesLoading();

  @override
  Stream<SchedulerState> mapEventToState(SchedulerEvent event) async* {
//    if (event is UpdateScheduler) {
//      yield* _mapScheduleUpdatedToState(event);
//    } else if (event is SelectDayActivities) {
//      yield* _mapSelectDayActivitiesToState(event);
//    }
//    else if (event is UpdateGardenActivities) {
//      yield* _mapUpdateGardenActivitiesToState(event);
//    }

    if (event is LoadActivities) {
      yield* _mapLoadActivitiesToState();
    }
  }

  Stream<SchedulerState> _mapLoadActivitiesToState() async* {
    _activitiesSubscription?.cancel();
    _activitiesSubscription = dataRepository.fetchGardenActivities(gardenId).listen(
          (activities) => add(ActivitiesUpdated(activities)),
    );
  }

//  Stream<SchedulerState> _mapSelectDayActivitiesToState(SelectDayActivities event) async* {
//   yield DayActivitiesLoaded(event.schedule, event.dayIndex);
//  }

//  Stream<SchedulerState> _mapUpdateGardenActivitiesToState(UpdateGardenActivities event) async* {
//    print("_mapUpdateGardenActivitiesToState");
////    gardensBloc.add(UpdateGarden(event.garden));
//    yield DayActivitiesLoaded(event.garden.schedule, 3);
//  }

//  Stream<SchedulerState> _mapScheduleUpdatedToState(
//      UpdateScheduler event,
//      ) async* {
//    yield SchedulerLoaded(event.schedule);
//  }

  @override
  Future<void> close() {
    gardensSubscription.cancel();
    _activitiesSubscription.cancel();
    return super.close();
  }
}
