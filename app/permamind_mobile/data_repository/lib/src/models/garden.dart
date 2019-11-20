import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../entities/entities.dart';

class Garden extends Equatable {
  final String id;
  final String gardenName;
  final bool publicVisibility;
  final String modelisationId;
  final List<String> gardenMembers;
  List<PlanningDay> planning = new List<PlanningDay>();
  final DateTime creationDate;

  Garden( this.gardenName,
    this.publicVisibility,
    this.gardenMembers,
    this.modelisationId,
    this.planning,
    this.creationDate,{String id})
      :  this.id = id;

  Garden copyWith({String gardenName, String id, bool publicVisibility, String modelisationId, List<String> gardenMembers}) {
    return Garden(
      gardenName ?? this.gardenName,
      publicVisibility ?? this.publicVisibility,
      gardenMembers ?? this.gardenMembers,
      modelisationId ?? this.modelisationId,
      planning ?? this.planning,
      creationDate ?? this.creationDate,
      id: id ?? this.id,
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^ gardenName.hashCode ^ publicVisibility.hashCode ^ gardenMembers.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Garden &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              gardenName == other.gardenName &&
              publicVisibility == other.publicVisibility &&
              gardenMembers == other.gardenMembers;


  @override
  String toString() {
    return 'Garden { id: $id, gardenName: $gardenName, publicVisibility: $publicVisibility, gardenMembers: $gardenMembers }';
  }

  GardenEntity toEntity() {
    return GardenEntity(id,
        gardenName,
        publicVisibility,
        gardenMembers,
        modelisationId,
        planning,
        creationDate
    );
  }

  static Garden fromEntity(GardenEntity entity) {

    return Garden(
      entity.gardenName,
      entity.publicVisibility,
      entity.gardenMembers,
      entity.modelisationId,
      entity.planning,
      entity.creationDate,
      id: entity.id,
    );
  }
}