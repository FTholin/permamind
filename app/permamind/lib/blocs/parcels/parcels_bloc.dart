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
    }
//    else if (event is ParcelAdded) {
//      yield* _mapParcelAddedToState(event);
//    }
    else if (event is ParcelDeleted) {
      yield* _mapParcelDeletedToState(event);
    } else if (event is ParcelCopied) {
      yield* _mapParcelCopiedToState(event);
    } else if (event is ParcelLeaved) {
      yield* _mapParcelLeavedToState(event);
    } else if (event is ActivitiesCopied) {
      yield* _mapActivitiesCopiedToState(event);
    } else if (event is ModelingAdded) {
      yield* _mapModelingAddedToState(event);
    } else if (event is ParcelUpdated) {
      yield* _mapParcelUpdatedToState(event);
    } else if (event is DesignParcelAdded) {
      yield* _mapDesignParcelAdded(event);

    }
  }

  Stream<ParcelsState> _mapLoadParcelsToState(LoadParcels event) async* {
    gardenSubscription?.cancel();
    gardenSubscription = dataRepository.loadParcels(event.gardenId, event.userId, event.userPseudo).listen(
          (parcels) {
        add(ParcelsUpdated(parcels));
      },
    );
  }

  Stream<ParcelsState> _mapParcelsUpdatedToState(ParcelsUpdated event) async* {
    yield ParcelsLoaded(event.parcels);
  }

  Stream<ParcelsState> _mapDesignParcelAdded(DesignParcelAdded designParcel) async* {
    dataRepository.addNewDesignParcel(
        DesignParcel(designParcel.gardenId, designParcel.parcelId, designParcel.designs));
  }

//  Stream<ParcelsState> _mapParcelAddedToState(ParcelAdded event) async* {
//    dataRepository.addNewParcel(event.parcel);
//  }

  Stream<ParcelsState> _mapParcelUpdatedToState(ParcelUpdated event) async* {
    dataRepository.updateParcel(event.parcelUpdated);
  }

  Stream<ParcelsState> _mapParcelDeletedToState(ParcelDeleted event) async* {
    dataRepository.deleteDesignsParcel(event.deletedParcel.id);
    dataRepository.deleteActivitiesFromParcel(event.deletedParcel.id);
    dataRepository.deleteParcel(event.deletedParcel);
  }

  Stream<ParcelsState> _mapParcelCopiedToState(ParcelCopied event) async* {
    dataRepository.copyParcel(event.copiedParcel);
  }

  Stream<ParcelsState> _mapParcelLeavedToState(ParcelLeaved event) async* {

    event.leavedParcel.members.removeWhere((item) => item.id == event.userId);
    dataRepository.updateParcel(event.leavedParcel);
  }

  Stream<ParcelsState> _mapActivitiesCopiedToState(
      ActivitiesCopied schedule) async* {
    dataRepository.addParcelActivities(schedule.activities);
  }


  Stream<ParcelsState> _mapModelingAddedToState(ModelingAdded event) async* {

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
      dataRepository.addParcelActivities(activities);
    }
  }


  @override
  Future<void> close() {
    gardenSubscription.cancel();
    return super.close();
  }
}