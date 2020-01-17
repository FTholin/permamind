import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:permamind/blocs/blocs.dart';


class SchedulerBloc extends Bloc<SchedulerEvent, SchedulerState> {

  final GardensBloc gardensBloc;
  final String gardenId;
  StreamSubscription gardensSubscription;

  SchedulerBloc({@required this.gardensBloc, @required this.gardenId}) {
    gardensSubscription = gardensBloc.listen((state) {
      if (state is GardensLoaded) {
//        add(UpdateScheduler(
//            state.gardens.singleWhere(
//                    (garden) => garden.id == gardenId).schedule
//        ));
      }
    });
  }

  @override
  SchedulerState get initialState {
//    return gardensBloc.state is GardensLoaded
//        ? SchedulerLoaded(
//      (gardensBloc.state as GardensLoaded).gardens.singleWhere(
//              (garden) => garden.id == gardenId).schedule,
//    )
//        : SchedulerLoading();
  }

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
    return super.close();
  }
}
