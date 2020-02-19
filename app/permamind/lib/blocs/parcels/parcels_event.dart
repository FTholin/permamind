import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

abstract class ParcelsEvent extends Equatable {
  ParcelsEvent();
}


class LoadParcels extends ParcelsEvent {
  final String gardenId;

  LoadParcels(this.gardenId);

  @override
  String toString() => 'LoadParcels { gardenId: $gardenId }';
}

class ParcelAdded extends ParcelsEvent {
  final Parcel parcel;

  ParcelAdded(this.parcel);

  @override
  List<Object> get props => [parcel];

  @override
  String toString() => 'ParcelAdded { parcel: $parcel }';
}


class DesignParcelAdded extends ParcelsEvent {
  final List<Design> designs;
  final String parcelId;

  DesignParcelAdded(this.parcelId, this.designs);

  @override
  String toString() => 'DesignParcelAdded { designs: $designs }';
}


class ParcelDeleted extends ParcelsEvent {
  final Parcel deletedParcel;

  ParcelDeleted(this.deletedParcel);

  @override
  List<Object> get props => [deletedParcel];

  @override
  String toString() => 'ParcelsDeleted { deletedParcel: $deletedParcel }';
}

class ParcelLeaved extends ParcelsEvent {
  final Parcel leavedParcel;
  final String userId;

  ParcelLeaved(this.leavedParcel, this.userId);

  @override
  List<Object> get props => [leavedParcel, userId];

  @override
  String toString() => 'ParcelLeaved { leavedParcel: $leavedParcel }';
}

class ParcelCopied extends ParcelsEvent {
  final Parcel copiedParcel;

  ParcelCopied(this.copiedParcel);

  @override
  List<Object> get props => [copiedParcel];

  @override
  String toString() => 'ParcelCopied { copiedParcel: $copiedParcel }';
}

class ParcelUpdated extends ParcelsEvent {
  final Parcel parcelUpdated;

  ParcelUpdated(this.parcelUpdated);

  @override
  String toString() => 'ParcelsUpdated { parcelsUpdated: $parcelUpdated }';
}

class ActivitiesCopied extends ParcelsEvent {
  final List<Activity> activities;

  ActivitiesCopied(this.activities);

  @override
  String toString() => 'ActivitiesCopied { activities: $activities }';
}


class ModelingAdded extends ParcelsEvent {
  final List<ModelingSchedule> schedule;
  final String gardenId;

  ModelingAdded(this.gardenId, this.schedule);

  @override
  String toString() => 'ModelingAdded { activities: $schedule, gardenId: $gardenId}';
}

class ParcelsUpdated extends ParcelsEvent {
  final List<Parcel> parcels;

  ParcelsUpdated(this.parcels);

  @override
  List<Object> get props => [parcels];

  @override
  String toString() => 'ParcelsUpdated { parcels: $parcels }';
}


