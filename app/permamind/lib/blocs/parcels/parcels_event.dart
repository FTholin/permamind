import 'package:equatable/equatable.dart';

abstract class ParcelsEvent extends Equatable {
  ParcelsEvent();
}


class UpdateParcels extends ParcelsEvent {
  final List<Parcel> parcels;

  const UpdateParcels(this.parcels);

  @override
  List<Object> get props => [parcels];

  @override
  String toString() => 'UpdateParcels { parcels: $parcels }';
}