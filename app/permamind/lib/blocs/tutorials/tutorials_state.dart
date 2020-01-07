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
  final List<Tutorial> tutorials;

  TutosLoaded([this.tutorials = const []]) : super([tutorials]);

  @override
  String toString() => 'TutosLoaded { activities: $tutorials }';
}

class TutosNotLoaded extends TutorialsState {
  @override
  String toString() => 'TodosNotLoaded';
}

class ActivitiesLoading extends TutorialsState {
  @override
  String toString() => 'ActivitiesLoading';
}

class ActivitiesLoaded extends TutorialsState {
  final List<TutorialActivity> activities;

  ActivitiesLoaded([this.activities = const []]) : super([activities]);

  @override
  String toString() => 'ActivitiesLoaded { activities: $activities }';
}


class ActivitiesNotLoaded extends TutorialsState {
  @override
  String toString() => 'ActivitiesNotLoaded';
}
