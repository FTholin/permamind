import 'dart:async';
import 'package:meta/meta.dart';
import 'package:permamind_mobile/blocs/blocs.dart';
import 'package:bloc/bloc.dart';
import 'package:todos_repository/data_repository.dart';

class ModelingsBloc extends Bloc<ModelingsEvent, ModelingsState> {

  final TodosRepository todosRepository;
  StreamSubscription _todosSubscription;

  ModelingsBloc({@required this.todosRepository});

  @override
  ModelingsState get initialState => ModelingsLoading();

  @override
  Stream<ModelingsState> mapEventToState(ModelingsEvent event) async* {
    if (event is FetchModelings) {
      yield* _mapFetchModelingsToState(event);
    }
    else if (event is UpdatedModelings) {
      yield* _mapTodosUpdateToState(event);
    }
  }


  Stream<ModelingsState> _mapFetchModelingsToState(ModelingsEvent event) async* {
    _todosSubscription?.cancel();
    _todosSubscription = todosRepository.fetchModelings().listen(
          (todos) {
        dispatch(
          UpdatedModelings(todos),
        );
      },
    );
  }

  Stream<ModelingsState> _mapTodosUpdateToState(UpdatedModelings event) async* {
    yield ModelingsLoaded(event.modelings);
  }

}