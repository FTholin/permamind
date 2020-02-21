import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

class DesignParcelEntity extends Equatable {

  final String id;
  final String gardenId;
  final String parcelId;
  final List<Design> designs;

  DesignParcelEntity(
      this.id,
      this.gardenId,
      this.parcelId,
      this.designs
      );

  Map<String, Object> toJson() {
    return {
      'id': id,
      'gardenId': gardenId,
      'parcelId': parcelId,
      'designs': designs.map((item) {
        return item.toJson();
      }).toList(),
    };
  }

  @override
  String toString() {
    return 'DesignParcelEntity { id: $id, parcelId: $parcelId }';
  }

  static DesignParcelEntity fromJson(Map<String, Object> json) {
    return DesignParcelEntity(
        json['id'] as String,
        json['gardenId'] as String,
        json['parcelId'] as String,
        json['positioning'] as List<Design>,
    );
  }

  static DesignParcelEntity fromSnapshot(DocumentSnapshot snap) {

    return DesignParcelEntity(
        snap.documentID,
        snap.data['gardenId'],
        snap.data['parcelId'],
        snap.data['designs'].map<Design>((item) {
          return Design.fromMap(item);
        }).toList(),
    );
  }

  Map<String, Object> toDocument() {
    return {
      'gardenId': gardenId,
      'parcelId': parcelId,
      'designs': designs.map((item) {
        return item.toJson();
      }).toList(),
    };
  }
}