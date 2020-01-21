import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

abstract class SchedulerState extends Equatable {
  SchedulerState();

  @override
  List<Object> get props => [];
}


class ActivitiesLoading extends SchedulerState {
  @override
  String toString() => "ActivitiesLoading";
}


class ActivitiesNotLoaded extends SchedulerState {
  @override
  String toString() => "ActivitiesNotLoaded";
}


class ActivitiesLoaded extends SchedulerState {

  final DateTime referenceDate;
  final Map<DateTime, List> schedule;

  ActivitiesLoaded([this.referenceDate, this.schedule]);

  @override
  List<Object> get props => [referenceDate, schedule];

  @override
  String toString() => 'ActivitiesLoaded { activities: $schedule }';
}


//
//class DayActivitiesLoaded extends SchedulerState {
////  final List<PlanningDay> schedule;
//  final int dayIndex;
//
//  DayActivitiesLoaded(
////      this.schedule,
//      this.dayIndex);
//
//  @override
//  List<Object> get props => [
////    schedule,
//    dayIndex];
//
//  @override
//  String toString() {
////    return 'DayActivitiesLoaded { filteredTodos: $schedule }';
//  }
//}
