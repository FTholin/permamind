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
    return 'ParcelsGardensLoadedSuccess';
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



