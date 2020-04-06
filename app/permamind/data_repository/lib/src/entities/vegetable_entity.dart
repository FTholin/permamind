import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

class VegetableEntity extends Equatable {
  final String id;
  final String name;
  final DateTime seasonPeriodStartDate;
  final DateTime seasonPeriodEndDate;

  VegetableEntity(
      this.id,
      this.name,
      this.seasonPeriodStartDate,
      this.seasonPeriodEndDate
      );

  Map<String, Object> toJson() {
    return {
      'id': id,
      'name': name,
      'seasonPeriodStartDate': seasonPeriodStartDate,
      'seasonPeriodEndDate': seasonPeriodEndDate
    };
  }

  @override
  String toString() {
    return 'VegetableEntity { id: $id, name: $name}';
  }

  static VegetableEntity fromJson(Map<String, Object> json) {
    return VegetableEntity(
        json['id'] as String,
        json['name'] as String,
        json['seasonPeriodStartDate'],
        json['seasonPeriodEndDate'],

    );
  }

  static VegetableEntity fromSnapshot(DocumentSnapshot snap) {
    return VegetableEntity(
      snap.documentID,
      snap.data['name'],
      DateTime.fromMillisecondsSinceEpoch(
          snap.data["seasonPeriodStartDate"].millisecondsSinceEpoch),
      DateTime.fromMillisecondsSinceEpoch(
          snap.data["seasonPeriodEndDate"].millisecondsSinceEpoch),

    );
  }

  Map<String, Object> toDocument() {
    return {
      'id': id,
      'name': name,
      'seasonPeriodStartDate': seasonPeriodStartDate,
      'seasonPeriodEndDate': seasonPeriodEndDate
    };
  }
}