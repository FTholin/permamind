import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todos_repository/todos_repository.dart';

@immutable
abstract class ModelisationsEvent extends Equatable {
  ModelisationsEvent([List props = const []]) : super(props);
}

class FetchModelisations extends ModelisationsEvent {


  FetchModelisations() : super([]);

  @override
  String toString() => 'FetchModelisations ';
}

class UpdatedModelisations extends ModelisationsEvent {
  final List<Todo> modelisations;

  UpdatedModelisations(this.modelisations) : super([modelisations]);

  @override
  String toString() => 'FetchModelisations { modelisations: $modelisations }';
}

//class UpdatedModelisations extends ModelisationsEvent {
//  final List<Todo> modelisations;
//
//  UpdatedModelisations(this.modelisations) : super([modelisations]);
//
//  @override
//  String toString() => 'UpdateModelisations { modelisations: $modelisations }';
//}

