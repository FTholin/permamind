import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:meta/meta.dart';
import 'package:permamind_mobile/blocs/blocs.dart';



class TutorialsBloc extends Bloc<TutorialsEvent, TutorialsState> {
  final FirebaseDataRepository tutosRepository;

  TutorialsBloc({@required this.tutosRepository});
  StreamSubscription _tutosSubscription;


  @override
  TutorialsState get initialState => TutosLoading();

  @override
  Stream<TutorialsState> mapEventToState(TutorialsEvent event) async* {
    if (event is LoadTutos) {
      yield* _mapLoadTutosToState();
    } else if (event is CompleteActivity) {
      yield* _mapCompleteActivityToState(event);
    } else if (event is UncompleteActivity) {
      yield* _mapUncompleteActivityTodoToState(event);
    } else if (event is CompleteTuto) {
      yield* _mapCompleteTutoToState(event);
    } else if (event is UncompleteTuto) {
      yield* _mapUncompleteTutoToState(event);
    } else if (event is TutosUpdated) {
      yield* _mapTutosUpdateToState(event);
    }
  }


  Stream<TutorialsState> _mapLoadTutosToState() async* {
    _tutosSubscription?.cancel();
    _tutosSubscription = tutosRepository.loadTutorials().listen(
          (tutos) {
        dispatch(
          TutosUpdated(tutos),
        );
      },
    );
  }

  Stream<TutorialsState> _mapCompleteActivityToState(
      CompleteActivity event) async* {

  }

  Stream<TutorialsState> _mapUncompleteActivityTodoToState(
      UncompleteActivity event) async* {

  }

  Stream<TutorialsState> _mapCompleteTutoToState(CompleteTuto event) async* {

  }

  Stream<TutorialsState> _mapUncompleteTutoToState(unComplete) async* {

  }

  Stream<TutorialsState> _mapTutosUpdateToState(TutosUpdated event) async* {
    yield TutosLoaded(event.tutos);
  }

  @override
  void dispose() {
    _tutosSubscription?.cancel();
    super.dispose();
  }
}