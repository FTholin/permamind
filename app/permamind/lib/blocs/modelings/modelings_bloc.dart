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
    }
  }


  Stream<ModelingsState> _mapFetchModelingsToState(ModelingsEvent event) async* {
    _dataSubscription?.cancel();
    _dataSubscription = dataRepository.fetchModelings().listen(
          (gardens) {
        add(
          UpdatedModelings(gardens),
        );
      },
    );
  }

  Stream<ModelingsState> _mapGardensUpdateToState(UpdatedModelings event) async* {
    yield ModelingsLoaded(event.modelings);
  }

}