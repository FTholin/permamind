import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ModelingEntity extends Equatable {
  final String modelingId;
  final String modelingName;
  final int modelingAverageDuration;

  ModelingEntity(this.modelingId, this.modelingName,
      this.modelingAverageDuration);

  Map<String, Object> toJson() {
    return {
      'modelingId': modelingId,
      'modelingName': modelingName,
      'modelingAverageDuration': modelingAverageDuration,
    };
  }

  @override
  String toString() {
    return 'ModelingEntity { modelingId: $modelingId, modelingName: $modelingName, modelingAverageDuration: $modelingAverageDuration}';
  }

  static ModelingEntity fromJson(Map<String, Object> json) {
    return ModelingEntity(
      json['modelingId'] as String,
      json['modelingName'] as String,
      json['modelingAverageDuration'] as int,
    );
  }

  static ModelingEntity fromSnapshot(DocumentSnapshot snap) {
    return ModelingEntity(
      snap.documentID,
      snap.data['modelingName'],
      snap.data['modelingAverageDuration'],

    );
  }

  Map<String, Object> toDocument() {
    return {
      'modelingId': modelingId,
      'modelingName': modelingName,
      'modelingAverageDuration': modelingAverageDuration,
    };
  }
}