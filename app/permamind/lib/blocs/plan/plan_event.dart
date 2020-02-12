import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

abstract class PlanEvent extends Equatable {
  PlanEvent();
}

class UpdatePlan extends PlanEvent {

  final GardenPlan plan;

  UpdatePlan(this.plan);

  @override
  List<Object> get props => [plan];

  @override
  String toString() => 'UpdatePlan { plan: $plan }';

}

class LoadPlan extends PlanEvent {}

class PlanUpdated extends PlanEvent {

  final GardenPlan plan;

  PlanUpdated(this.plan);

  @override
  List<Object> get props => [plan];
}

