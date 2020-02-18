import 'package:data_repository/data_repository.dart';
import 'package:data_repository/src/entities/entities.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class Parcel extends Equatable {
  final String id;
  final String name;
  final String gardenId;
  final bool publicVisibility;
  final String currentModelingId;
  final String currentModelingName;
  final double length;
  final double width;
  final bool gardenGround;
  final String admin;
  final List<GardenMember> members;
  final List<String> modelingsMonitoring;
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
      this.currentModelingId,
      this.currentModelingName,
      this.creationDate,
      this.dayActivitiesCount,
      this.modelingsMonitoring,
      {String id})
      :  this.id = id;

  Parcel copyWith({String name, String gardenId, double length,
    double width, bool gardenGround, bool publicVisibility, String admin,
    List<GardenMember> members, String currentModelingId, String currentModelingName,
    DateTime creationDate, int dayActivitiesCount, List<String> modelingsMonitoring,
      String id}) {
    return Parcel(
      name ?? this.name,
      gardenId ?? this.gardenId,
      length ?? this.length,
      width ?? this.width,
      gardenGround ?? this.gardenGround,
      publicVisibility ?? this.publicVisibility,
      admin ?? this.admin,
      members ?? this.members,
      currentModelingId ?? this.currentModelingId,
      currentModelingName ?? this.currentModelingName,
      creationDate ?? this.creationDate,
      dayActivitiesCount ?? this.dayActivitiesCount,
      modelingsMonitoring ?? this.modelingsMonitoring,
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
        currentModelingId,
        currentModelingName,
        creationDate,
        dayActivitiesCount,
        modelingsMonitoring
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
      entity.currentModelingId,
      entity.currentModelingName,
      entity.creationDate,
      entity.dayActivitiesCount,
      entity.modelingsMonitoring,
      id: entity.id,
    );
  }
}