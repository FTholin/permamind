import 'package:data_repository/data_repository.dart';
import 'package:data_repository/src/entities/entities.dart';
import 'package:intl/intl.dart';

class Modeling {
  final String id;
  final String name;
  final String productionDuration;
  final int difficultyLevel;
  final int sunlightRequirement;
  final int waterRequirement;
  final int yield;
  List<ModelingSchedule> schedule = new List<ModelingSchedule>();
  final List<int> sowingPeriod;
  final List<int> harvestPeriod;
  final String descriptionFr;

  List<String> composition = new List<String>();

  List<Design> designs = new List<Design>();


  Modeling(
      this.name,
      this.productionDuration,
      this.difficultyLevel,
      this.sunlightRequirement,
      this.waterRequirement,
      this.yield,
      this.schedule,
      this.composition,
      this.sowingPeriod,
      this.harvestPeriod,
      this.designs,
      this.descriptionFr,
      {String id})
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
      sowingPeriod ?? this.sowingPeriod,
      harvestPeriod ?? this.harvestPeriod,
      designs ?? this.designs,
        descriptionFr ?? this.descriptionFr,
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
              difficultyLevel == other.difficultyLevel &&
              sowingPeriod == other.sowingPeriod &&
              harvestPeriod == other.harvestPeriod &&
              designs == other.designs &&
              descriptionFr == other.descriptionFr;

  @override
  String toString() {
    return 'Modeling { id: $id, name: $name,}';
  }

  ModelingEntity toEntity() {
    return ModelingEntity(
        id, name, productionDuration,
        difficultyLevel, sunlightRequirement,
        waterRequirement, yield,
        schedule,
        composition,
        sowingPeriod,
        harvestPeriod,
        designs,
        descriptionFr
    );
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
      entity.sowingPeriod,
      entity.harvestPeriod,
      entity.designs,
      entity.descriptionFr,
      id: entity.id,
    );
  }
}


//class ModelingComposition {
//
//  String vegetableId;
//  String nameFr;
//  String nameEn;
//  String imageName;
//
//  ModelingComposition(this.vegetableId, this.nameFr, this.nameEn, this.imageName);
//
//  ModelingComposition.fromMap(Map<dynamic, dynamic> data)
//      : vegetableId = data['vegetableId'],
//        nameFr = data['nameFr'],
//        nameEn = data['nameEn'],
//        imageName = data['imageName'];
//
//  Map<String, Object> toJson() {
//    return {
//      'vegetableId': vegetableId,
//      'nameFr': nameFr,
//      'nameEn': nameEn,
//      'imageName': imageName
//    };
//  }
//
//  @override
//  String toString() {
//    return nameFr;
//  }
//}