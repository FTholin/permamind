import 'package:data_repository/src/entities/entities.dart';
import 'package:equatable/equatable.dart';

class DesignParcel extends Equatable {
  final String id;
  final String parcelId;
  final String gardenId;
  final List<Design> designs;

  DesignParcel(
      this.gardenId,
      this.parcelId,
      this.designs,
      {String id})
      : this.id = id;

  DesignParcel copyWith({
    String id,
    String gardenId,
    String parcelId,
    List<Design> designs
  }) {
    return DesignParcel(
        gardenId ?? this.gardenId,
        parcelId ?? this.parcelId,
        designs ?? this.designs,
        id: id ?? this.id
    );
  }


  @override
  int get hashCode =>
      id.hashCode  ^ gardenId.hashCode ^ parcelId.hashCode ^ designs.hashCode;


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DesignParcel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              gardenId == other.gardenId &&
              parcelId == other.parcelId &&
              designs == other.designs;

  DesignParcelEntity toEntity() {
    return DesignParcelEntity(
        id,
        gardenId,
        parcelId,
        designs
    );
  }

  static DesignParcel fromEntity(DesignParcelEntity entity) {

    return DesignParcel(
      entity.gardenId,
      entity.parcelId,
      entity.designs,
      id: entity.id,
    );
  }

  @override
  String toString() {
    return "DesignParcel {parcelId: $parcelId}";
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
