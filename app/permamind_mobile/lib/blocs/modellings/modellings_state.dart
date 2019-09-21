import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todos_repository/todos_repository.dart';

@immutable
abstract class ModellingsState extends Equatable {
  ModellingsState([List props = const[]]) : super(props);
}

class ModellingsLoading extends ModellingsState {
  @override
  String toString() => 'ModellingsLoading';
}

class ModellingsLoaded extends ModellingsState {
  final List<Modelling> modellingsFetched;

  ModellingsLoaded(this.modellingsFetched)
      : super([modellingsFetched]);

  @override
  String toString() => 'ModellingsLoaded { modellingsFetched: $modellingsFetched }';
}