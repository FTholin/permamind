import 'dart:async';
import 'package:meta/meta.dart';
import 'package:permamind_mobile/blocs/blocs.dart';
import 'package:bloc/bloc.dart';
import 'package:todos_repository/todos_repository.dart';

class ModelisationsBloc extends Bloc<ModelisationsEvent, ModelisationsState> {
  final TodosBloc todosBloc;
  StreamSubscription todosSubscription;

  ModelisationsBloc({@required this.todosBloc}) {
    todosSubscription = todosBloc.state.listen((state) {
      if (state is TodosLoaded) {
        dispatch(UpdatedModelisations((todosBloc.currentState as TodosLoaded).todos));
      }
    });
  }

  @override
  ModelisationsState get initialState => ModelisationsLoading();

  @override
  Stream<ModelisationsState> mapEventToState(ModelisationsEvent event) async* {
    if (event is UpdatedModelisations) {
      yield* _mapModelisationsUpdatedToState(event);
    }
  }

  Stream<ModelisationsState> _mapModelisationsUpdatedToState(
      UpdatedModelisations event,
      ) async* {
    yield ModelisationsLoaded(
      (todosBloc.currentState as TodosLoaded).todos);
  }


  @override
  void dispose() {
    todosSubscription.cancel();
    super.dispose();
  }
}