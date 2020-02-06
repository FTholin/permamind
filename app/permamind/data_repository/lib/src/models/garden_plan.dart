import 'package:data_repository/src/entities/entities.dart';
import 'package:equatable/equatable.dart';

class GardenPlan extends Equatable {
  final String id;
  final String gardenId;
  final int versionNumber;
  final List<VeggieRow> positioning;

  GardenPlan(
      this.gardenId,
      this.versionNumber,
      this.positioning,
      {String id})
      : this.id = id;

  GardenPlan copyWith({
    String id,
    String gardenId,
    int versionNumber,
  }) {
    return GardenPlan(
        gardenId ?? this.gardenId,
        versionNumber ?? this.versionNumber,
        positioning ?? this.positioning,
        id: id ?? this.id
    );
  }


  @override
  int get hashCode =>
      id.hashCode ^ versionNumber.hashCode ^ gardenId.hashCode;


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is GardenPlan &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              gardenId == other.gardenId &&
              versionNumber == other.versionNumber;

  GardenPlanEntity toEntity() {
    return GardenPlanEntity(
        id,
        gardenId,
        versionNumber,
        positioning
    );
  }

  static GardenPlan fromEntity(GardenPlanEntity entity) {

    return GardenPlan(
      entity.gardenId,
      entity.versionNumber,
      entity.positioning,
      id: entity.id,
    );
  }

  @override
  String toString() {
    return "GardenPlan {gardenId: $gardenId, versionNumber: $versionNumber}";
  }
}


class VeggieRow extends Equatable {

  final String name;
  final double positionRow;
  final double spaceRow;

  VeggieRow.fromMap(Map<dynamic, dynamic> data)
      : name = data['name'],
        positionRow = data['positionRow'],
        spaceRow = data['spaceRow'];

  Map<String, Object> toJson() {
    return {
      'name': name,
      'positionRow': positionRow,
      'spaceRow': spaceRow
    };
  }

  @override
  String toString() {
    return name;
  }

}
