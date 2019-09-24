import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class GardenEntity extends Equatable {
  final String gardenId;
  final String gardenName;
  final bool publicVisibility;
  final List<dynamic> gardenOwners;

  GardenEntity(this.gardenId, this.gardenName, this.publicVisibility, this.gardenOwners);

  Map<String, Object> toJson() {
    return {
      'gardenName': gardenName,
      'publicVisibility': publicVisibility,
      'gardenOwners': gardenOwners,
      'gardenId': gardenId,
    };
  }

  @override
  String toString() {
    return 'GardenEntity { gardenId: $gardenId, gardenName: $gardenName, publicVisibility: $publicVisibility, gardenOwners: $gardenOwners }';
  }

  static GardenEntity fromJson(Map<String, Object> json) {
    return GardenEntity(
      json['gardenId'] as String,
      json['gardenName'] as String,
      json['publicVisibility'] as bool,
      json['gardenOwners']
    );
  }

  static GardenEntity fromSnapshot(DocumentSnapshot snap) {
    return GardenEntity(
      snap.documentID,
      snap.data['gardenName'],
      snap.data['publicVisibility'],
      snap.data['gardenOwners'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'gardenId': gardenId,
      'gardenName': gardenName,
      'publicVisibility': publicVisibility,
      'gardenOwners': gardenOwners
    };
  }
}