import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:permamind_mobile/models/models.dart';

@immutable
abstract class TutorialsEvent extends Equatable {
  TutorialsEvent([List props = const []]) : super(props);
}

class LoadTutos extends TutorialsEvent {
  @override
  String toString() => 'LoadTutos';
}

class CompleteActivity extends TutorialsEvent {
  final TutorialActivity activity;

  CompleteActivity(this.activity) : super([activity]);

  @override
  String toString() => 'CompleteActivity { activity: $activity }';
}

class UncompleteActivity extends TutorialsEvent {
  final TutorialActivity activity;

  UncompleteActivity(this.activity) : super([activity]);

  @override
  String toString() => 'UncompleteActivity { activity: $activity }';
}

class CompleteTuto extends TutorialsEvent {
  final Tutorial tutorial;

  CompleteTuto(this.tutorial) : super([tutorial]);

  @override
  String toString() => 'CompleteTuto { tutorial: $tutorial }';
}

class UncompleteTuto extends TutorialsEvent {
  final Tutorial tutorial;

  UncompleteTuto(this.tutorial) : super([tutorial]);

  @override
  String toString() => 'UncompleteTuto { tutorial: $tutorial }';
}

class TutosUpdated extends TutorialsEvent {
  final List<Tutorial> tutos;

  TutosUpdated(this.tutos);

  @override
  String toString() => 'TutosUpdated';
}