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


  @override
  Future<void> close() {
    gardenSubscription.cancel();
    return super.close();
  }
}