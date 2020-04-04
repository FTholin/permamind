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

  StreamSubscription gardensSubscription;
  StreamSubscription parcelsSubscription;


  ParcelsBloc({@required this.gardensBloc, @required this.dataRepository, @required this.user})  {
//    gardensSubscription = gardensBloc.listen((state) {
//      if (state is GardensLoaded) {
//
////        add(GardensUpdated(state.gardens));
////        add(TodosUpdated((todosBloc.state as TodosLoadSuccess).todos));
//      }
//    });
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

  @override
  Future<void> close() {
    // TODO Attention
    parcelsSubscription.cancel();
//    gardensSubscription.cancel();
    return super.close();
  }
}

//class ParcelsBloc extends Bloc<ParcelsEvent, ParcelsState> {
//
//  final GardensBloc gardensBloc;
//  StreamSubscription gardenSubscription;
//  final DataRepository dataRepository;
//
//
//  ParcelsBloc({@required this.gardensBloc, @required this.dataRepository});
//
//  @override
//  ParcelsState get initialState => ParcelsLoading();
//
//  @override
//  Stream<ParcelsState> mapEventToState(ParcelsEvent event) async* {
//    if (event is LoadParcels) {
//      yield* _mapLoadParcelsToState(event);
//    } else if (event is ParcelsUpdated) {
//      yield* _mapParcelsUpdatedToState(event);
//    }
//
//  }
//

//
//  Stream<ParcelsState> _mapParcelsUpdatedToState(ParcelsUpdated event) async* {
//    yield ParcelsLoaded(event.parcels);
//  }
//
//
//
//
//  @override
//  Future<void> close() {
//    gardenSubscription.cancel();
//    return super.close();
//  }
//}