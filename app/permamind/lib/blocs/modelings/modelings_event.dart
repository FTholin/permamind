import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:data_repository/data_repository.dart';

@immutable
abstract class ModelingsEvent extends Equatable {
  ModelingsEvent([List props = const []]) : super(props);
}

class FetchModelings extends ModelingsEvent {

  final List<String> veggiesList;

  FetchModelings(this.veggiesList) : super([]);

  @override
  String toString() => 'FetchModelings ';
}


class UpdatedModelings extends ModelingsEvent {
  final List<Modeling> modelings;

  UpdatedModelings(this.modelings) : super([modelings]);

  @override
  String toString() => 'FetchModelings { modelings: $modelings }';
}


class FetchVeggies extends ModelingsEvent {

  final List<Vegetable> veggies;

  FetchVeggies([this.veggies = const []]) : super([veggies]);

  @override
  String toString() => 'FetchVeggies { veggies: $veggies }';
}


class UpdatedVeggies extends ModelingsEvent {
  final List<Vegetable> veggies;

  UpdatedVeggies(this.veggies) : super([veggies]);

  @override
  String toString() => 'UpdatedVeggies { veggies: $veggies }';
}

//class UpdatedModelings extends ModelingsEvent {
//  final List<Todo> modelings;
//
//  UpdatedModelings(this.modelings) : super([modelings]);
//
//  @override
//  String toString() => 'UpdateModelings { modelings: $modelings }';
//}

