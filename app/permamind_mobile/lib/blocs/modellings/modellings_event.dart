import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todos_repository/todos_repository.dart';

@immutable
abstract class ModellingsEvent extends Equatable {
  ModellingsEvent([List props = const []]) : super(props);
}

class FetchModellings extends ModellingsEvent {


  FetchModellings() : super([]);

  @override
  String toString() => 'FetchModellings ';
}

class UpdatedModellings extends ModellingsEvent {
  final List<Modelling> modellings;

  UpdatedModellings(this.modellings) : super([modellings]);

  @override
  String toString() => 'FetchModellings { modellings: $modellings }';
}

//class UpdatedModellings extends ModellingsEvent {
//  final List<Todo> modellings;
//
//  UpdatedModellings(this.modellings) : super([modellings]);
//
//  @override
//  String toString() => 'UpdateModellings { modellings: $modellings }';
//}

