import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

abstract class SchedulerEvent extends Equatable {
  SchedulerEvent();
}

class UpdateScheduler extends SchedulerEvent {
  final List<PlanningDay> schedule;

  UpdateScheduler(this.schedule);

  @override
  List<Object> get props => [schedule];

  @override
  String toString() => 'UpdateScheduler { schedule: $schedule }';
}

class SelectDayActivities extends SchedulerEvent {

  final List<PlanningDay> schedule;

  final int dayIndex;

  SelectDayActivities(this.dayIndex, this.schedule);

  @override
  List<Object> get props => [dayIndex, schedule];

  @override
  String toString() => 'selectDayActivities { dayActivities: $dayIndex, schedule: $schedule }';
}


class UpdateGardenActivities extends SchedulerEvent {

  final Garden garden;

  UpdateGardenActivities(this.garden);

  @override
  List<Object> get props => [garden];

  @override
  String toString() => 'UpdateGardenActivities { garden: $garden }';
}
