import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

class GardenPlanEntity extends Equatable {

  final String id;
  final String gardenId;
  final int versionNumber;
  final List<VeggieRow> positioning;

  GardenPlanEntity(
      this.id,
      this.gardenId,
      this.versionNumber,
      this.positioning
      );

  Map<String, Object> toJson() {
    return {
      'id': id,
      'gardenId': gardenId,
      'versionNumber': versionNumber,
      'positioning': positioning.map((item) {
        return item.toJson();
      }).toList(),
    };
  }

  @override
  String toString() {
    return 'GardenPlanEntity { id: $id, gardenId: $gardenId, versionNumber: $versionNumber, positioning: $positioning }';
  }

  static GardenPlanEntity fromJson(Map<String, Object> json) {
    return GardenPlanEntity(
        json['id'] as String,
        json['gardenId'] as String,
        json['versionNumber'] as int,
        json['positioning'] as List<VeggieRow>,
    );
  }

  static GardenPlanEntity fromSnapshot(DocumentSnapshot snap) {

    return GardenPlanEntity(
        snap.documentID,
        snap.data['gardenId'],
        snap.data['versionNumber'],
        snap.data['positioning'].map<VeggieRow>((item) {
          return VeggieRow.fromMap(item);
        }).toList(),
    );
  }

  Map<String, Object> toDocument() {
    return {
      'gardenId': gardenId,
      'versionNumber': versionNumber,
      'positioning': positioning.map((item) {
        return item.toJson();
      }).toList(),
    };
  }
}