import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todos_repository/todos_repository.dart';

@immutable
abstract class ModelisationsEvent extends Equatable {
  ModelisationsEvent([List props = const []]) : super(props);
}

class UpdatedModelisations extends ModelisationsEvent {
  final List<Todo> plants;

  UpdatedModelisations(this.plants) : super([plants]);

  @override
  String toString() => 'UpdateModelisations { plants: $plants }';
}

