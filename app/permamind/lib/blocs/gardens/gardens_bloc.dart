 import 'dart:async';
import 'package:authentication/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:data_repository/data_repository.dart';


class GardensBloc extends Bloc<GardensEvent, GardensState> {

  final DataRepository dataRepository;
  StreamSubscription _gardensSubscription;

  GardensBloc(this.dataRepository);

  @override
  GardensState get initialState => GardensLoadInProgress();

  @override
  Stream<GardensState> mapEventToState(GardensEvent event) async* {
    if (event is GardensLoadedSuccess) {
      yield* _mapGardensLoadedToState(event);
    } else if (event is GardenUpdated) {
      yield* _mapGardenUpdatedToState(event);
    } else if (event is GardensUpdated) {
      yield* _mapGardensUpdatedToState(event);
    } else if (event is GardenAdded) {
      yield* _mapGardenAddedToState(event);
    }
  }


  Stream<GardensState> _mapGardensLoadedToState(GardensLoadedSuccess event) async* {
    _gardensSubscription?.cancel();
    _gardensSubscription = dataRepository.gardens(event.userId, event.userPseudo).listen(
          (gardens) => add(GardensUpdated(gardens)),
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

  @override
  Future<void> close() {
    _gardensSubscription?.cancel();
    return super.close();
  }
}

// class GardensBloc extends Bloc<GardensEvent, GardensState> {
//   final DataRepository dataRepository;
//
//   final AuthenticationBloc authenticationBloc;
//   StreamSubscription authenticationBlocSubscription;
//
//   GardensBloc(this.dataRepository, this.authenticationBloc ) {
//     authenticationBlocSubscription = authenticationBloc.listen((state) {
//       if (state is Authenticated) {
//         add(GardensLoadedSuccess(state.userAuthenticated.id, state.userAuthenticated.pseudo));
//       }
//     });
//   }
//
//   @override
//   GardensState get initialState => GardensLoadInProgress();
//
//   @override
//   Stream<GardensState> mapEventToState(GardensEvent event) async* {
//     if (event is GardensLoadedSuccess) {
//       yield* _mapLoadGardensToState(event);
//     } else if (event is GardensUpdated) {
//       yield* _mapGardensUpdatedToState(event);
//     } else if (event is GardenUpdated) {
//       yield* _mapGardenUpdatedToState(event);
//     } else if (event is GardenAdded) {
//       yield* _mapGardenAddedToState(event);
//     } else if (event is GardenDeleted) {
//       yield* _mapGardenDeletedToState(event);
//     }
//   }
//
//
//   Stream<GardensState> _mapLoadGardensToState(GardensLoadedSuccess event) async* {
//     dataRepository.gardens(event.userId, event.userPseudo).listen(
//         (gardens) =>  add(GardensUpdated(gardens))
//     );
//   }
//
//   Stream<GardensState> _mapGardensUpdatedToState(GardensUpdated event) async* {
//     yield GardensLoadSuccess(event.gardens);
//   }
//
//
//   Stream<GardensState> _mapGardenUpdatedToState(GardenUpdated event) async* {
//     dataRepository.updateGarden(event.garden);
//   }
//
//   Stream<GardensState> _mapGardenAddedToState(GardenAdded event) async* {
//     dataRepository.addNewGarden(event.garden);
//   }
//
//
//
//   Stream<GardensState> _mapGardenDeletedToState(GardenDeleted event) async* {
//     dataRepository.deleteActivitiesFromGarden(event.garden.id);
//     dataRepository.deleteGarden(event.garden);
//   }
//
//   @override
//   Future<void> close() {
//     // TODO Attention
//     authenticationBlocSubscription.cancel();
//     return super.close();
//   }
// }


