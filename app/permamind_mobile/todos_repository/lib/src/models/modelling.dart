import 'package:meta/meta.dart';
import 'package:todos_repository/src/entities/entities.dart';

@immutable
class Modelling {
  final String modellingId;
  final String modellingName;
  final int modellingAverageDuration;

  Modelling(this.modellingName, this.modellingAverageDuration, {String modellingId})
      : this.modellingId = modellingId;

  Modelling copyWith({String modellingId, String modellingName, double modellingAverageDuration}) {
    return Modelling(
      modellingName ?? this.modellingName,
      modellingAverageDuration ?? this.modellingAverageDuration,
      modellingId: modellingId ?? this.modellingId
    );
  }

  @override
  int get hashCode =>
      modellingId.hashCode ^ modellingName.hashCode ^ modellingAverageDuration.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Modelling &&
              runtimeType == other.runtimeType &&
              modellingId == other.modellingId &&
              modellingName == other.modellingName &&
              modellingAverageDuration == other.modellingAverageDuration;

  @override
  String toString() {
    return 'Modelling { modellingId: $modellingId, modellingName: $modellingName, modellingAverageDuration: $modellingAverageDuration }';
  }

  ModellingEntity toEntity() {
    return ModellingEntity(modellingId, modellingName, modellingAverageDuration);
  }

  static Modelling fromEntity(ModellingEntity entity) {
    return Modelling(
      entity.modellingName,
      entity.modellingAverageDuration,
      modellingId: entity.modellingId,
    );
  }
}