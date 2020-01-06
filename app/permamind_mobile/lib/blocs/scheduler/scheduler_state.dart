import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

abstract class SchedulerState extends Equatable {
  SchedulerState();

  @override
  List<Object> get props => [];
}

class SchedulerLoading extends SchedulerState {}

class SchedulerLoaded extends SchedulerState {
  final List<PlanningDay> schedule;

  SchedulerLoaded(this.schedule);

  @override
  List<Object> get props => [schedule];

  @override
  String toString() {
    return 'SchedulerLoaded { filteredTodos: $schedule }';
  }
}

class DayActivitiesLoaded extends SchedulerState {
  final List<PlanningDay> schedule;
  final int dayIndex;

  DayActivitiesLoaded(this.schedule, this.dayIndex);

  @override
  List<Object> get props => [schedule, dayIndex];

  @override
  String toString() {
    return 'DayActivitiesLoaded { filteredTodos: $schedule }';
  }
}
