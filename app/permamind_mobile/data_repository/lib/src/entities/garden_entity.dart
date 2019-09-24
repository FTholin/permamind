import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class GardenEntity extends Equatable {
  final String gardenId;
  final String gardenName;
  final bool gardenPublicVisibility;
  final List<String> gardenOwners;

  GardenEntity(this.gardenId, this.gardenName, this.gardenPublicVisibility, this.gardenOwners);

  Map<String, Object> toJson() {
    return {
      'gardenName': gardenName,
      'gardenPublicVisibility': gardenPublicVisibility,
      'gardenOwners': gardenOwners,
      'gardenId': gardenId,
    };
  }

  @override
  String toString() {
    return 'GardenEntity { gardenId: $gardenId, gardenName: $gardenName, gardenPublicVisibility: $gardenPublicVisibility, gardenOwners: $gardenOwners }';
  }

  static GardenEntity fromJson(Map<String, Object> json) {
    return GardenEntity(
      json['gardenId'] as String,
      json['gardenName'] as String,
      json['gardenPublicVisibility'] as bool,
      json['gardenOwners'] as List<String>
    );
  }

  static GardenEntity fromSnapshot(DocumentSnapshot snap) {
    return GardenEntity(
      snap.documentID,
      snap.data['gardenName'],
      snap.data['gardenPublicVisibility'],
      snap.data['gardenOwners'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'gardenId': gardenId,
      'gardenName': gardenName,
      'gardenPublicVisibility': gardenPublicVisibility,
      'gardenOwners': gardenOwners
    };
  }
}