import 'dart:async';
import 'package:meta/meta.dart';
import 'package:permamind_mobile/blocs/blocs.dart';
import 'package:bloc/bloc.dart';
import 'package:todos_repository/todos_repository.dart';

class ModellingsBloc extends Bloc<ModellingsEvent, ModellingsState> {

  final TodosRepository todosRepository;
  StreamSubscription _todosSubscription;

  ModellingsBloc({@required this.todosRepository});

  @override
  ModellingsState get initialState => ModellingsLoading();

  @override
  Stream<ModellingsState> mapEventToState(ModellingsEvent event) async* {
    if (event is FetchModellings) {
      yield* _mapFetchModellingsToState(event);
    }
    else if (event is UpdatedModellings) {
      yield* _mapTodosUpdateToState(event);
    }
  }


  Stream<ModellingsState> _mapFetchModellingsToState(ModellingsEvent event) async* {
    _todosSubscription?.cancel();
    _todosSubscription = todosRepository.fetchModellings().listen(
          (todos) {
        dispatch(
          UpdatedModellings(todos),
        );
      },
    );
  }

  Stream<ModellingsState> _mapTodosUpdateToState(UpdatedModellings event) async* {
    yield ModellingsLoaded(event.modellings);
  }

}