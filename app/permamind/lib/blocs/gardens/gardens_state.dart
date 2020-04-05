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

class GardensLoadInProgress extends GardensState {}

class GardensLoadSuccess extends GardensState {

  final List<Garden> gardens;

  GardensLoadSuccess([this.gardens]);

  @override
  List<Object> get props => [gardens];

  @override
  String toString() {
    String res = "GardensLoadSuccess: gardens = [";

    for (var garden in gardens) {
      res += " ${garden.name},";
    }
    res += ']';
    return res;
  }
}





//class GardensLoadSuccess extends GardensState {
//  final List<Garden> gardens;
//
//  GardensLoadSuccess([this.gardens = const []]) : super([gardens]);
//
//  @override
//  String toString() => "GardensLoadSuccess { gardens : $gardens }";
//}
