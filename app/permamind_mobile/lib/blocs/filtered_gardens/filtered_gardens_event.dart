import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:permamind_mobile/models/models.dart';
import 'package:data_repository/data_repository.dart';

@immutable
abstract class FilteredGardensEvent extends Equatable {
  FilteredGardensEvent([List props = const []]) : super(props);
}

class UpdateFilter extends FilteredGardensEvent {
  final VisibilityFilter filter;

  UpdateFilter(this.filter) : super([filter]);

  @override
  String toString() => 'UpdateFilter { filter: $filter }';
}

class UpdateGardens extends FilteredGardensEvent {
  final List<Garden> gardens;


  UpdateGardens(this.gardens) : super([gardens]);

  @override
  String toString() => 'UpdateGardens { todos: $gardens }';
}

