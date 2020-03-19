import 'dart:async';
import 'package:authentication/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:data_repository/data_repository.dart';

class GardensBloc extends Bloc<GardensEvent, GardensState> {
  final DataRepository _dataRepository;
  StreamSubscription _gardensSubscription;

  StreamSubscription _parcelsSubscription;

  final AuthenticationBloc _authenticationBloc;
  StreamSubscription _authenticationBlocSubscription;

  GardensBloc(this._authenticationBloc, this._dataRepository) {
    _authenticationBlocSubscription = _authenticationBloc.listen((state) {
      // React to state changes here.
      // Dispatch events here to trigger changes in MyBloc.
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
    } else if (event is AddGarden) {
      yield* _mapAddGardenToState(event);
    } else if (event is UpdateGarden) {
      yield* _mapUpdateGardensToState(event);
    } else if (event is GardenDeleted) {
      yield* _mapGardenDeletedToState(event);
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

    Map<String, List<Parcel>> gardensParcels =  Map<String, List<Parcel>>();

    _gardensSubscription?.cancel();

    _gardensSubscription = _dataRepository.gardens(event.userId, event.userPseudo).listen(
          (gardens) {
            for (final garden in gardens) {
              _parcelsSubscription?.cancel();
              _parcelsSubscription = _dataRepository.loadParcels(garden.id, event.userId, event.userPseudo).listen((parcels){
                gardensParcels[garden.id] = parcels;
              });
            }
        add(GardensUpdated(gardens, gardensParcels));
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
    yield GardensLoaded(event.gardens, event.gardenParcels);
  }


  @override
  Future <void> close() {
    _gardensSubscription?.cancel();
    _authenticationBlocSubscription?.cancel();
    return super.close();
  }
}