import 'package:data_repository/src/entities/entities.dart';
import 'package:equatable/equatable.dart';

class GardenDesign extends Equatable {
  final String id;
  final String gardenId;
  final List<Design> designs;

  GardenDesign(
      this.gardenId,
      this.designs,
      {String id})
      : this.id = id;

  GardenDesign copyWith({
    String id,
    String gardenId,
  }) {
    return GardenDesign(
        gardenId ?? this.gardenId,
        designs ?? this.designs,
        id: id ?? this.id
    );
  }


  @override
  int get hashCode =>
      id.hashCode  ^ gardenId.hashCode ^ designs.hashCode;


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is GardenDesign &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              gardenId == other.gardenId &&
              designs == other.designs;

  GardenDesignEntity toEntity() {
    return GardenDesignEntity(
        id,
        gardenId,
        designs
    );
  }

  static GardenDesign fromEntity(GardenDesignEntity entity) {

    return GardenDesign(
      entity.gardenId,
      entity.designs,
      id: entity.id,
    );
  }

  @override
  String toString() {
    return "GardenDesign {gardenId: $gardenId}";
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
      'positioning': positioning.map((item) {
        return item.toJson();
      }).toList(),
    };
  }

  }
