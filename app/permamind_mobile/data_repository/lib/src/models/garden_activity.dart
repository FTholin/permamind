import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:data_repository/src/entities/entities.dart';


@immutable
class GardenActivity {
  final String id;
  final String name;
  final bool isDone;

  GardenActivity(this.name, {String id, bool isDone})
      : this.id = id, this.isDone = false;

  GardenActivity copyWith({String id, String name
  }) {
    return GardenActivity(
        name ?? this.name,
        isDone: isDone ?? this.isDone,
        id: id ?? this.id
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ isDone.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is GardenActivity &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              isDone == other.isDone;

  @override
  String toString() {
    return 'GardenActivity { id: $id, name: $name, isDone: $isDone}';
  }

  GardenActivityEntity toEntity() {
    return GardenActivityEntity(id, name, isDone);
  }

  static GardenActivity fromEntity(GardenActivityEntity entity) {
    return GardenActivity(
      entity.name,
      isDone: entity.isDone,
      id: entity.id,
    );
  }
}