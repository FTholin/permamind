import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class Garden {
  final String gardenId;
  final String gardenName;
  final bool publicVisibility;
  final List<dynamic> gardenOwners;

  Garden(this.gardenName,
    this.publicVisibility,
    this.gardenOwners, {String gardenId}) : this.gardenId = gardenId;

  Garden copyWith({String gardenName, bool publicVisibility, List<String> gardenOwners}) {
    return Garden(
        gardenName ?? this.gardenName,
        publicVisibility ?? this.publicVisibility,
        gardenOwners ?? this.gardenOwners,
        gardenId: gardenId ?? this.gardenId,
    );
  }

  @override
  int get hashCode =>
      gardenId.hashCode ^ gardenName.hashCode ^ publicVisibility.hashCode ^ gardenOwners.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Garden &&
              runtimeType == other.runtimeType &&
              gardenId == other.gardenId &&
              gardenName == other.gardenName &&
              publicVisibility == other.publicVisibility &&
              gardenOwners == other.gardenOwners;


  @override
  String toString() {
    return 'Garden { gardenId: $gardenId, gardenName: $gardenName, publicVisibility: $publicVisibility, gardenOwners: $gardenOwners }';
  }

  GardenEntity toEntity() {
    return GardenEntity(gardenId, gardenName, publicVisibility, gardenOwners);
  }

  static Garden fromEntity(GardenEntity entity) {
    return Garden(
      entity.gardenName,
      entity.publicVisibility,
      entity.gardenOwners,
      gardenId: entity.gardenId,
    );
  }
}