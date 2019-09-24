import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:data_repository/data_repository.dart';

@immutable
abstract class StatsEvent extends Equatable {
  StatsEvent([List props = const []]) : super(props);
}

class UpdateStats extends StatsEvent {
  final List<Garden> gardens;

  UpdateStats(this.gardens) : super([gardens]);

  @override
  String toString() => 'UpdateStats { todos: $gardens }';
}

