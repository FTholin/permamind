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
  final Map<String, Vegetable> veggiesComposition;

  ModelingsLoaded(this.modelingsFetched, this.veggiesComposition)
      : super([modelingsFetched, veggiesComposition]);

  @override
  String toString() => 'ModelingsLoaded { modelingsFetched: $modelingsFetched }';
}

class VeggiesLoaded extends ModelingsState {
  final List<Vegetable> veggies;

  VeggiesLoaded(this.veggies)
      : super([veggies]);

  @override
  String toString() => 'VeggiesLoaded { veggiesFetched: $veggies }';
}