import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class GardenEntity extends Equatable {
  final String gardenId;
  final String gardenName;
  final bool publicVisibility;
  final List<String> gardenMembers;

  GardenEntity(this.gardenId, this.gardenName, this.publicVisibility, this.gardenMembers);

  Map<String, Object> toJson() {
    return {
      'gardenId': gardenId,
      'gardenName': gardenName,
      'publicVisibility': publicVisibility,
      'gardenMembers': gardenMembers,
    };
  }

  @override
  String toString() {
    return 'GardenEntity { gardenId: $gardenId, gardenName: $gardenName, publicVisibility: $publicVisibility, gardenMembers: $gardenMembers }';
  }

  static GardenEntity fromJson(Map<String, Object> json) {
    return GardenEntity(
      json['gardenId'] as String,
      json['gardenName'] as String,
      json['publicVisibility'] as bool,
      json['gardenMembers']
    );
  }

  static GardenEntity fromSnapshot(DocumentSnapshot snap) {

    List<String> gardenList = new List<String>.from(snap.data['gardenMembers']);

    return GardenEntity(
      snap.documentID,
      snap.data['gardenName'],
      snap.data['publicVisibility'],
      gardenList
    );
  }

  Map<String, Object> toDocument() {
    return {
      'gardenId': gardenId,
      'gardenName': gardenName,
      'publicVisibility': publicVisibility,
      'gardenMembers': gardenMembers
    };
  }
}