import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

class VegetableEntity extends Equatable {
  final String id;
  final String imageName;
  final DateTime seasonPeriodStartDate;
  final DateTime seasonPeriodEndDate;
  final String nameFr;
  final String nameEn;
  final bool isAvailable;

  VegetableEntity(
      this.id,
      this.nameFr,
      this.nameEn,
      this.imageName,
      this.seasonPeriodStartDate,
      this.seasonPeriodEndDate,
      this.isAvailable
      );

  Map<String, Object> toJson() {
    return {
      'id': id,
      'nameFr': nameFr,
      'nameEn': nameEn,
      'imageName': imageName,
      'seasonPeriodStartDate': seasonPeriodStartDate,
      'seasonPeriodEndDate': seasonPeriodEndDate,
      'isAvailable': isAvailable
    };
  }

  @override
  String toString() {
    return 'VegetableEntity { id: $id, imageName: $imageName}';
  }

  static VegetableEntity fromJson(Map<String, Object> json) {
    return VegetableEntity(
        json['id'] as String,
        json['nameFr'] as String,
        json['nameEn'] as String,
        json['imageName'] as String,
        json['seasonPeriodStartDate'],
        json['seasonPeriodEndDate'],
        json['isAvailable']
    );
  }

  static VegetableEntity fromSnapshot(DocumentSnapshot snap) {
    return VegetableEntity(
      snap.documentID,
      snap.data['nameFr'],
      snap.data['nameEn'],
      snap.data['imageName'],
      DateTime.fromMillisecondsSinceEpoch(
          snap.data["seasonPeriodStartDate"].millisecondsSinceEpoch),
      DateTime.fromMillisecondsSinceEpoch(
          snap.data["seasonPeriodEndDate"].millisecondsSinceEpoch),
      snap.data['isAvailable']

    );
  }

  Map<String, Object> toDocument() {
    return {
      'id': id,
      'nameFr': nameFr,
      'nameEn': nameEn,
      'imageName': imageName,
      'seasonPeriodStartDate': seasonPeriodStartDate,
      'seasonPeriodEndDate': seasonPeriodEndDate,
      'isAvailable': isAvailable
    };
  }
}