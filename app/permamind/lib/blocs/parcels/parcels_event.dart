import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';


abstract class ParcelsEvent extends Equatable {
  ParcelsEvent([List props = const []]) : super(props);
}

class LoadParcels extends ParcelsEvent {

  final String gardenId;
  final String userPseudo;
  final String userId;

  LoadParcels(this.gardenId, this.userPseudo, this.userId);

  @override
  String toString() => 'LoadParcels { gardenId: $gardenId, userPseudo: $userPseudo }';
}






