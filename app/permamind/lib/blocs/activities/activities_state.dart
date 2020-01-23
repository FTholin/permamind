import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

abstract class ActivitiesState extends Equatable {
  ActivitiesState();

  @override
  List<Object> get props => [];
}


class ActivitiesLoading extends ActivitiesState {
  @override
  String toString() => "ActivitiesLoading";
}


class ActivitiesNotLoaded extends ActivitiesState {
  @override
  String toString() => "ActivitiesNotLoaded";
}


class ActivitiesLoaded extends ActivitiesState {

  final DateTime referenceDate;
  final Map<DateTime, List> schedule;

  ActivitiesLoaded([this.referenceDate, this.schedule]);

  @override
  List<Object> get props => [referenceDate, schedule];

  @override
  String toString() => 'ActivitiesLoaded { activities: $schedule }';
}



//
//class DayActivitiesLoaded extends ActivitiesState {
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
