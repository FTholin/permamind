import 'package:data_repository/data_repository.dart';
import 'package:data_repository/src/entities/entities.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Garden extends Equatable {
  final String id;
  final String name;
  final bool publicVisibility;
  final String admin;
  final List<GardenMember> members;
  final DateTime creationDate;
  final int dayActivitiesCount;

  Garden(
      this.name,
      this.publicVisibility,
      this.admin,
      this.members,
      this.creationDate,
      this.dayActivitiesCount,
      {String id})
      :  this.id = id;

  Garden copyWith({String name, String id, bool publicVisibility, String admin, List<GardenMember> members, DateTime creationDate, int dayActivitiesCount}) {
    return Garden(
      name ?? this.name,
      publicVisibility ?? this.publicVisibility,
      admin ?? this.admin,
      members ?? this.members,
      creationDate ?? this.creationDate,
      dayActivitiesCount ?? this.dayActivitiesCount,
      id: id ?? this.id,
    );
  }



  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ publicVisibility.hashCode ^ members.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Garden &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              publicVisibility == other.publicVisibility &&
              admin == other.admin &&
              members == other.members;

  @override
  String toString() {
    return 'Garden { id: $id, name: $name, publicVisibility: $publicVisibility, members: $members }';
  }

  GardenEntity toEntity() {
    return GardenEntity(
        id,
        name,
        publicVisibility,
        admin,
        members,
        creationDate,
        dayActivitiesCount
    );
  }

  static Garden fromEntity(GardenEntity entity) {

    return Garden(
      entity.name,
      entity.publicVisibility,
      entity.admin,
      entity.members,
      entity.creationDate,
      entity.dayActivitiesCount,
      id: entity.id,
    );
  }
}
