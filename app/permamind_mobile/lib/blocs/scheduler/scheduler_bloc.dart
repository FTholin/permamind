import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:permamind_mobile/blocs/blocs.dart';


class SchedulerBloc extends Bloc<SchedulerEvent, SchedulerState> {
  final GardensBloc gardensBloc;
  final String gardenId;
  StreamSubscription gardensSubscription;

  SchedulerBloc({@required this.gardensBloc, @required this.gardenId}) {
    gardensSubscription = gardensBloc.listen((state) {
      if (state is GardensLoaded) {
        // TODO Ajouter une vérification lorsque l'on a supprimé un jardin et que c'est justement celui-ci
        add(UpdateScheduler(
            state.gardens.singleWhere(
                    (garden) => garden.id == gardenId).schedule
        ));
      }
    });
  }

  @override
  SchedulerState get initialState {
    return gardensBloc.state is GardensLoaded
        ? SchedulerLoaded(
      (gardensBloc.state as GardensLoaded).gardens.singleWhere(
              (garden) => garden.id == gardenId).schedule,
    )
        : SchedulerLoading();
  }

  @override
  Stream<SchedulerState> mapEventToState(SchedulerEvent event) async* {
    if (event is UpdateScheduler) {
      yield* _mapScheduleUpdatedToState(event);
    }
  }
//
//  Stream<SchedulerState> _mapUpdateFilterToState(
//      UpdateFilter event,
//      ) async* {
//    if (gardensBloc.state is TodosLoaded) {
//      yield SchedulerLoaded(
//        _mapTodosToScheduler(
//          (gardensBloc.state as TodosLoaded).todos,
//          event.filter,
//        ),
//        event.filter,
//      );
//    }
//  }
//
  Stream<SchedulerState> _mapScheduleUpdatedToState(
      UpdateScheduler event,
      ) async* {
    yield SchedulerLoaded(event.schedule);
  }

  @override
  Future<void> close() {
    gardensSubscription.cancel();
    return super.close();
  }
}
