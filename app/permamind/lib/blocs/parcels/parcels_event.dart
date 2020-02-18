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

class ParcelsUpdated extends ParcelsEvent {
  final List<Parcel> parcels;

  ParcelsUpdated(this.parcels);

  @override
  List<Object> get props => [parcels];

  @override
  String toString() => 'ParcelsUpdated { parcels: $parcels }';
}


