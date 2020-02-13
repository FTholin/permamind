import 'package:data_repository/src/entities/entities.dart';
import 'package:equatable/equatable.dart';

class GardenPlan extends Equatable {
  final String id;
  final String gardenId;
  final int version;
  final List<VeggieRow> positioning;

  GardenPlan(
      this.gardenId,
      this.version,
      this.positioning,
      {String id})
      : this.id = id;

  GardenPlan copyWith({
    String id,
    String gardenId,
    int startDayIndex,
  }) {
    return GardenPlan(
        gardenId ?? this.gardenId,
        startDayIndex ?? this.version,
        positioning ?? this.positioning,
        id: id ?? this.id
    );
  }


  @override
  int get hashCode =>
      id.hashCode ^ version.hashCode ^ gardenId.hashCode;


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is GardenPlan &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              gardenId == other.gardenId &&
              version == other.version;

  GardenPlanEntity toEntity() {
    return GardenPlanEntity(
        id,
        gardenId,
        version,
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
    return "GardenPlan {gardenId: $gardenId}";
  }
}


class VeggieRow extends Equatable {

  final String name;
  final double xPosition;
  final double yPosition;
  final double length;
  final double space;

  VeggieRow.fromMap(Map<dynamic, dynamic> data)
      : name = data['name'],
        xPosition = data['xPosition'].toDouble(),
        yPosition = data['yPosition'].toDouble(),
        length = data['length'].toDouble(),
        space = data['space'].toDouble();

  Map<String, Object> toJson() {
    return {
      'name': name,
      'xPosition': xPosition,
      'yPosition': yPosition,
      'length': length,
      'space': space
    };
  }

  @override
  String toString() {
    return name;
  }

}


class Design extends Equatable {

  final int startDayIndex;
  final int endDayIndex;
  final List<VeggieRow> positioning;

  Design.fromMap(Map<dynamic, dynamic> data)
      : startDayIndex = data['startDayIndex'],
        endDayIndex = data['endDayIndex'],
        positioning = data['positioning'].map<VeggieRow>((item) {
          return VeggieRow.fromMap(item);
        }).toList();


  Map<String, Object> toJson() {
    return {
      'startDayIndex': startDayIndex,
      'endDayIndex': endDayIndex,
      'positioning': positioning
    };
  }

  }
