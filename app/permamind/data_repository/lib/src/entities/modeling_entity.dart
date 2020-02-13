import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

class ModelingEntity extends Equatable {
  final String id;
  final String name;
  final String productionDuration;
  final int difficultyLevel;
  final int sunlightRequirement;
  final int waterRequirement;
  final int yield;
  List<ModelingSchedule> schedule = new List<ModelingSchedule>();
  final List<String> composition;
  final List<int> culturePeriod;
  final List<int> sowingPeriod;
  final List<int> harvestPeriod;
  List<Design> designs = new List<Design>();


  ModelingEntity(this.id, this.name,
      this.productionDuration, this.difficultyLevel,
      this.sunlightRequirement,
      this.waterRequirement, this.yield,
      this.schedule,
      this.composition,
      this.culturePeriod,
      this.sowingPeriod,
      this.harvestPeriod,
      this.designs
      );

  Map<String, Object> toJson() {
    return {
      'id': id,
      'name': name,
      'productionDuration': productionDuration,
      'difficultyLevel': difficultyLevel,
      'sunlightRequirement': sunlightRequirement,
      'waterRequirement': waterRequirement,
      'yield': yield,
      'designs': designs
    };
  }

  @override
  String toString() {
    return 'Modeling { id: $id, name: $name,'
        ' productionDuration: $productionDuration'
        ' difficultyLevel: $difficultyLevel'
        ' sunlightRequirement: $sunlightRequirement'
        ' waterRequirement: $waterRequirement '
        ' yield: $yield}';
  }

  static ModelingEntity fromJson(Map<String, Object> json) {
    return ModelingEntity(
      json['id'] as String,
      json['name'] as String,
      json['productionDuration'] as String,
      json['difficultyLevel'] as int,
      json['sunlightRequirement'] as int,
      json['waterRequirement'] as int,
      json['yield'] as int,
      json['schedule'],
      json['composition'],
      json['culturePeriod'],
      json['sowingPeriod'],
      json['harvestPeriod'],
      json['designs']
    );
  }

  static ModelingEntity fromSnapshot(DocumentSnapshot snap) {

    List<String> compositionList = new List<String>.from(snap.data['composition']);
    return ModelingEntity(
      snap.documentID,
      snap.data['name'],
      snap.data['productionDuration'],
      snap.data['difficultyLevel'],
      snap.data['sunlightRequirement'],
      snap.data['waterRequirement'],
      snap.data['yield'],
      snap.data['schedule'].map<ModelingSchedule>((item) {
          return ModelingSchedule.fromMap(item);
        }).toList(),
      compositionList,
      new List<int>.from(snap.data['culturePeriod']),
      new List<int>.from(snap.data['sowingPeriod']),
      new List<int>.from(snap.data['harvestPeriod']),
      snap.data['designs'].map<Design>((item) {
        return Design.fromMap(item);
      }).toList(),
    );
  }

  Map<String, Object> toDocument() {
    return {
      'id': id,
      'name': name,
      'productionDuration': productionDuration,
      'difficultyLevel': difficultyLevel,
      'sunlightRequirement': sunlightRequirement,
      'waterRequirement': waterRequirement,
      'yield': yield,
      'culturePeriod': culturePeriod,
      'sowingPeriod': sowingPeriod,
      'harvestPeriod': harvestPeriod
    };
  }
}