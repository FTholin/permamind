import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:data_repository/data_repository.dart';

@immutable
abstract class GardensEvent extends Equatable {
  GardensEvent([List props = const []]) : super(props);
}

class GardensInit extends GardensEvent {
  @override
  String toString() => 'GardensInit';
}

class LoadGardens extends GardensEvent {

  final String userId;
  final String userPseudo;

  LoadGardens(this.userId, this.userPseudo) : super([userId, userPseudo]);

  @override
  String toString() => 'LoadGardens { userId: $userId}';
}


class AddGarden extends GardensEvent {
  final Garden garden;

  AddGarden(this.garden) : super([garden]);

  @override
  String toString() => 'AddGarden { garden: $garden }';
}



class CopyGarden extends GardensEvent {
  final Garden garden;

  CopyGarden(this.garden) : super([garden]);

  @override
  String toString() => 'CopyGarden { garden: $garden }';
}

class CopyActivities extends GardensEvent {
  final List<Activity> activities;

  CopyActivities(this.activities) : super([activities]);

  @override
  String toString() => 'CopyActivities { activities: $activities }';
}


class UpdateGarden extends GardensEvent {
  final Garden updatedGarden;

  UpdateGarden(this.updatedGarden) : super([updatedGarden]);

  @override
  String toString() => 'UpdateGarden { updatedGarden: $updatedGarden }';
}

class GardenDeleted extends GardensEvent {
  final Garden garden;

  GardenDeleted(this.garden) : super([garden]);

  @override
  String toString() => 'GardenDeleted { garden: $garden }';
}

class LeaveGarden extends GardensEvent {
  final Garden garden;
  final String userId;

  LeaveGarden(this.garden, this.userId) : super([garden, userId]);

  @override
  String toString() => 'LeaveGarden { garden: $garden }';
}

class ClearCompleted extends GardensEvent {
  @override
  String toString() => 'ClearCompleted';
}

class ToggleAll extends GardensEvent {
  @override
  String toString() => 'ToggleAll';
}

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


class GardensUpdated extends GardensEvent {
  final List<Garden> gardens;

  GardensUpdated(this.gardens);

  @override
  List<Object> get props => [gardens];
}



//
//class DesignParcelAdded extends GardensEvent {
//
//  final String gardenId;
//  final List<Design> designs;
//  final String parcelId;
//
//  DesignParcelAdded(this.gardenId, this.parcelId, this.designs);
//  @override
//  String toString() => 'DesignParcelAdded { designs: $designs }';
//}


//class ParcelDeleted extends GardensEvent {
//  final String parcelId;
//
//  ParcelDeleted(this.parcelId);
//
//  @override
//  List<Object> get props => [parcelId];
//
//  @override
//  String toString() => 'ParcelsDeleted { parcelId: $parcelId }';
//}
//
//class ParcelLeaved extends GardensEvent {
//  final Parcel leavedParcel;
//  final String userId;
//
//  ParcelLeaved(this.leavedParcel, this.userId);
//
//  @override
//  List<Object> get props => [leavedParcel, userId];
//
//  @override
//  String toString() => 'ParcelLeaved { leavedParcel: $leavedParcel }';
//}

//class ParcelCopied extends GardensEvent {
//  final Parcel copiedParcel;
//
//  ParcelCopied(this.copiedParcel);
//
//  @override
//  List<Object> get props => [copiedParcel];
//
//  @override
//  String toString() => 'ParcelCopied { copiedParcel: $copiedParcel }';
//}



//class ActivitiesCopied extends GardensEvent {
//  final List<Activity> activities;
//
//  ActivitiesCopied(this.activities);
//
//  @override
//  String toString() => 'ActivitiesCopied { activities: $activities }';
//}


class ModelingAdded extends GardensEvent {
  final List<ModelingSchedule> schedule;
  final String gardenId;
  final String parcelId;

  ModelingAdded(this.gardenId, this.parcelId, this.schedule);

  @override
  String toString() => 'ModelingAdded { activities: $schedule, gardenId: $gardenId}';
}




//
//class AddGardenActivities extends GardensEvent {
//
//  final List<ModelingSchedule> schedule;
//  final String gardenId;
//
//  AddGardenActivities(this.gardenId, this.schedule);
//
//  @override
//  String toString() => 'GardensUpdated';
//}
