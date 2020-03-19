import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

abstract class ParcelsEvent extends Equatable {
  ParcelsEvent();
}


class LoadParcels extends ParcelsEvent {

  final String gardenId;
  final String userPseudo;
  final String userId;

  LoadParcels(this.gardenId, this.userPseudo, this.userId);

  @override
  String toString() => 'LoadParcels { gardenId: $gardenId, userPseudo: $userPseudo }';
}






