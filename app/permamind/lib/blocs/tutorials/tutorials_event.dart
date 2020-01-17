import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class TutorialsEvent extends Equatable {
  TutorialsEvent([List props = const []]) : super(props);
}

class LoadTutos extends TutorialsEvent {
  @override
  String toString() => 'LoadTutos';
}

class LoadTutoActivities extends TutorialsEvent {
  final String tutoId;

  LoadTutoActivities(this.tutoId) : super([tutoId]);
  
  @override
  String toString() => 'LoadTutoActivities { tutoId: $tutoId}';
}

class CompleteActivity extends TutorialsEvent {
  final TutorialActivity activity;

  CompleteActivity(this.activity) : super([activity]);

  @override
  String toString() => 'CompleteActivity { activity: $activity }';
}

class TutoActivitiesUpdated extends TutorialsEvent {
  final List<TutorialActivity> activities;

  TutoActivitiesUpdated(this.activities);

  @override
  String toString() => 'TutoActivitiesUpdated';
}

class TutosUpdated extends TutorialsEvent {
  final List<Tutorial> tutos;

  TutosUpdated(this.tutos);

  @override
  String toString() => 'TutosUpdated';
}