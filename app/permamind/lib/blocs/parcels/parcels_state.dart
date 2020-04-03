import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

abstract class ParcelsState extends Equatable {
  ParcelsState();

  @override
  List<Object> get props => [];
}

class ParcelsGardensLoadInProgress extends ParcelsState {}

class ParcelsGardensLoadSuccess extends ParcelsState {
  final List<Garden> gardens;

  ParcelsGardensLoadSuccess(this.gardens);
  @override
  List<Object> get props => [gardens];

  @override
  String toString() {
    return 'ParcelsGardensLoadSuccess { gardens: $gardens}';
  }
}

class ParcelsLoaded extends ParcelsState {

  final List<Parcel> parcels;

  ParcelsLoaded([this.parcels]) : super();
}

//
//abstract class ParcelsState extends Equatable {
//  ParcelsState();
//
//  @override
//  List<Object> get props => [];
//}
//
//class ParcelsLoading extends ParcelsState {}
//
//class ParcelsLoaded extends ParcelsState {
//  final List<Parcel> parcels;
//
//  ParcelsLoaded(this.parcels);
//
//  @override
//  List<Object> get props => [parcels];
//
//  @override
//  String toString() {
//    return 'ParcelsLoaded { parcels: $parcels }';
//  }
//}

