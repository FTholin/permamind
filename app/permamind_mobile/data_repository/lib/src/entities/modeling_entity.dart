import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ModelingEntity extends Equatable {
  final String modelingId;
  final String modelingName;
  final String modelingProductionDuration;
  final int modelingDifficultyLevel;
  final int modelingSunlightRequirement;
  final int modelingWaterRequirement;
  final int modelingYield;

  ModelingEntity(this.modelingId, this.modelingName,
      this.modelingProductionDuration, this.modelingDifficultyLevel,
      this.modelingSunlightRequirement,
      this.modelingWaterRequirement, this.modelingYield);

  Map<String, Object> toJson() {
    return {
      'modelingId': modelingId,
      'modelingName': modelingName,
      'modelingProductionDuration': modelingProductionDuration,
      'modelingDifficultyLevel': modelingDifficultyLevel,
      'modelingSunlightRequirement': modelingSunlightRequirement,
      'modelingWaterRequirement': modelingWaterRequirement,
      'modelingYield': modelingYield
    };
  }

  @override
  String toString() {
    return 'Modeling { modelingId: $modelingId, modelingName: $modelingName,'
        ' modelingProductionDuration: $modelingProductionDuration'
        ' modelingDifficultyLevel: $modelingDifficultyLevel'
        ' modelingSunlightRequirement: $modelingSunlightRequirement'
        ' modelingWaterRequirement: $modelingWaterRequirement '
        ' modelingYield: $modelingYield}';
  }

  static ModelingEntity fromJson(Map<String, Object> json) {
    return ModelingEntity(
      json['modelingId'] as String,
      json['modelingName'] as String,
      json['modelingProductionDuration'] as String,
      json['modelingDifficultyLevel'] as int,
      json['modelingSunlightRequirement'] as int,
      json['modelingWaterRequirement'] as int,
      json['modelingYield'] as int,
    );
  }

  static ModelingEntity fromSnapshot(DocumentSnapshot snap) {
    return ModelingEntity(
      snap.documentID,
      snap.data['modelingName'],
      snap.data['modelingProductionDuration'],
      snap.data['modelingDifficultyLevel'],
      snap.data['modelingSunlightRequirement'],
      snap.data['modelingWaterRequirement'],
      snap.data['modelingYield'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'modelingId': modelingId,
      'modelingName': modelingName,
      'modelingProductionDuration': modelingProductionDuration,
      'modelingDifficultyLevel': modelingDifficultyLevel,
      'modelingSunlightRequirement': modelingSunlightRequirement,
      'modelingWaterRequirement': modelingWaterRequirement,
      'modelingYield': modelingYield
    };
  }
}