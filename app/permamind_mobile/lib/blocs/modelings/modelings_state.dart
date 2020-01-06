import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:data_repository/data_repository.dart';

@immutable
abstract class ModelingsState extends Equatable {
  ModelingsState([List props = const[]]) : super(props);
}

class ModelingsLoading extends ModelingsState {
  @override
  String toString() => 'ModelingsLoading';
}

class ModelingsLoaded extends ModelingsState {
  final List<Modeling> modelingsFetched;

  ModelingsLoaded(this.modelingsFetched)
      : super([modelingsFetched]);

  @override
  String toString() => 'ModelingsLoaded { modelingsFetched: $modelingsFetched }';
}