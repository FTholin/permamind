import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

abstract class ActivitiesEvent extends Equatable {
  ActivitiesEvent([List props = const []]) : super(props);
}

class ActivitiesLoadedSuccess extends ActivitiesEvent {
  final String parcelId;
  final DateTime start;
  final DateTime last;

  ActivitiesLoadedSuccess(this.parcelId, this.start, this.last);

  @override
  List<Object> get props => [parcelId, start, last];
}


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


class ActivityUpdated extends ActivitiesEvent {
  final Activity updatedActivity;

  ActivityUpdated(this.updatedActivity) : super([updatedActivity]);

  @override
  List<Object> get props => [updatedActivity];

  @override
  String toString() => 'ActivityUpdated { updatedActivity: $updatedActivity }';

}

class AddActivity extends ActivitiesEvent {
  final Activity newActivity;

  AddActivity(this.newActivity) : super([AddActivity]);

  @override
  List<Object> get props => [newActivity];

  @override
  String toString() => 'UpdateActivity { newActivity: $newActivity }';
}

class ActivitiesDeletedFromParcel extends ActivitiesEvent {
  final String parcelId;

  ActivitiesDeletedFromParcel(this.parcelId) : super([parcelId]);

  @override
  List<Object> get props => [parcelId];

  @override
  String toString() => 'ActivitiesDeletedFromParcel { gardenId: $parcelId }';
}


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
//class GardenUpdatedActivities extends ActivitiesEvent {
//
//  final Garden garden;
//
//  GardenUpdatedActivities(this.garden);
//
//  @override
//  List<Object> get props => [garden];
//
//  @override
//  String toString() => 'GardenUpdatedActivities { garden: $garden }';
//}
