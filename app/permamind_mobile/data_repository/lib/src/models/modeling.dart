import 'package:meta/meta.dart';
import 'package:data_repository/src/entities/entities.dart';

@immutable
class Modeling {
  final String modelingId;
  final String modelingName;
  final String modelingProductionDuration;
  final int modelingDifficultyLevel;
  final int modelingSunlightRequirement;
  final int modelingWaterRequirement;
  final int modelingYield;

  Modeling(this.modelingName, this.modelingProductionDuration,
      this.modelingDifficultyLevel, this.modelingSunlightRequirement,
      this.modelingWaterRequirement,
      this.modelingYield, {String modelingId})
      : this.modelingId = modelingId;

  Modeling copyWith({String modelingId, String modelingName,
    String modelingProductionDuration,
    int modelingSunlightRequirement, int modelingWaterRequirement,
    int modelingYield
  }) {
    return Modeling(
      modelingName ?? this.modelingName,
      modelingProductionDuration ?? this.modelingProductionDuration,
      modelingDifficultyLevel ?? this.modelingDifficultyLevel,
      modelingSunlightRequirement ?? this.modelingSunlightRequirement,
      modelingWaterRequirement ?? this.modelingWaterRequirement,
      modelingYield ?? this.modelingYield,
      modelingId: modelingId ?? this.modelingId
    );
  }

  @override
  int get hashCode =>
      modelingId.hashCode ^ modelingName.hashCode ^
      modelingProductionDuration.hashCode ^ modelingDifficultyLevel.hashCode ^
      modelingSunlightRequirement.hashCode ^
      modelingWaterRequirement.hashCode ^ modelingYield.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Modeling &&
              runtimeType == other.runtimeType &&
              modelingId == other.modelingId &&
              modelingName == other.modelingName &&
              modelingSunlightRequirement == other.modelingSunlightRequirement &&
              modelingWaterRequirement == other.modelingWaterRequirement &&
              modelingYield == other.modelingYield &&
              modelingProductionDuration == other.modelingProductionDuration &&
              modelingDifficultyLevel == other.modelingDifficultyLevel;

  @override
  String toString() {
    return 'Modeling { modelingId: $modelingId, modelingName: $modelingName,'
        ' modelingProductionDuration: $modelingProductionDuration'
        ' modelingDifficultyLevel: $modelingDifficultyLevel'
        ' modelingSunlightRequirement: $modelingSunlightRequirement'
        ' modelingWaterRequirement: $modelingWaterRequirement '
        ' modelingYield: $modelingYield}';
  }

  ModelingEntity toEntity() {
    return ModelingEntity(modelingId, modelingName, modelingProductionDuration,
        modelingDifficultyLevel, modelingSunlightRequirement,
        modelingWaterRequirement, modelingYield);
  }

  static Modeling fromEntity(ModelingEntity entity) {
    return Modeling(
      entity.modelingName,
      entity.modelingProductionDuration,
      entity.modelingDifficultyLevel,
      entity.modelingSunlightRequirement,
      entity.modelingWaterRequirement,
      entity.modelingYield,
      modelingId: entity.modelingId,
    );
  }
}