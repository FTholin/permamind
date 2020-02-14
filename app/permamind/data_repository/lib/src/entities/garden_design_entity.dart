import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

class GardenDesignEntity extends Equatable {

  final String id;
  final String gardenId;
  final List<Design> designs;

  GardenDesignEntity(
      this.id,
      this.gardenId,
      this.designs
      );

  Map<String, Object> toJson() {
    return {
      'id': id,
      'gardenId': gardenId,
      'designs': designs.map((item) {
        return item.toJson();
      }).toList(),
    };
  }

  @override
  String toString() {
    return 'GardenDesignEntity { id: $id, gardenId: $gardenId }';
  }

  static GardenDesignEntity fromJson(Map<String, Object> json) {
    return GardenDesignEntity(
        json['id'] as String,
        json['gardenId'] as String,
        json['positioning'] as List<Design>,
    );
  }

  static GardenDesignEntity fromSnapshot(DocumentSnapshot snap) {

    return GardenDesignEntity(
        snap.documentID,
        snap.data['gardenId'],
        snap.data['designs'].map<Design>((item) {
          return Design.fromMap(item);
        }).toList(),
    );
  }

  Map<String, Object> toDocument() {
    return {
      'gardenId': gardenId,
      'designs': designs.map((item) {
        return item.toJson();
      }).toList(),
    };
  }
}