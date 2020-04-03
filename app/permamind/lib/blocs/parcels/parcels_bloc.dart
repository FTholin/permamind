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

  ParcelsBloc({@required this.gardensBloc, @required this.dataRepository, @required this.user}) {
    gardensSubscription = gardensBloc.listen((state) {
      if (state is ParcelsGardensLoadSuccess) {
        (gardensBloc.state as GardensLoaded).gardens.map((garden) {
          add(LoadParcels(garden.id, user.pseudo, user.id));
        });
      }
    });
  }

  @override
  ParcelsState get initialState {
    return gardensBloc.state is GardensLoaded
        ? ParcelsGardensLoadSuccess((gardensBloc.state as GardensLoaded).gardens)
        : ParcelsGardensLoadInProgress();
  }

  @override
  Stream<ParcelsState> mapEventToState(ParcelsEvent event) async* {

  }

//  Stream<FilteredTodosState> _mapUpdateFilterToState(
//      FilterUpdated event,
//      ) async* {
//    if (gardensBloc.state is TodosLoadSuccess) {
//      yield FilteredTodosLoadSuccess(
//        _mapTodosToFilteredTodos(
//          (gardensBloc.state as TodosLoadSuccess).todos,
//          event.filter,
//        ),
//        event.filter,
//      );
//    }
//  }
//
//  Stream<FilteredTodosState> _mapTodosUpdatedToState(
//      TodosUpdated event,
//      ) async* {
//    final visibilityFilter = state is FilteredTodosLoadSuccess
//        ? (state as FilteredTodosLoadSuccess).activeFilter
//        : VisibilityFilter.all;
//    yield FilteredTodosLoadSuccess(
//      _mapTodosToFilteredTodos(
//        (gardensBloc.state as TodosLoadSuccess).todos,
//        visibilityFilter,
//      ),
//      visibilityFilter,
//    );
//  }

//  List<Todo> _mapTodosToFilteredTodos(
//      List<Todo> todos, VisibilityFilter filter) {
//    return todos.where((todo) {
//      if (filter == VisibilityFilter.all) {
//        return true;
//      } else if (filter == VisibilityFilter.active) {
//        return !todo.complete;
//      } else {
//        return todo.complete;
//      }
//    }).toList();
//  }

  @override
  Future<void> close() {
    gardensSubscription.cancel();
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
//  Stream<ParcelsState> _mapLoadParcelsToState(LoadParcels event) async* {
//    gardenSubscription?.cancel();
//    gardenSubscription = dataRepository.loadParcels(event.gardenId, event.userId, event.userPseudo).listen(
//          (parcels) {
//        add(ParcelsUpdated(parcels));
//      },
//    );
//  }
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