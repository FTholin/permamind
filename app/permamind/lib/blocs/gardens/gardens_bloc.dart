import 'dart:async';
import 'package:authentication/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:data_repository/data_repository.dart';

class GardensBloc extends Bloc<GardensEvent, GardensState> {
  final DataRepository _dataRepository;
  StreamSubscription _gardensSubscription;


  final AuthenticationBloc _authenticationBloc;
  StreamSubscription _authenticationBlocSubscription;

  GardensBloc(this._authenticationBloc, this._dataRepository) {
    _authenticationBlocSubscription = _authenticationBloc.listen((state) {
      // React to state changes here.
      // Dispatch events here to trigger changes in MyBloc.
      if (state is Authenticated) {
        add(LoadGardens(state.userAuthenticated.id));
      }
    });
  }

  @override
  GardensState get initialState => GardensNotLoaded();

  @override
  Stream<GardensState> mapEventToState(GardensEvent event) async* {
    if (event is LoadGardens) {
      yield* _mapLoadGardensToState(event);
    } else if (event is AddGarden) {
      yield* _mapAddGardenToState(event);
    } else if (event is UpdateGarden) {
      yield* _mapUpdateGardensToState(event);
    } else if (event is DeleteGarden) {
      yield* _mapDeleteGardensToState(event);
    } else if (event is ClearCompleted) {
      yield* _mapClearCompletedToState();
    } else if (event is GardensUpdated) {
      yield* _mapGardensUpdateToState(event);
    } else if (event is LeaveGarden) {
      yield* _mapLeaveGardensToState(event);
    } else if (event is CopyActivities) {
      yield* _mapCopyActivitiesToState(event);
    } else if (event is CopyGarden) {
      yield* _mapCopyGardenToState(event);
    }
  }

  Stream<GardensState> _mapLoadGardensToState(LoadGardens event) async* {
    final pseudo = (await _dataRepository.searchById(event.userId)).documents
        .first.data['pseudo'];
    _gardensSubscription?.cancel();
    _gardensSubscription = _dataRepository.gardens(event.userId, pseudo).listen(
          (gardens) {
//            var plans = _dataRepository.loadPlans(gardenId);
        add(GardensUpdated(gardens));
      },
    );
  }

  Stream<GardensState> _mapAddGardenToState(AddGarden event) async* {
    _dataRepository.addNewGarden(event.garden);
  }


  Stream<GardensState> _mapCopyActivitiesToState(
      CopyActivities schedule) async* {
    _dataRepository.addParcelActivities(schedule.activities);
  }


  Stream<GardensState> _mapUpdateGardensToState(UpdateGarden event) async* {
    _dataRepository.updateGarden(event.updatedGarden);
  }

  Stream<GardensState> _mapLeaveGardensToState(LeaveGarden event) async* {
    event.garden.members.removeWhere((item) => item.id == event.userId);
    _dataRepository.updateGarden(event.garden);
  }

  Stream<GardensState> _mapCopyGardenToState(CopyGarden event) async* {
    _dataRepository.copyGarden(event.garden);
  }

  Stream<GardensState> _mapDeleteGardensToState(DeleteGarden event) async* {
//    _dataRepository.deleteDesignParcel(event.garden.id);

    // TODO Récupérer les parcelles
    // TODO Récupérer les designs
    // TODO Récupérer les activités
    _dataRepository.deleteGarden(event.garden);
  }

//  Stream<GardensState> _mapToggleAllToState() async* {
//    final state = state;
////    if (state is GardensLoaded) {
////      final allComplete = state.gardens.every((todo) => todo.complete);
////      final List<Garden> updatedGardens = state.gardens
////          .map((todo) => todo.copyWith(complete: !allComplete))
////          .toList();
////      updatedGardens.forEach((updatedGardens) {
////        _dataRepository.updateGardens(updatedGardens);
////      });
////    }
//  }

  Stream<GardensState> _mapClearCompletedToState() async* {
//    final state = currentState;
//    if (state is GardensLoaded) {
//      final List<Garden> completedGardens =
//      state.gardens.where((todo) => todo.complete).toList();
//      completedGardens.forEach((completedGardens) {
//        _dataRepository.deleteGardens(completedGardens);
//      });
//    }
  }

  Stream<GardensState> _mapGardensUpdateToState(GardensUpdated event) async* {
    yield GardensLoaded(event.gardens);
  }


  @override
  Future <void> close() {
    _gardensSubscription?.cancel();
    _authenticationBlocSubscription?.cancel();
    return super.close();
  }
}