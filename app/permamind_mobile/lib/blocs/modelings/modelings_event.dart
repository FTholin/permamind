import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todos_repository/data_repository.dart';

@immutable
abstract class ModelingsEvent extends Equatable {
  ModelingsEvent([List props = const []]) : super(props);
}

class FetchModelings extends ModelingsEvent {


  FetchModelings() : super([]);

  @override
  String toString() => 'FetchModelings ';
}

class UpdatedModelings extends ModelingsEvent {
  final List<Modeling> modelings;

  UpdatedModelings(this.modelings) : super([modelings]);

  @override
  String toString() => 'FetchModelings { modelings: $modelings }';
}

//class UpdatedModelings extends ModelingsEvent {
//  final List<Todo> modelings;
//
//  UpdatedModelings(this.modelings) : super([modelings]);
//
//  @override
//  String toString() => 'UpdateModelings { modelings: $modelings }';
//}

