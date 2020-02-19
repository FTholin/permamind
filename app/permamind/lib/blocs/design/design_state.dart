import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

abstract class DesignState extends Equatable {
  DesignState();

  @override
  List<Object> get props => [];
}

class DesignLoading extends DesignState {}

class DesignLoaded extends DesignState {

  final DesignParcel designParcel;

  DesignLoaded(this.designParcel);

  @override
  List<Object> get props => [designParcel];

  @override
  String toString() {
    return 'DesignLoaded { DesignLoaded: $DesignLoaded }';
  }
}