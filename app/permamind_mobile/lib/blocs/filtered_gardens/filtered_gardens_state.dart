import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:permamind_mobile/models/models.dart';
import 'package:data_repository/data_repository.dart';

@immutable
abstract class FilteredGardensState extends Equatable {
  FilteredGardensState([List props = const []]) : super(props);
}

class FilteredGardensLoading extends FilteredGardensState {
  @override
  String toString() => 'FilteredGardensLoading';
}

class FilteredGardensLoaded extends FilteredGardensState {
  final List<Garden> filteredGardens;
  final VisibilityFilter activeFilter;

  FilteredGardensLoaded(this.filteredGardens, this.activeFilter)
      : super([filteredGardens, activeFilter]);

  @override
  String toString() => 'FilteredGardensLoaded { filteredGardens: $filteredGardens, activeFilter: $activeFilter }';
}

