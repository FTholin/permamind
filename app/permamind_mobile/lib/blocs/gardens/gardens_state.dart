import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:data_repository/data_repository.dart';


/*
* This states are results of event processing
* */
@immutable
abstract class GardensState extends Equatable {
  GardensState([List props = const []]) : super(props);
}

class GardensLoading extends GardensState {
  @override
  String toString() => "TodoLoading";
}

class GardensLoaded extends GardensState {
  final List<Garden> gardens;

  GardensLoaded([this.gardens = const []]) : super([gardens]);

  @override
  String toString() => "GardensLoaded { gardens : $gardens }";
}

class GardensNotLoaded extends GardensState {
  @override
  String toString() => "GardensNotLoaded";
}