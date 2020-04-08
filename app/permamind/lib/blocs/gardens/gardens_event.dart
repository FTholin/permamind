import 'package:authentication/authentication.dart';
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





