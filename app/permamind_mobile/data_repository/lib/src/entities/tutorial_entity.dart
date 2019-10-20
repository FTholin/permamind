import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';
import 'package:data_repository/src/entities/entities.dart';
import 'package:equatable/equatable.dart';

class TutorialEntity extends Equatable {
  final String tutorialId;
  final String tutorialName;

  TutorialEntity(this.tutorialId, this.tutorialName);

  Map<String, Object> toJson() {
    return {
      'tutorialId': tutorialId,
      'tutorialName': tutorialName,
    };
  }

  @override
  String toString() {
    return 'Tutorial { tutorialId: $tutorialId, tutorialName: $tutorialName}';
  }

  static TutorialEntity fromJson(Map<String, Object> json) {
    return TutorialEntity(
      json['tutorialId'] as String,
      json['tutorialName'] as String,
    );
  }

  static TutorialEntity fromSnapshot(DocumentSnapshot snap) {
    return TutorialEntity(
      snap.documentID,
      snap.data['tutorialName']
    );
  }

  Map<String, Object> toDocument() {
    return {
      'tutorialId': tutorialId,
      'tutorialName': tutorialName,
    };
  }
}