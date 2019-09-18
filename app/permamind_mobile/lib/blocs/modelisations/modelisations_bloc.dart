import 'dart:async';
import 'package:meta/meta.dart';
import 'package:permamind_mobile/blocs/blocs.dart';
import 'package:bloc/bloc.dart';
import 'package:todos_repository/todos_repository.dart';

class ModelisationsBloc extends Bloc<ModelisationsEvent, ModelisationsState> {

  final TodosRepository todosRepository;
  StreamSubscription _todosSubscription;

  ModelisationsBloc({@required this.todosRepository});

  @override
  ModelisationsState get initialState => ModelisationsLoading();

  @override
  Stream<ModelisationsState> mapEventToState(ModelisationsEvent event) async* {
    if (event is FetchModelisations) {
      yield* _mapFetchModelisationsToState(event);
    }
    else if (event is UpdatedModelisations) {
      yield* _mapTodosUpdateToState(event);
    }
  }


  Stream<ModelisationsState> _mapFetchModelisationsToState(ModelisationsEvent event) async* {
    _todosSubscription?.cancel();
    _todosSubscription = todosRepository.fetchModelisations().listen(
          (todos) {
        dispatch(
          UpdatedModelisations(todos),
        );
      },
    );
  }

  Stream<ModelisationsState> _mapTodosUpdateToState(UpdatedModelisations event) async* {
    yield ModelisationsLoaded(event.modelisations);
  }

}