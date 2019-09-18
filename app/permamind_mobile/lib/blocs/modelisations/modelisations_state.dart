import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todos_repository/todos_repository.dart';

@immutable
abstract class ModelisationsState extends Equatable {
  ModelisationsState([List props = const[]]) : super(props);
}

class ModelisationsLoading extends ModelisationsState {
  @override
  String toString() => 'ModelisationsLoading';
}

class ModelisationsLoaded extends ModelisationsState {
  final List<Todo> plantsFetched;

  ModelisationsLoaded(this.plantsFetched)
      : super([plantsFetched]);

  @override
  String toString() => 'ModelisationsLoaded { plantsFetched: $plantsFetched }';
}