import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:data_repository/src/entities/entities.dart';


@immutable
class TutorialActivity {
  final String id;
  final String name;


  TutorialActivity(this.name,{String id})
      : this.id = id;

  TutorialActivity copyWith({String id, String name
  }) {
    return TutorialActivity(
        name ?? this.name,
        id: id ?? this.id
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TutorialActivity &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name;

  @override
  String toString() {
    return 'TutorialActivity { id: $id, name: $name}';
  }

  TutorialActivityEntity toEntity() {
    return TutorialActivityEntity(id, name);
  }

  static TutorialActivity fromEntity(TutorialActivityEntity entity) {
    return TutorialActivity(
      entity.name,
      id: entity.id,
    );
  }
}