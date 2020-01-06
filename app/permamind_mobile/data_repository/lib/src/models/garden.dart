import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../entities/entities.dart';

class Garden extends Equatable {
  final String id;
  final String name;
  final bool publicVisibility;
  final String modelingId;
  final String modelingName;
  final List<String> members;
  List<PlanningDay> schedule = new List<PlanningDay>();
  final DateTime creationDate;

  Garden( this.name,
    this.publicVisibility,
    this.members,
    this.modelingId,
    this.schedule,
    this.modelingName,
    this.creationDate,{String id})
      :  this.id = id;

  Garden copyWith({String name, String id, bool publicVisibility, String modelingId, List<String> members}) {
    return Garden(
      name ?? this.name,
      publicVisibility ?? this.publicVisibility,
      members ?? this.members,
      modelingId ?? this.modelingId,
      schedule ?? this.schedule,
      modelingName ?? this.modelingName,
      creationDate ?? this.creationDate,
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
        members,
        modelingId,
        modelingName,
        schedule,
        creationDate
    );
  }

  static Garden fromEntity(GardenEntity entity) {

    return Garden(
      entity.name,
      entity.publicVisibility,
      entity.members,
      entity.modelingId,
      entity.schedule,
      entity.modelingName,
      entity.creationDate,
      id: entity.id,
    );
  }
}