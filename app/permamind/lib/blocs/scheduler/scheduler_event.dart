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
  final Activity updatedActivity;

  UpdateActivity(this.updatedActivity) : super([updatedActivity]);

  @override
  String toString() => 'UpdateActivity { updatedActivity: $updatedActivity }';

}



class ScheduleUpdated extends SchedulerEvent {

  final Map<DateTime, List> schedule;

  ScheduleUpdated(this.schedule);

  @override
  List<Object> get props => [schedule];
}

class SelectDayActivities extends SchedulerEvent {

  final DateTime selectedDay;
  final Map<DateTime, List> dayActivities;


  SelectDayActivities(this.selectedDay, this.dayActivities);

  @override
  List<Object> get props => [selectedDay, dayActivities];

  @override
  String toString() => 'selectDayActivities {dayActivities: $dayActivities }';
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
