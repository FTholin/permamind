import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:permamind_mobile/models/models.dart';
import 'package:meta/meta.dart';
import 'package:permamind_mobile/blocs/blocs.dart';
import 'package:data_repository/data_repository.dart';


class FilteredGardensBloc extends Bloc<FilteredGardensEvent, FilteredGardensState> {
  final GardensBloc gardensBloc;
  StreamSubscription gardensSubscription;

  FilteredGardensBloc({@required this.gardensBloc}) {
    gardensSubscription = gardensBloc.state.listen((state) {
      if (state is GardensLoaded) {
        dispatch(UpdateGardens((gardensBloc.currentState as GardensLoaded).gardens));
      }
    });
  }

  @override
  FilteredGardensState get initialState {
    return gardensBloc.currentState is GardensLoaded
        ? FilteredGardensLoaded(
      (gardensBloc.currentState as GardensLoaded).gardens,
      VisibilityFilter.all,
    )
        : FilteredGardensLoading();
  }

  @override
  Stream<FilteredGardensState> mapEventToState(FilteredGardensEvent event) async* {
    if (event is UpdateFilter) {
      yield* _mapUpdateFilterToState(event);
    } else if (event is UpdateGardens) {
      yield* _mapGardensUpdatedToState(event);
    }
  }

  Stream<FilteredGardensState> _mapUpdateFilterToState(
      UpdateFilter event,
      ) async* {
    if (gardensBloc.currentState is GardensLoaded) {
      yield FilteredGardensLoaded(

        _mapGardensToFilteredGardens(
            (gardensBloc.currentState as GardensLoaded).gardens,
            event.filter,
        ),
        event.filter,
      );
    }
  }

  Stream<FilteredGardensState> _mapGardensUpdatedToState(
      UpdateGardens event,
      ) async* {
    final visibilityFilter = currentState is FilteredGardensLoaded
        ? (currentState as FilteredGardensLoaded).activeFilter
        : VisibilityFilter.all;
    yield FilteredGardensLoaded(
      _mapGardensToFilteredGardens(
          (gardensBloc.currentState as GardensLoaded).gardens,
        visibilityFilter,
      ),
      visibilityFilter,
    );
  }

  List<Garden> _mapGardensToFilteredGardens(
      List<Garden> gardens, VisibilityFilter filter) {
    return gardens.where((garden) {
      if (filter == VisibilityFilter.all) {
        return true;
      } else if (filter == VisibilityFilter.active) {
        return !garden.publicVisibility;
      } else if (filter == VisibilityFilter.completed) {
        return garden.publicVisibility;
      }
    }).toList();
  }

  @override
  void dispose() {
    gardensSubscription.cancel();
    super.dispose();
  }

}

