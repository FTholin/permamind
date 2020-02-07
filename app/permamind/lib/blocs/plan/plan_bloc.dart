import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:meta/meta.dart';
import 'package:permamind/blocs/blocs.dart';


class PlanBloc extends Bloc<PlanEvent, PlanState> {

  final String gardenId;
  final ActivitiesBloc activitiesBloc;
  StreamSubscription _planSubscription;
  final DataRepository dataRepository;


  PlanBloc({@required this.dataRepository,
            @required this.activitiesBloc,
            @required this.gardenId}) {
//    _planSubscription = activitiesBloc.listen((state) {
//      if (state is ActivitiesLoaded) {
//        add(UpdatePlan(state));
//      }
//    });
  }

  @override
  PlanState get initialState => PlanLoading();


  @override
  Stream<PlanState> mapEventToState(PlanEvent event) async* {
    if (event is LoadPlan) {
      yield* _mapLoadPlanToState();
    } else if (event is PlanUpdated) {
      yield* _mapPlanUpdatedToState(event);
    } else if (event is UpdatePlan) {
      yield* _mapUpdatePlanToState(event);
    }
  }

  Stream<PlanState> _mapUpdatePlanToState(
      UpdatePlan event,
      ) async* {
  }

  Stream<PlanState> _mapLoadPlanToState() async* {
    _planSubscription?.cancel();
    _planSubscription = dataRepository.loadGardenPlans(gardenId).listen(
          (plans) {
        add(PlanUpdated(plans.first));
      },
    );
  }

  Stream<PlanState> _mapPlanUpdatedToState(PlanUpdated event) async* {
    yield PlanLoaded(event.plan);
  }



  @override
  Future<void> close() {
    _planSubscription.cancel();
    return super.close();
  }
}