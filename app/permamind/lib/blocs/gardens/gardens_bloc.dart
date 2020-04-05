 import 'dart:async';
import 'package:authentication/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:data_repository/data_repository.dart';

 class GardensBloc extends Bloc<GardensEvent, GardensState> {
   final DataRepository dataRepository;
   StreamSubscription _gardensSubscription;

   GardensBloc(this.dataRepository) {
//     authenticationBlocSubscription = authenticationBloc.listen((state) {
//       if (state is Authenticated) {
//         add(GardensLoadedSuccess(state.userAuthenticated.id, state.userAuthenticated.pseudo));
//       }
//     });
   }

   @override
   GardensState get initialState => GardensLoadInProgress();

   @override
   Stream<GardensState> mapEventToState(GardensEvent event) async* {
     if (event is GardensLoadedSuccess) {
       yield* _mapLoadGardensToState(event);
     } else if (event is GardensUpdated) {
       yield* _mapGardensUpdatedToState(event);
     } else if (event is GardenUpdated) {
       yield* _mapGardenUpdatedToState(event);
     } else if (event is GardenAdded) {
       yield* _mapGardenAddedToState(event);
     } else if (event is GardenDeleted) {
       yield* _mapGardenDeletedToState(event);
     }
   }



   Stream<GardensState> _mapLoadGardensToState(GardensLoadedSuccess event) async* {
     _gardensSubscription = dataRepository.gardens(event.userId, event.userPseudo).listen(
           (gardens) => add(GardensUpdated(gardens))
     );
   }

   Stream<GardensState> _mapGardensUpdatedToState(GardensUpdated event) async* {
     yield GardensLoadSuccess(event.gardens);
   }


   Stream<GardensState> _mapGardenUpdatedToState(GardenUpdated event) async* {
     dataRepository.updateGarden(event.garden);
   }

   Stream<GardensState> _mapGardenAddedToState(GardenAdded event) async* {
     dataRepository.addNewGarden(event.garden);
   }



   Stream<GardensState> _mapGardenDeletedToState(GardenDeleted event) async* {
     dataRepository.deleteActivitiesFromGarden(event.garden.id);
     dataRepository.deleteGarden(event.garden);
   }

   @override
   Future<void> close() {
     // TODO Attention
    _gardensSubscription.cancel();
     return super.close();
   }
 }







//class GardensBloc extends Bloc<GardensEvent, GardensState> {
//  final DataRepository dataRepository;
//  StreamSubscription _gardensSubscription;
//
//
//  final AuthenticationBloc _authenticationBloc;
//  StreamSubscription _authenticationBlocSubscription;
//
//  GardensBloc(this._authenticationBloc, this.dataRepository) {
//    _authenticationBlocSubscription = _authenticationBloc.listen((state) {
//      if (state is Authenticated) {
//        add(GardensLoadedSuccess(state.userAuthenticated.id, state.userAuthenticated.pseudo));
//      }
//    });
//  }
//
//  @override
//  GardensState get initialState => GardensLoadInProgress();
//
//  @override
//  Stream<GardensState> mapEventToState(GardensEvent event) async* {
//    if (event is GardensLoadedSuccess) {
//      yield* _mapGardensLoadedSuccessToState(event);
//    }
//    else if (event is GardenAdded) {
//      yield* _mapGardenAddedToState(event);
//    } else if (event is GardenUpdated) {
//      yield* _mapGardenUpdatedToState(event);
//    } else if (event is GardenDeleted) {
//      yield* _mapGardenDeletedToState(event);
//    }  else if (event is GardensUpdated) {
//      yield* _mapGardensUpdateToState(event);
//    }
////    else if (event is LeaveGarden) {
////      yield* _mapLeaveGardensToState(event);
////    } else if (event is CopyActivities) {
////      yield* _mapCopyActivitiesToState(event);
////    } else if (event is CopyGarden) {
////      yield* _mapCopyGardenToState(event);
////    }
//
//  }
//
//  Stream<GardensState> _mapGardensLoadedSuccessToState(GardensLoadedSuccess event) async* {
//    _gardensSubscription?.cancel();
//    _gardensSubscription = dataRepository.gardens(event.userId, event.userPseudo).listen(
//          (gardens) {
//            add(GardensUpdated(gardens));
//          }
//    );
//  }
//
//  Stream<GardensState> _mapGardensUpdateToState(GardensUpdated event) async* {
//    yield GardensLoadSuccess(event.gardens);
//  }
//
//    Stream<GardensState> _mapGardenAddedToState(GardenAdded event) async* {
//    dataRepository.addNewGarden(event.garden);
//  }
//
//
////  Stream<GardensState> _mapCopyActivitiesToState(
////      CopyActivities schedule) async* {
////    dataRepository.addGardenActivities(schedule.activities);
////  }
//
//
//  Stream<GardensState> _mapGardenUpdatedToState(GardenUpdated event) async* {
//    dataRepository.GardenUpdated(event.garden);
//  }
//
////  Stream<GardensState> _mapLeaveGardensToState(LeaveGarden event) async* {
////
////    dataRepository.updateGardensFromGarden(event.garden.id, event.userId);
////    event.garden.members.removeWhere((item) => item.id == event.userId);
////    dataRepository.GardenUpdated(event.garden);
////  }
////
////  Stream<GardensState> _mapCopyGardenToState(CopyGarden event) async* {
////    dataRepository.copyGarden(event.garden);
////  }
//
//  Stream<GardensState> _mapGardenDeletedToState(GardenDeleted event) async* {
//    dataRepository.deleteActivitiesFromGarden(event.garden.id);
//    dataRepository.deleteGardenGardens(event.garden.id);
//    dataRepository.deleteGarden(event.garden);
//  }
//
//
//
////  Stream<GardensState> _mapGardenCopiedToState(GardenCopied event) async* {
////    dataRepository.copyGarden(event.copiedGarden);
////  }
////
////  Stream<GardensState> _mapGardenLeavedToState(GardenLeaved event) async* {
////
////    event.leavedGarden.members.removeWhere((item) => item.id == event.userId);
////    dataRepository.updateGarden(event.leavedGarden);
////  }
//
////  Stream<GardensState> _mapActivitiesCopiedToState(
////      ActivitiesCopied schedule) async* {
////    dataRepository.addGardenActivities(schedule.activities);
////  }
//
//
//
//
//
//
//  @override
//  Future <void> close() {
// _gardensSubscription?.cancel();
//    _authenticationBlocSubscription?.cancel();
//    return super.close();
//  }
//}