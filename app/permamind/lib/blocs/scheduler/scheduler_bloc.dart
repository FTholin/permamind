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
  DateTime referenceDate;

  SchedulerBloc({
    @required this.dataRepository,
    @required this.gardensBloc,
    @required this.gardenId}) {
    DateTime now = new DateTime.now();
    referenceDate = new DateTime(now.year, now.month, now.day);

    gardensSubscription = gardensBloc.listen((state) {
      if (state is GardensLoaded) {
        add(LoadActivities(gardenId));
      }
    });
  }

  @override
  SchedulerState get initialState {
    return  ActivitiesLoading();
  }

    @override
    Stream<SchedulerState> mapEventToState(SchedulerEvent event) async* {
      if (event is LoadActivities) {
        yield* _mapLoadActivitiesToState();
      } else if (event is ScheduleUpdated) {
        yield* _mapScheduleUpdatedToState(event);
      } else if (event is UpdateActivity) {
        yield* _mapUpdateActivityToState(event);
      } else if (event is SelectDayActivities) {
        yield* _mapSelectDayActivitiesToState(event);
      }
    }

    Stream<SchedulerState> _mapLoadActivitiesToState() async* {
      _activitiesSubscription?.cancel();
      _activitiesSubscription = dataRepository.fetchGardenActivities(gardenId).listen(
            (activities) {

              final Map<DateTime, List> schedule = Map<DateTime, List>();

              activities.forEach( (item) {
                if (schedule[item.expectedDate] == null) {
                  schedule[item.expectedDate] = [item];
                } else {
                  schedule[item.expectedDate].addAll([item]);
                }
              });
              add(ScheduleUpdated(schedule));
            },
      );
    }

  Stream<SchedulerState> _mapScheduleUpdatedToState(ScheduleUpdated event) async* {
    yield ActivitiesLoaded(referenceDate, event.schedule);
  }

  Stream<SchedulerState> _mapUpdateActivityToState(UpdateActivity event) async* {
    dataRepository.updateActivity(event.updatedActivity);
    yield ActivitiesLoading();
  }


  Stream<SchedulerState> _mapSelectDayActivitiesToState(SelectDayActivities event) async* {
    referenceDate =  event.selectedDay;
   yield ActivitiesLoaded(referenceDate, event.dayActivities);
  }

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

