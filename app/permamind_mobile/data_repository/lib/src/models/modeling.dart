import 'package:meta/meta.dart';
import 'package:data_repository/src/entities/entities.dart';

@immutable
class Modeling {
  final String modelingId;
  final String modelingName;
  final int modelingAverageDuration;

  Modeling(this.modelingName, this.modelingAverageDuration, {String modelingId})
      : this.modelingId = modelingId;

  Modeling copyWith({String modelingId, String modelingName, double modelingAverageDuration}) {
    return Modeling(
      modelingName ?? this.modelingName,
      modelingAverageDuration ?? this.modelingAverageDuration,
      modelingId: modelingId ?? this.modelingId
    );
  }

  @override
  int get hashCode =>
      modelingId.hashCode ^ modelingName.hashCode ^ modelingAverageDuration.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Modeling &&
              runtimeType == other.runtimeType &&
              modelingId == other.modelingId &&
              modelingName == other.modelingName &&
              modelingAverageDuration == other.modelingAverageDuration;

  @override
  String toString() {
    return 'Modeling { modelingId: $modelingId, modelingName: $modelingName, modelingAverageDuration: $modelingAverageDuration }';
  }

  ModelingEntity toEntity() {
    return ModelingEntity(modelingId, modelingName, modelingAverageDuration);
  }

  static Modeling fromEntity(ModelingEntity entity) {
    return Modeling(
      entity.modelingName,
      entity.modelingAverageDuration,
      modelingId: entity.modelingId,
    );
  }
}