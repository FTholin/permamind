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

class ParcelsAdded extends ParcelsEvent {
  final Parcel parcel;

  ParcelsAdded(this.parcel);

  @override
  List<Object> get props => [parcel];

  @override
  String toString() => 'ParcelsAdded { parcel: $parcel }';
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

class ParcelsUpdated extends ParcelsEvent {
  final List<Parcel> parcels;

  ParcelsUpdated(this.parcels);

  @override
  List<Object> get props => [parcels];

  @override
  String toString() => 'ParcelsUpdated { parcels: $parcels }';
}


