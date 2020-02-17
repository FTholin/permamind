import 'package:equatable/equatable.dart';

abstract class ParcelsState extends Equatable {
   ParcelsState();

  @override
  List<Object> get props => [];
}

class ParcelsLoading extends ParcelsState {}

class ParcelsLoaded extends ParcelsState {
  final List<Parcel> parcels;

  const ParcelsLoaded(
      this.parcels,
      );

  @override
  List<Object> get props => [parcels];

  @override
  String toString() {
    return 'ParcelsLoaded { parcels: $parcels }';
  }
}