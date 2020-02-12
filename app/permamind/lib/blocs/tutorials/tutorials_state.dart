import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:permamind/models/models.dart';

@immutable
abstract class TutorialsState extends Equatable {
  TutorialsState([List props = const []]) : super(props);
}

class TutosLoading extends TutorialsState {
  @override
  String toString() => 'TutosLoading';
}

class TutosLoaded extends TutorialsState {
  final Map<int, List<Tutorial>> tutorials;

  TutosLoaded([this.tutorials]) : super([tutorials]);

  @override
  String toString() => 'TutosLoaded { tutoActivities: $tutorials }';
}

class TutosNotLoaded extends TutorialsState {
  @override
  String toString() => 'TodosNotLoaded';
}

class TutoActivitiesLoading extends TutorialsState {
  @override
  String toString() => 'TutotutoActivitiesLoading';
}

class TutoActivitiesLoaded extends TutorialsState {
  final Map<int, List<Tutorial>> tutorials;

  TutoActivitiesLoaded([this.tutorials]) : super([tutorials]);

  @override
  String toString() => 'TutoActivitiesLoaded { tutoActivities: $tutorials }';
}


class TutoActivitiesNotLoaded extends TutorialsState {
  @override
  String toString() => 'tutoActivitiesNotLoaded';
}
