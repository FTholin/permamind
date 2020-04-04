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
      if (state is Authenticated) {
        add(LoadGardens(state.userAuthenticated.id, state.userAuthenticated.pseudo));
      }
    });
  }

  @override
  GardensState get initialState => GardensNotLoaded();

  @override
  Stream<GardensState> mapEventToState(GardensEvent event) async* {
    if (event is LoadGardens) {
      yield* _mapLoadGardensToState(event);
    }
    else if (event is AddGarden) {
      yield* _mapAddGardenToState(event);
    } else if (event is UpdateGarden) {
      yield* _mapUpdateGardensToState(event);
    } else if (event is GardenDeleted) {
      yield* _mapGardenDeletedToState(event);
    }
//    else if (event is ParcelAdded) {
//      yield* _mapParcelAddedToState(event);
//    }
    else if (event is GardensUpdated) {
      yield* _mapGardensUpdateToState(event);
    }
    else if (event is LeaveGarden) {
      yield* _mapLeaveGardensToState(event);
    } else if (event is CopyActivities) {
      yield* _mapCopyActivitiesToState(event);
    } else if (event is CopyGarden) {
      yield* _mapCopyGardenToState(event);
    }
//    else if (event is ParcelDeleted) {
//      yield* _mapParcelDeletedToState(event);
//    }
//    else if (event is ParcelCopied) {
//      yield* _mapParcelCopiedToState(event);
//    }
//    else if (event is ParcelLeaved) {
//      yield* _mapParcelLeavedToState(event);
//    } else if (event is ActivitiesCopied) {
//      yield* _mapActivitiesCopiedToState(event);
//    }
    else if (event is ModelingAdded) {
      yield* _mapModelingAddedToState(event);
    }
//    else if (event is ParcelUpdated) {
//      yield* _mapParcelUpdatedToState(event);
//    }
//    else if (event is DesignParcelAdded) {
//      yield* _mapDesignParcelAdded(event);
//    }

  }



  Stream<GardensState> _mapLoadGardensToState(LoadGardens event) async* {
    _gardensSubscription?.cancel();
    _gardensSubscription = _dataRepository.gardens(event.userId, event.userPseudo).listen(
          (gardens) {
            add(GardensUpdated(gardens));
          }
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


    _dataRepository.updateParcelsFromGarden(event.garden.id, event.userId);
    event.garden.members.removeWhere((item) => item.id == event.userId);
    _dataRepository.updateGarden(event.garden);
  }

  Stream<GardensState> _mapCopyGardenToState(CopyGarden event) async* {
    _dataRepository.copyGarden(event.garden);
  }

  Stream<GardensState> _mapGardenDeletedToState(GardenDeleted event) async* {
    _dataRepository.deleteDesignsFromGarden(event.garden.id);
    _dataRepository.deleteActivitiesFromGarden(event.garden.id);
    _dataRepository.deleteGardenParcels(event.garden.id);
    _dataRepository.deleteGarden(event.garden);
  }


  Stream<GardensState> _mapGardensUpdateToState(GardensUpdated event) async* {
    yield GardensLoaded(event.gardens);
  }


//  Stream<GardensState> _mapParcelAddedToState(ParcelAdded event) async* {
//    _dataRepository.addNewParcel(event.parcel);
//  }

//  Stream<GardensState> _mapDesignParcelAdded(DesignParcelAdded designParcel) async* {
//    _dataRepository.addNewDesignParcel(
//        DesignParcel(designParcel.gardenId, designParcel.parcelId, designParcel.designs));
//  }


//  Stream<GardensState> _mapParcelUpdatedToState(ParcelUpdated event) async* {
//    _dataRepository.updateParcel(event.parcelUpdated);
//  }
//
//  Stream<GardensState> _mapParcelDeletedToState(ParcelDeleted event) async* {
//    _dataRepository.deleteDesignsParcel(event.parcelId);
//    _dataRepository.deleteActivitiesFromParcel(event.parcelId);
//    _dataRepository.deleteParcel(event.parcelId);
//  }

//  Stream<GardensState> _mapParcelCopiedToState(ParcelCopied event) async* {
//    _dataRepository.copyParcel(event.copiedParcel);
//  }
//
//  Stream<GardensState> _mapParcelLeavedToState(ParcelLeaved event) async* {
//
//    event.leavedParcel.members.removeWhere((item) => item.id == event.userId);
//    _dataRepository.updateParcel(event.leavedParcel);
//  }

//  Stream<GardensState> _mapActivitiesCopiedToState(
//      ActivitiesCopied schedule) async* {
//    _dataRepository.addParcelActivities(schedule.activities);
//  }


  Stream<GardensState> _mapModelingAddedToState(ModelingAdded event) async* {

    DateTime referenceDate = DateTime.now();

    List<Activity> activities = List<Activity>();

    for (int i = 0; i < event.schedule.length; i++) {

      for (int j = 0; j < event.schedule[i].dayActivities.length; j++) {
        DateTime expectedDate = referenceDate.add(Duration(days: i));
        expectedDate = DateTime(expectedDate.year, expectedDate.month, expectedDate.day, 1);
        activities.add(
            Activity( event.schedule[i].dayActivities[j].name, event.gardenId, event.parcelId, false, expectedDate, event.schedule[i].dayActivities[j].category, '')
        );
      }

    }

    if (activities.isNotEmpty) {
      _dataRepository.addParcelActivities(activities);
    }
  }



  @override
  Future <void> close() {
    _gardensSubscription?.cancel();
    _authenticationBlocSubscription?.cancel();
    return super.close();
  }
}