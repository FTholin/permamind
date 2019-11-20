import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

class GardenEntity extends Equatable {
  final String id;
  final String gardenName;
  final bool publicVisibility;
  final String modelisationId;
  final List<String> gardenMembers;
  List<PlanningDay> planning = new List<PlanningDay>();
  final DateTime creationDate;

  GardenEntity(this.id,
      this.gardenName,
      this.publicVisibility,
      this.gardenMembers,
      this.modelisationId,
      this.planning,
      this.creationDate);

  Map<String, Object> toJson() {
    return {
      'id': id,
      'gardenName': gardenName,
      'publicVisibility': publicVisibility,
      'gardenMembers': gardenMembers,
      'planning': planning.map((item) {
        return item.toJson();
      }).toList(),
      'creationDate': creationDate
    };
  }

  @override
  String toString() {
    return 'GardenEntity { id: $id, gardenName: $gardenName, publicVisibility: $publicVisibility, gardenMembers: $gardenMembers }';
  }

  static GardenEntity fromJson(Map<String, Object> json) {
    return GardenEntity(
      json['id'] as String,
      json['gardenName'] as String,
      json['publicVisibility'] as bool,
      json['gardenMembers'],
      json['modelisationId'] as String,
      json['planning'] as List<PlanningDay>,
      json['creationDate']
    );
  }

  static GardenEntity fromSnapshot(DocumentSnapshot snap) {

    List<String> gardenList = new List<String>.from(snap.data['gardenMembers']);

    return GardenEntity(
      snap.documentID,
      snap.data['gardenName'],
      snap.data['publicVisibility'],
      gardenList,
      snap.data['modelisationId'],
      snap.data['planning'].map<PlanningDay>((item) {
        return PlanningDay.fromMap(item);
      }).toList(),
        DateTime.fromMillisecondsSinceEpoch(
            snap.data["creationDate"].millisecondsSinceEpoch)
    );
  }

  Map<String, Object> toDocument() {
    return {
      'gardenName': gardenName,
      'publicVisibility': publicVisibility,
      'gardenMembers': gardenMembers,
      'modelisationId': modelisationId,
      'planning': planning.map((item) {
        return item.toJson();
      }).toList(),
      'creationDate': creationDate
    };
  }
}