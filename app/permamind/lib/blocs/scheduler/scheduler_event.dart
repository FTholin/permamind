import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

abstract class SchedulerEvent extends Equatable {
  SchedulerEvent([List props = const []]) : super(props);
}

class LoadActivities extends SchedulerEvent {

  final String gardenId;

  LoadActivities(this.gardenId) : super([gardenId]);

  @override
  String toString() => 'LoadActivities { gardenId: $gardenId}';
}

class AddActivity extends SchedulerEvent {

}

class UpdateActivity extends SchedulerEvent {

}


class ActivitiesUpdated extends SchedulerEvent {
  final List<Activity> activities;

  ActivitiesUpdated(this.activities);

  @override
  List<Object> get props => [activities];
}


//class UpdateScheduler extends SchedulerEvent {
////  final List<PlanningDay> schedule;
//
//  UpdateScheduler(
////      this.schedule
//      );
//
//  @override
//  List<Object> get props => [
////    schedule
//  ];
//
//  @override
////  String toString() => 'UpdateScheduler { schedule: $schedule }';
//}
//
//class SelectDayActivities extends SchedulerEvent {
//
////  final List<PlanningDay> schedule;
//
//  final int dayIndex;
//
//  SelectDayActivities(this.dayIndex,
////      this.schedule
//      );
//
//  @override
//  List<Object> get props => [dayIndex,
////    schedule
//  ];
//
//  @override
////  String toString() => 'selectDayActivities { dayActivities: $dayIndex, schedule: $schedule }';
//}
//
//
//class UpdateGardenActivities extends SchedulerEvent {
//
//  final Garden garden;
//
//  UpdateGardenActivities(this.garden);
//
//  @override
//  List<Object> get props => [garden];
//
//  @override
//  String toString() => 'UpdateGardenActivities { garden: $garden }';
//}
