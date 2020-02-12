import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

abstract class PlanState extends Equatable {
  PlanState();

  @override
  List<Object> get props => [];
}

class PlanLoading extends PlanState {}

class PlanLoaded extends PlanState {

  final GardenPlan plan;

  PlanLoaded(this.plan);

  @override
  List<Object> get props => [plan];

  @override
  String toString() {
    return 'PlanLoaded { PlanLoaded: $PlanLoaded }';
  }
}