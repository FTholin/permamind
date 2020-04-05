import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:data_repository/data_repository.dart';


abstract class GardensEvent extends Equatable {
  GardensEvent([List props = const []]) : super(props);
}



class GardensLoadedSuccess extends GardensEvent {
  final String userId;
  final String userPseudo;

  GardensLoadedSuccess(this.userId, this.userPseudo);
  @override
  List<Object> get props => [userId, userPseudo];

  @override
  String toString() {
    return 'GardensLoadedSuccess';
  }
}

class GardensUpdated extends GardensEvent {
  final List<Garden> gardens;

  GardensUpdated(this.gardens);

  @override
  List<Object> get props => [gardens];

  @override
  String toString() => 'GardensUpdated { gardens: $gardens }';
}

class GardenUpdated extends GardensEvent {
  final Garden garden;

  GardenUpdated(this.garden);

  @override
  List<Object> get props => [garden];

  @override
  String toString() => 'GardenUpdated { garden: $garden }';
}


class GardenAdded extends GardensEvent {
  final Garden garden;

  GardenAdded(this.garden);

  @override
  List<Object> get props => [garden];

  @override
  String toString() => 'GardenAdded { garden: $garden }';
}

class GardenDeleted extends GardensEvent {
  final Garden garden;

  GardenDeleted(this.garden);

  @override
  List<Object> get props => [garden];

  @override
  String toString() => 'GardensDeleted { garden: $garden }';
}






//@immutable
//abstract class GardensEvent extends Equatable {
//  GardensEvent([List props = const []]) : super(props);
//}
//
//class GardensInit extends GardensEvent {
//  @override
//  String toString() => 'GardensInit';
//}
//
//class GardensLoadedSuccess extends GardensEvent {
//
//  final String userId;
//  final String userPseudo;
//
//  GardensLoadedSuccess(this.userId, this.userPseudo) : super([userId, userPseudo]);
//
//  @override
//  List<Object> get props => [userId, userPseudo];
//
//  @override
//  String toString() => 'GardensLoadedSuccess { userId: $userId}';
//}
//
//
//class GardenAdded extends GardensEvent {
//  final Garden garden;
//
//  GardenAdded(this.garden) : super([garden]);
//
//  @override
//  List<Object> get props => [garden];
//
//  @override
//  String toString() => 'GardenAdded { garden: $garden }';
//}
//
//
//
//class CopyGarden extends GardensEvent {
//  final Garden garden;
//
//  CopyGarden(this.garden) : super([garden]);
//
//  @override
//  List<Object> get props => [garden];
//
//  @override
//  String toString() => 'CopyGarden { garden: $garden }';
//}
//
//class CopyActivities extends GardensEvent {
//  final List<Activity> activities;
//
//  CopyActivities(this.activities) : super([activities]);
//
//  @override
//  List<Object> get props => [activities];
//
//  @override
//  String toString() => 'CopyActivities { activities: $activities }';
//}
//
//
//class GardenUpdated extends GardensEvent {
//  final Garden updatedGarden;
//
//  GardenUpdated(this.updatedGarden) : super([updatedGarden]);
//
//  @override
//  List<Object> get props => [updatedGarden];
//
//  @override
//  String toString() => 'GardenUpdated { updatedGarden: $updatedGarden }';
//}
//
//class GardenDeleted extends GardensEvent {
//  final Garden garden;
//
//  GardenDeleted(this.garden) : super([garden]);
//
//  @override
//  List<Object> get props => [garden];
//
//  @override
//  String toString() => 'GardenDeleted { garden: $garden }';
//}
//
//class LeaveGarden extends GardensEvent {
//  final Garden garden;
//  final String userId;
//
//  LeaveGarden(this.garden, this.userId) : super([garden, userId]);
//
//
//  @override
//  List<Object> get props => [garden, userId];
//
//  @override
//  String toString() => 'LeaveGarden { garden: $garden }';
//}
//
//





//class GardensUpdated extends GardensEvent {
//
//  final List<Garden> gardens;
//
//  GardensUpdated([this.gardens = const []]) : super([gardens]);
//
//  @override
//  String toString() {
//    String res = "Gardens Updated: gardens = [";
//
//    for (var garden in gardens) {
//      res += " ${garden.name},";
//    }
//    res += ']';
//    return res;
//  }
//}


//class GardensUpdated extends GardensEvent {
//  final List<Garden> gardens;
//
//  GardensUpdated(this.gardens);
//
//  @override
//  List<Object> get props => [gardens];
//}



//
//class DesignGardenAdded extends GardensEvent {
//
//  final String gardenId;
//  final List<Design> designs;
//  final String gardenId;
//
//  DesignGardenAdded(this.gardenId, this.gardenId, this.designs);
//  @override
//  String toString() => 'DesignGardenAdded { designs: $designs }';
//}



//
//class GardenLeaved extends GardensEvent {
//  final Garden leavedGarden;
//  final String userId;
//
//  GardenLeaved(this.leavedGarden, this.userId);
//
//  @override
//  List<Object> get props => [leavedGarden, userId];
//
//  @override
//  String toString() => 'GardenLeaved { leavedGarden: $leavedGarden }';
//}

//class GardenCopied extends GardensEvent {
//  final Garden copiedGarden;
//
//  GardenCopied(this.copiedGarden);
//
//  @override
//  List<Object> get props => [copiedGarden];
//
//  @override
//  String toString() => 'GardenCopied { copiedGarden: $copiedGarden }';
//}



//class ActivitiesCopied extends GardensEvent {
//  final List<Activity> activities;
//
//  ActivitiesCopied(this.activities);
//
//  @override
//  String toString() => 'ActivitiesCopied { activities: $activities }';
//}







//
//class GardenAddedActivities extends GardensEvent {
//
//  final List<ModelingSchedule> schedule;
//  final String gardenId;
//
//  GardenAddedActivities(this.gardenId, this.schedule);
//
//  @override
//  String toString() => 'GardensUpdated';
//}
