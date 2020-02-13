import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

abstract class DesignEvent extends Equatable {
  DesignEvent();
}

class UpdateDesign extends DesignEvent {

  final GardenDesign design;

  UpdateDesign(this.design);

  @override
  List<Object> get props => [design];

  @override
  String toString() => 'UpdateDesign { plan: $design }';

}

class LoadDesign extends DesignEvent {}

class DesignUpdated extends DesignEvent {

  final List<GardenDesign> designs;

  DesignUpdated(this.designs);

  @override
  List<Object> get props => [designs];
}

