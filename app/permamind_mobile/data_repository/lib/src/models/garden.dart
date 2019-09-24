import 'package:meta/meta.dart';
import '../entities/entities.dart';

@immutable
class Garden {
  final String gardenId;
  final String gardenName;
  final bool gardenPublicVisibility;
  final List<String> gardenOwners;

  Garden(this.gardenName,
    this.gardenPublicVisibility,
    this.gardenOwners, {String gardenId}) : this.gardenId = gardenId;

  Garden copyWith({String gardenName, bool gardenPublicVisibility, List<String> gardenOwners}) {
    return Garden(
        gardenName ?? this.gardenName,
        gardenPublicVisibility ?? this.gardenPublicVisibility,
        gardenOwners ?? this.gardenOwners,
        gardenId: gardenId ?? this.gardenId,
    );
  }

  @override
  int get hashCode =>
      gardenId.hashCode ^ gardenName.hashCode ^ gardenPublicVisibility.hashCode ^ gardenOwners.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Garden &&
              runtimeType == other.runtimeType &&
              gardenId == other.gardenId &&
              gardenName == other.gardenName &&
              gardenPublicVisibility == other.gardenPublicVisibility &&
              gardenOwners == other.gardenOwners;


  @override
  String toString() {
    return 'Garden { gardenId: $gardenId, gardenName: $gardenName, gardenPublicVisibility: $gardenPublicVisibility, gardenOwners: $gardenOwners }';
  }

  GardenEntity toEntity() {
    return GardenEntity(gardenId, gardenName, gardenPublicVisibility, gardenOwners);
  }

  static Garden fromEntity(GardenEntity entity) {
    return Garden(
      entity.gardenName,
      entity.gardenPublicVisibility,
      entity.gardenOwners,
      gardenId: entity.gardenId,
    );
  }
}