import 'dart:async';
import 'package:meta/meta.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';


class ModelingsBloc extends Bloc<ModelingsEvent, ModelingsState> {

  final DataRepository dataRepository;
  StreamSubscription _dataSubscription;

  ModelingsBloc({@required this.dataRepository});

  @override
  ModelingsState get initialState => ModelingsLoading();

  @override
  Stream<ModelingsState> mapEventToState(ModelingsEvent event) async* {
    if (event is FetchModelings) {
      yield* _mapFetchModelingsToState(event);
    }
    else if (event is UpdatedModelings) {
      yield* _mapGardensUpdateToState(event);
    } else if (event is FetchVeggies) {
      yield* _mapFetchVeggiesToState(event);
    } else if (event is UpdatedVeggies) {
      yield* _mapVeggiesUpdateToState(event);
    }
  }


  Stream<ModelingsState> _mapFetchVeggiesToState(FetchVeggies event) async* {
    _dataSubscription?.cancel();
    _dataSubscription = dataRepository.fetchVeggies().listen(
          (veggies) {
        add(
          UpdatedVeggies(veggies),
        );
      },
    );
  }


  Stream<ModelingsState> _mapFetchModelingsToState(FetchModelings event) async* {
    _dataSubscription?.cancel();
    _dataSubscription = dataRepository.fetchModelings(event.veggiesList).listen(
          (modelings) {
        add(
          UpdatedModelings(modelings, event.veggiesComposition),
        );
      },
    );
  }

  Stream<ModelingsState> _mapGardensUpdateToState(UpdatedModelings event) async* {
    yield ModelingsLoaded(event.modelings, event.veggiesComposition);
  }

  Stream<ModelingsState> _mapVeggiesUpdateToState(UpdatedVeggies event) async* {
    yield VeggiesLoaded(event.veggies);
  }


  @override
  Future <void> close() {
    _dataSubscription?.cancel();
    return super.close();
  }
}