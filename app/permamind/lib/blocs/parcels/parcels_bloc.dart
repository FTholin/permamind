import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:meta/meta.dart';
import 'package:permamind/blocs/blocs.dart';

class ParcelsBloc extends Bloc<ParcelsEvent, ParcelsState> {

  final GardensBloc gardensBloc;
  StreamSubscription gardenSubscription;
  final DataRepository dataRepository;


  ParcelsBloc({@required this.gardensBloc, @required this.dataRepository});

  @override
  ParcelsState get initialState => ParcelsLoading();

  @override
  Stream<ParcelsState> mapEventToState(ParcelsEvent event) async* {
    if (event is LoadParcels) {
      yield* _mapLoadParcelsToState(event);
    } else if (event is ParcelsUpdated) {
      yield* _mapParcelsUpdatedToState(event);
    } else if (event is ParcelsAdded) {
      yield* _mapParcelsAddedToState(event);
    } else if (event is ParcelDeleted) {
      yield* _mapParcelDeletedToState(event);
    } else if (event is ParcelCopied) {
      yield* _mapParcelCopiedToState(event);
    } else if (event is ParcelLeaved) {
      yield* _mapParcelLeavedToState(event);
    } else if (event is ActivitiesCopied) {
      yield* _mapActivitiesCopiedToState(event);
    }
  }

  Stream<ParcelsState> _mapLoadParcelsToState(LoadParcels event) async* {

    gardenSubscription?.cancel();
    gardenSubscription = dataRepository.loadParcels(event.gardenId).listen(
          (parcels) {
        add(ParcelsUpdated(parcels));
      },
    );
  }

  Stream<ParcelsState> _mapParcelsUpdatedToState(ParcelsUpdated event) async* {
    yield ParcelsLoaded(event.parcels);
  }

  Stream<ParcelsState> _mapParcelsAddedToState(ParcelsAdded event) async* {
    dataRepository.addNewParcel(event.parcel);
  }

  Stream<ParcelsState> _mapParcelDeletedToState(ParcelDeleted event) async* {
    dataRepository.deleteParcel(event.deletedParcel);
  }

  Stream<ParcelsState> _mapParcelCopiedToState(ParcelCopied event) async* {
    dataRepository.copyParcel(event.copiedParcel);
  }

  Stream<ParcelsState> _mapParcelLeavedToState(ParcelLeaved event) async* {
    event.leavedParcel.members.remove(event.userId);
    dataRepository.updateParcel(event.leavedParcel);
  }

  Stream<ParcelsState> _mapActivitiesCopiedToState(
      ActivitiesCopied schedule) async* {
    dataRepository.addParcelActivities(schedule.activities);
  }

  @override
  Future<void> close() {
    gardenSubscription.cancel();
    return super.close();
  }
}