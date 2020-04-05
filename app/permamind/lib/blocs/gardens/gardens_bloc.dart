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
    } else if (event is GardenDeleted) {
      yield* _mapGardenDeletedToState(event);
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

  Stream<GardensState> _mapGardenDeletedToState(GardenDeleted event) async* {
    dataRepository.deleteActivitiesFromGarden(event.garden.id);
    dataRepository.deleteGardenParcels(event.garden.id);
    dataRepository.deleteGarden(event.garden);
  }

  @override
  Future<void> close() {
    _gardensSubscription?.cancel();
    return super.close();
  }
}


