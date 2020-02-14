import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

abstract class DesignState extends Equatable {
  DesignState();

  @override
  List<Object> get props => [];
}

class DesignLoading extends DesignState {}

class DesignLoaded extends DesignState {

  final GardenDesign designGarden;

  DesignLoaded(this.designGarden);

  @override
  List<Object> get props => [designGarden];

  @override
  String toString() {
    return 'DesignLoaded { DesignLoaded: $DesignLoaded }';
  }
}