import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';


abstract class ParcelsEvent extends Equatable {
  ParcelsEvent([List props = const []]) : super(props);
}

//

class ParcelsLoadedSuccess extends ParcelsEvent {
  final String gardenId;
  final String userId;
  final String userPseudo;

  ParcelsLoadedSuccess(this.gardenId, this.userId, this.userPseudo);
  @override
  List<Object> get props => [gardenId, userId, userPseudo];

  @override
  String toString() {
    return 'ParcelsGardensLoadSuccessSuccess';
  }
}

//class LoadUpdated extends  {
//  final List<Garden> gardens;
//
//   GardensUpdated(this.gardens);
//
//  @override
//  List<Object> get props => [gardens];
//
//  @override
//  String toString() => 'GardensUpdated { todos: $gardens }';
//}

class ParcelsUpdated extends ParcelsEvent {
  final List<Parcel> parcels;

  ParcelsUpdated(this.parcels);

  @override
  List<Object> get props => [parcels];

  @override
  String toString() => 'ParcelsUpdated { parcels: $parcels }';
}

class ParcelUpdated extends ParcelsEvent {
  final Parcel parcel;

  ParcelUpdated(this.parcel);

  @override
  List<Object> get props => [parcel];

  @override
  String toString() => 'ParcelUpdated { parcel: $parcel }';
}


class ParcelAdded extends ParcelsEvent {
  final Parcel parcel;

  ParcelAdded(this.parcel);

  @override
  List<Object> get props => [parcel];

  @override
  String toString() => 'ParcelAdded { parcel: $parcel }';
}

class ParcelDeleted extends ParcelsEvent {
  final String parcelId;

  ParcelDeleted(this.parcelId);

  @override
  List<Object> get props => [parcelId];

  @override
  String toString() => 'ParcelsDeleted { parcelId: $parcelId }';
}


class ModelingAdded extends ParcelsEvent {
  final List<ModelingSchedule> schedule;
  final String gardenId;
  final String parcelId;

  ModelingAdded(this.gardenId, this.parcelId, this.schedule);

  @override
  String toString() => 'ModelingAdded { activities: $schedule, gardenId: $gardenId}';
}