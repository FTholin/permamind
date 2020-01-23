import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

abstract class ActivitiesEvent extends Equatable {
  ActivitiesEvent([List props = const []]) : super(props);
}

class LoadActivities extends ActivitiesEvent {}


class ActivitiesUpdated extends ActivitiesEvent {
  final Map<DateTime, List> activities;

   ActivitiesUpdated(this.activities);

  @override
  List<Object> get props => [activities];
}


class SelectDayActivities extends ActivitiesEvent {

  final DateTime selectedDay;
  final Map<DateTime, List> dayActivities;


  SelectDayActivities(this.selectedDay, this.dayActivities);

  @override
  List<Object> get props => [selectedDay, dayActivities];

  @override
  String toString() => 'selectDayActivities {dayActivities: $dayActivities }';
}


class UpdateActivity extends ActivitiesEvent {
  final Activity updatedActivity;

  UpdateActivity(this.updatedActivity) : super([updatedActivity]);

  @override
  String toString() => 'UpdateActivity { updatedActivity: $updatedActivity }';

}

class AddActivity extends ActivitiesEvent {
  final Activity newActivity;

  AddActivity(this.newActivity) : super([AddActivity]);

  @override
  String toString() => 'UpdateActivity { newActivity: $newActivity }';
}

//class LoadActivities extends ActivitiesEvent {
//
//  final String gardenId;
//
//  LoadActivities(this.gardenId) : super([gardenId]);
//
//  @override
//  String toString() => 'LoadActivities { gardenId: $gardenId}';
//}


//






//class ScheduleUpdated extends ActivitiesEvent {
//
//  final Map<DateTime, List> schedule;
//
//  ScheduleUpdated(this.schedule);
//
//  @override
//  List<Object> get props => [schedule];
//}
//
//class SelectDayActivities extends ActivitiesEvent {
//
//  final DateTime selectedDay;
//  final Map<DateTime, List> dayActivities;
//
//
//  SelectDayActivities(this.selectedDay, this.dayActivities);
//
//  @override
//  List<Object> get props => [selectedDay, dayActivities];
//
//  @override
//  String toString() => 'selectDayActivities {dayActivities: $dayActivities }';
//}
//class UpdateScheduler extends ActivitiesEvent {
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
//class UpdateGardenActivities extends ActivitiesEvent {
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
