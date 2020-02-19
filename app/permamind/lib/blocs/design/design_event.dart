import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

abstract class DesignEvent extends Equatable {
  DesignEvent();
}

class UpdateDesign extends DesignEvent {

  final DesignParcel design;

  UpdateDesign(this.design);

  @override
  List<Object> get props => [design];

  @override
  String toString() => 'UpdateDesign { plan: $design }';

}

class LoadDesign extends DesignEvent {}

class DesignUpdated extends DesignEvent {

  final DesignParcel gardenDesign;

  DesignUpdated(this.gardenDesign);

  @override
  List<Object> get props => [gardenDesign];
}

