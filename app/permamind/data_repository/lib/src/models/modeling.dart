import 'package:data_repository/data_repository.dart';
import 'package:data_repository/src/entities/entities.dart';

class Modeling {
  final String id;
  final String name;
  final String productionDuration;
  final int difficultyLevel;
  final int sunlightRequirement;
  final int waterRequirement;
  final int yield;

  List<PlanningDay> schedule = new List<PlanningDay>();
  final List<String> composition;

  Modeling(this.name, this.productionDuration,
      this.difficultyLevel, this.sunlightRequirement,
      this.waterRequirement,
      this.yield, this.schedule, this.composition, {String id})
      : this.id = id;

  Modeling copyWith({String id, String name,
    String productionDuration,
    int sunlightRequirement, int waterRequirement,
    int yield
  }) {
    return Modeling(
      name ?? this.name,
      productionDuration ?? this.productionDuration,
      difficultyLevel ?? this.difficultyLevel,
      sunlightRequirement ?? this.sunlightRequirement,
      waterRequirement ?? this.waterRequirement,
      yield ?? this.yield,
      schedule ?? this.schedule,
      composition ?? this.composition,
      id: id ?? this.id
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^
      productionDuration.hashCode ^ difficultyLevel.hashCode ^
      sunlightRequirement.hashCode ^
      waterRequirement.hashCode ^ yield.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Modeling &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              sunlightRequirement == other.sunlightRequirement &&
              waterRequirement == other.waterRequirement &&
              yield == other.yield &&
              productionDuration == other.productionDuration &&
              difficultyLevel == other.difficultyLevel;

  @override
  String toString() {
    return 'Modeling { id: $id, name: $name,}';
  }

  ModelingEntity toEntity() {
    return ModelingEntity(id, name, productionDuration,
        difficultyLevel, sunlightRequirement,
        waterRequirement, yield, schedule, composition);
  }

  static Modeling fromEntity(ModelingEntity entity) {
    return Modeling(
      entity.name,
      entity.productionDuration,
      entity.difficultyLevel,
      entity.sunlightRequirement,
      entity.waterRequirement,
      entity.yield,
      entity.schedule,
      entity.composition,
      id: entity.id,
    );
  }
}