import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:permamind_mobile/models/models.dart';

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


class ActivityCompleted extends TutorialsState {
  final TutorialActivity activity;

  ActivityCompleted(this.activity) : super([activity]);

  @override
  String toString() => 'ActivityCompleted { activities: $activity }';
}

class ActivityNotCompleted extends TutorialsState {
  final TutorialActivity activity;

  ActivityNotCompleted(this.activity) : super([activity]);

  @override
  String toString() => 'ActivityCompleted { activities: $activity }';
}