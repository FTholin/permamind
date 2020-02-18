import 'package:data_repository/data_repository.dart';
import 'package:data_repository/src/entities/entities.dart';
import 'package:equatable/equatable.dart';

class Parcel extends Equatable {
  final String id;
  final String name;
  final String gardenId;
  final bool publicVisibility;
  final String modelingId;
  final String modelingName;
  final double length;
  final double width;
  final bool gardenGround;
  final String admin;
  final List<GardenMember> members;
  final DateTime creationDate;
  final int dayActivitiesCount;

  Parcel(
      this.name,
      this.gardenId,
      this.length,
      this.width,
      this.gardenGround,
      this.publicVisibility,
      this.admin,
      this.members,
      this.modelingId,
      this.modelingName,
      this.creationDate,
      this.dayActivitiesCount,
      {String id})
      :  this.id = id;

  Parcel copyWith({String name, String gardenId, double length,
    double width, bool gardenGround, String id,
    bool publicVisibility, String modelingId,
    String admin, List<GardenMember> members}) {
    return Parcel(
      name ?? this.name,
      gardenId ?? this.gardenId,
      length ?? this.length,
      width ?? this.width,
      gardenGround ?? this.gardenGround,
      publicVisibility ?? this.publicVisibility,
      admin ?? this.admin,
      members ?? this.members,
      modelingId ?? this.modelingId,
      modelingName ?? this.modelingName,
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
          other is Parcel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              gardenId == other.gardenId &&
              publicVisibility == other.publicVisibility &&
              admin == other.admin &&
              members == other.members &&
              dayActivitiesCount == other.dayActivitiesCount;


  @override
  String toString() {
    return 'Parcel { id: $id, name: $name, publicVisibility: $publicVisibility, members: $members }';
  }

  ParcelEntity toEntity() {
    return ParcelEntity(
        id,
        name,
        gardenId,
        length,
        width,
        gardenGround,
        publicVisibility,
        admin,
        members,
        modelingId,
        modelingName,
        creationDate,
        dayActivitiesCount
    );
  }

  static Parcel fromEntity(ParcelEntity entity) {

    return Parcel(
      entity.name,
      entity.gardenId,
      entity.length,
      entity.width,
      entity.gardenGround,
      entity.publicVisibility,
      entity.admin,
      entity.members,
      entity.modelingId,
      entity.modelingName,
      entity.creationDate,
      entity.dayActivitiesCount,
      id: entity.id,
    );
  }
}