import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class GardenEntity extends Equatable {
  final String id;
  final String gardenName;
  final bool publicVisibility;
  final String modelisationId;
  final List<String> gardenMembers;

  GardenEntity(this.id, this.gardenName, this.publicVisibility, this.gardenMembers, this.modelisationId);

  Map<String, Object> toJson() {
    return {
      'id': id,
      'gardenName': gardenName,
      'publicVisibility': publicVisibility,
      'gardenMembers': gardenMembers,
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
    );
  }

  static GardenEntity fromSnapshot(DocumentSnapshot snap) {

    List<String> gardenList = new List<String>.from(snap.data['gardenMembers']);

    return GardenEntity(
      snap.documentID,
      snap.data['gardenName'],
      snap.data['publicVisibility'],
      gardenList,
      snap.data['modelisationId']
    );
  }

  Map<String, Object> toDocument() {
    return {
      'id': id,
      'gardenName': gardenName,
      'publicVisibility': publicVisibility,
      'gardenMembers': gardenMembers,
      'modelisationId': modelisationId
    };
  }
}