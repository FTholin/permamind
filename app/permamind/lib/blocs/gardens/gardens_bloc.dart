 import 'dart:async';
import 'package:authentication/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:data_repository/data_repository.dart';

class GardensBloc extends Bloc<GardensEvent, GardensState> {
  final DataRepository dataRepository;
  StreamSubscription _gardensSubscription;


  final AuthenticationBloc _authenticationBloc;
  StreamSubscription _authenticationBlocSubscription;

  GardensBloc(this._authenticationBloc, this.dataRepository) {
    _authenticationBlocSubscription = _authenticationBloc.listen((state) {
      if (state is Authenticated) {
        add(GardensLoadedSuccess(state.userAuthenticated.id, state.userAuthenticated.pseudo));
      }
    });
  }

  @override
  GardensState get initialState => GardensLoadInProgress();

  @override
  Stream<GardensState> mapEventToState(GardensEvent event) async* {
    if (event is GardensLoadedSuccess) {
      yield* _mapGardensLoadedSuccessToState(event);
    }
    else if (event is GardenAdded) {
      yield* _mapGardenAddedToState(event);
    } else if (event is GardenUpdated) {
      yield* _mapGardenUpdatedToState(event);
    } else if (event is GardenDeleted) {
      yield* _mapGardenDeletedToState(event);
    }  else if (event is GardensUpdated) {
      yield* _mapGardensUpdateToState(event);
    }
//    else if (event is LeaveGarden) {
//      yield* _mapLeaveGardensToState(event);
//    } else if (event is CopyActivities) {
//      yield* _mapCopyActivitiesToState(event);
//    } else if (event is CopyGarden) {
//      yield* _mapCopyGardenToState(event);
//    }

  }

  Stream<GardensState> _mapGardensLoadedSuccessToState(GardensLoadedSuccess event) async* {
    dataRepository.gardens(event.userId, event.userPseudo).listen(
          (gardens) {
            add(GardensUpdated(gardens));
          }
    );
  }

  Stream<GardensState> _mapGardensUpdateToState(GardensUpdated event) async* {
    yield GardensLoadSuccess(event.gardens);
  }

    Stream<GardensState> _mapGardenAddedToState(GardenAdded event) async* {
    dataRepository.addNewGarden(event.garden);
  }


//  Stream<GardensState> _mapCopyActivitiesToState(
//      CopyActivities schedule) async* {
//    dataRepository.addParcelActivities(schedule.activities);
//  }


  Stream<GardensState> _mapGardenUpdatedToState(GardenUpdated event) async* {
    dataRepository.GardenUpdated(event.garden);
  }

//  Stream<GardensState> _mapLeaveGardensToState(LeaveGarden event) async* {
//
//    dataRepository.updateParcelsFromGarden(event.garden.id, event.userId);
//    event.garden.members.removeWhere((item) => item.id == event.userId);
//    dataRepository.GardenUpdated(event.garden);
//  }
//
//  Stream<GardensState> _mapCopyGardenToState(CopyGarden event) async* {
//    dataRepository.copyGarden(event.garden);
//  }

  Stream<GardensState> _mapGardenDeletedToState(GardenDeleted event) async* {
    dataRepository.deleteActivitiesFromGarden(event.garden.id);
    dataRepository.deleteGardenParcels(event.garden.id);
    dataRepository.deleteGarden(event.garden);
  }



//  Stream<GardensState> _mapParcelCopiedToState(ParcelCopied event) async* {
//    dataRepository.copyParcel(event.copiedParcel);
//  }
//
//  Stream<GardensState> _mapParcelLeavedToState(ParcelLeaved event) async* {
//
//    event.leavedParcel.members.removeWhere((item) => item.id == event.userId);
//    dataRepository.updateParcel(event.leavedParcel);
//  }

//  Stream<GardensState> _mapActivitiesCopiedToState(
//      ActivitiesCopied schedule) async* {
//    dataRepository.addParcelActivities(schedule.activities);
//  }






  @override
  Future <void> close() {
//    _gardensSubscription?.cancel();
    _authenticationBlocSubscription?.cancel();
    return super.close();
  }
}