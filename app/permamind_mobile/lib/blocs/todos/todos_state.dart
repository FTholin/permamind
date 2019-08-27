import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todos_repository/todos_repository.dart';


/*
* This states are results of event processing
* */
@immutable
abstract class TodosState extends Equatable {
  TodosState([List props = const []]) : super(props);
}

class TodosLoading extends TodosState {
  @override
  String toString() => "TodoLoading";
}

class TodosLoaded extends TodosState {
  final List<Todo> todos;

  TodosLoaded([this.todos = const []]) : super([todos]);

  @override
  String toString() => "TodosLoaded { todos : $todos }";
}

class TodosNotLoaded extends TodosState {
  @override
  String toString() => "TodosNotLoaded";
}