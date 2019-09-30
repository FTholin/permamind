import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../entities/entities.dart';
import 'package:uuid/uuid.dart';

@immutable
class Garden extends Equatable {
  final String gardenId;
  final String gardenName;
  final bool publicVisibility;
  final List<String> gardenMembers;

  Garden( this.gardenName,
    this.publicVisibility,
    this.gardenMembers,{String gardenId})
      :  this.gardenId = gardenId ??  Uuid().v4();

  Garden copyWith({String gardenName, String gardenId, bool publicVisibility, List<String> gardenMembers}) {
    return Garden(
      gardenName ?? this.gardenName,
      publicVisibility ?? this.publicVisibility,
      gardenMembers ?? this.gardenMembers,
      gardenId: gardenId ?? this.gardenId,
    );
  }

  @override
  int get hashCode =>
      gardenId.hashCode ^ gardenName.hashCode ^ publicVisibility.hashCode ^ gardenMembers.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Garden &&
              runtimeType == other.runtimeType &&
              gardenId == other.gardenId &&
              gardenName == other.gardenName &&
              publicVisibility == other.publicVisibility &&
              gardenMembers == other.gardenMembers;


  @override
  String toString() {
    return 'Garden { gardenId: $gardenId, gardenName: $gardenName, publicVisibility: $publicVisibility, gardenMembers: $gardenMembers }';
  }

  GardenEntity toEntity() {
    return GardenEntity(gardenId, gardenName, publicVisibility, gardenMembers);
  }

  static Garden fromEntity(GardenEntity entity) {

    return Garden(
      entity.gardenName,
      entity.publicVisibility,
      entity.gardenMembers,
      gardenId: entity.gardenId ?? Uuid().v4(),
    );
  }
}