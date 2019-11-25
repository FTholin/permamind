import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

abstract class SchedulerEvent extends Equatable {
  SchedulerEvent();
}

//class UpdateFilter extends SchedulerEvent {
////  final VisibilityFilter filter;
//
//  const UpdateFilter(this.filter);
//
//  @override
//  List<Object> get props => [filter];
//
//  @override
//  String toString() => 'UpdateFilter { filter: $filter }';
//}

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

  final List<Activity> dayActivities;

  SelectDayActivities(this.dayActivities, this.schedule);

  @override
  List<Object> get props => [dayActivities, schedule];

  @override
  String toString() => 'selectDayActivities { dayActivities: $dayActivities, schedule: $schedule }';

}

