import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ModellingEntity extends Equatable {
  final String modellingId;
  final String modellingName;
  final int modellingAverageDuration;

  ModellingEntity(this.modellingId, this.modellingName,
      this.modellingAverageDuration);

  Map<String, Object> toJson() {
    return {
      'modellingId': modellingId,
      'modellingName': modellingName,
      'modellingAverageDuration': modellingAverageDuration,
    };
  }

  @override
  String toString() {
    return 'ModellingEntity { modellingId: $modellingId, modellingName: $modellingName, modellingAverageDuration: $modellingAverageDuration}';
  }

  static ModellingEntity fromJson(Map<String, Object> json) {
    return ModellingEntity(
      json['modellingId'] as String,
      json['modellingName'] as String,
      json['modellingAverageDuration'] as int,
    );
  }

  static ModellingEntity fromSnapshot(DocumentSnapshot snap) {
    return ModellingEntity(
      snap.documentID,
      snap.data['modellingName'],
      snap.data['modellingAverageDuration'],

    );
  }

  Map<String, Object> toDocument() {
    return {
      'modellingId': modellingId,
      'modellingName': modellingName,
      'modellingAverageDuration': modellingAverageDuration,
    };
  }
}