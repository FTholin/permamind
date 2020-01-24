import 'dart:async';
import 'package:authentication/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:data_repository/data_repository.dart';

class GardensBloc extends Bloc<GardensEvent, GardensState> {
  final DataRepository _dataRepository;
  StreamSubscription _gardensSubscription;


  final AuthenticationBloc _authenticationBloc;
  StreamSubscription _authenticationBlocSubscription;

  GardensBloc(this._authenticationBloc, this._dataRepository) {
    _authenticationBlocSubscription = _authenticationBloc.listen((state) {
      // React to state changes here.
      // Dispatch events here to trigger changes in MyBloc.
      if (state is Authenticated) {
        add(LoadGardens(state.userId));
      }
    });
  }

  @override
  GardensState get initialState => GardensNotLoaded();

  @override
  Stream<GardensState> mapEventToState(GardensEvent event) async* {
    if (event is LoadGardens) {
      yield* _mapLoadGardensToState(event);
    } else if (event is AddGarden) {
      yield* _mapAddGardensToState(event);
    } else if (event is UpdateGarden) {
      yield* _mapUpdateGardensToState(event);
    } else if (event is DeleteGarden) {
      yield* _mapDeleteGardensToState(event);
    } else if (event is ToggleAll) {
//      yield* _mapToggleAllToState();
    }
    else if (event is ClearCompleted) {
      yield* _mapClearCompletedToState();
    } else if (event is GardensUpdated) {
      yield* _mapGardensUpdateToState(event);
    }
//    } else if (event is GardensInit) {
//      yield* _mapGardensInitToState();
//    }
  }

  Stream<GardensState> _mapLoadGardensToState(LoadGardens event) async* {

    _gardensSubscription?.cancel();
    _gardensSubscription = _dataRepository.gardens(event.userId).listen(
          (gardens) {
        add(
          GardensUpdated(gardens),
        );
      },
    );

  }

  Stream<GardensState> _mapAddGardensToState(AddGarden event) async* {
    // TODO Ajouter activités ici

//    final activities = await _userRepository.getUserId();

    _dataRepository.addNewGarden(event.garden);
  }

  Stream<GardensState> _mapUpdateGardensToState(UpdateGarden event) async* {
    _dataRepository.updateGarden(event.updatedGarden);
  }

  Stream<GardensState> _mapDeleteGardensToState(DeleteGarden event) async* {
    _dataRepository.deleteGarden(event.garden);
  }

//  Stream<GardensState> _mapToggleAllToState() async* {
//    final state = state;
////    if (state is GardensLoaded) {
////      final allComplete = state.gardens.every((todo) => todo.complete);
////      final List<Garden> updatedGardens = state.gardens
////          .map((todo) => todo.copyWith(complete: !allComplete))
////          .toList();
////      updatedGardens.forEach((updatedGardens) {
////        _dataRepository.updateGardens(updatedGardens);
////      });
////    }
//  }

  Stream<GardensState> _mapClearCompletedToState() async* {
//    final state = currentState;
//    if (state is GardensLoaded) {
//      final List<Garden> completedGardens =
//      state.gardens.where((todo) => todo.complete).toList();
//      completedGardens.forEach((completedGardens) {
//        _dataRepository.deleteGardens(completedGardens);
//      });
//    }
  }

  Stream<GardensState> _mapGardensUpdateToState(GardensUpdated event) async* {
    yield GardensLoaded(event.gardens);
  }


  @override
  Future <void> close() {
    _gardensSubscription?.cancel();
    _authenticationBlocSubscription?.cancel();
    return super.close();
  }

//  Stream<GardensState> _mapGardensInitToState() async* {
//    try {
//      final isSignedIn = await _userRepository.isSignedIn();
//      if (isSignedIn) {
//        final name = await _userRepository.getUserId();
//        yield Authenticated(name);
//      } else {
//        yield Unauthenticated();
//      }
//    } catch (_) {
//      yield Unauthenticated();
//    }
//  }
}