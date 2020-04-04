import 'dart:async';
import 'package:authentication/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:meta/meta.dart';
import 'package:permamind/blocs/blocs.dart';


class ParcelsBloc extends Bloc<ParcelsEvent, ParcelsState> {
  final GardensBloc gardensBloc;
  final FirebaseDataRepository dataRepository;
  final User user;

//  StreamSubscription gardensSubscription;
//  StreamSubscription parcelsSubscription;


  ParcelsBloc({@required this.gardensBloc, @required this.dataRepository, @required this.user})  {

  }


  @override
  ParcelsState get initialState => ParcelsGardensLoadInProgress();


  @override
  Stream<ParcelsState> mapEventToState(ParcelsEvent event) async* {
    if (event is ParcelsLoadedSuccess) {
      yield* _mapLoadParcelsToState(event);
    } else if (event is ParcelsUpdated) {
      yield* _mapParcelsUpdatedToState(event);
    } else if (event is ParcelUpdated) {
      yield* _mapParcelUpdatedToState(event);
    } else if (event is ParcelAdded) {
      yield* _mapParcelAddedToState(event);
    } else if (event is ParcelDeleted) {
      yield* _mapParcelDeletedToState(event);
    } else if (event is ModelingAdded) {
      yield* _mapModelingAddedToState(event);
    }
  }



  Stream<ParcelsState> _mapLoadParcelsToState(ParcelsLoadedSuccess event) async* {
    dataRepository.loadParcels(event.gardenId, event.userId, event.userPseudo).listen(
          (parcels) {
        add(ParcelsUpdated(parcels));
      },
    );
  }

  Stream<ParcelsState> _mapParcelsUpdatedToState(ParcelsUpdated event) async* {
    yield ParcelsLoadSuccess(event.parcels);
  }


  Stream<ParcelsState> _mapParcelUpdatedToState(ParcelUpdated event) async* {
    dataRepository.updateParcel(event.parcel);
  }

  Stream<ParcelsState> _mapParcelAddedToState(ParcelAdded event) async* {
    dataRepository.addNewParcel(event.parcel);
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

  Stream<ParcelsState> _mapParcelDeletedToState(ParcelDeleted event) async* {
    dataRepository.deleteActivitiesFromParcel(event.parcelId);
    dataRepository.deleteParcel(event.parcelId);
  }

  @override
  Future<void> close() {
    // TODO Attention
//    parcelsSubscription.cancel();
//    gardensSubscription.cancel();
    return super.close();
  }
}