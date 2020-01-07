import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';
import 'package:data_repository/src/entities/entities.dart';
import 'package:equatable/equatable.dart';

class TutorialEntity extends Equatable {
  final String id;
  final String heading;

  TutorialEntity(this.id, this.heading);

  Map<String, Object> toJson() {
    return {
      'id': id,
      'heading': heading,
    };
  }

  @override
  String toString() {
    return 'Tutorial { id: $id, heading: $heading}';
  }

  static TutorialEntity fromJson(Map<String, Object> json) {
    return TutorialEntity(
      json['id'] as String,
      json['tutorialHeading'] as String,
    );
  }

  static TutorialEntity fromSnapshot(DocumentSnapshot snap) {
    return TutorialEntity(
      snap.documentID,
      snap.data['tutorialHeading']
    );
  }

  Map<String, Object> toDocument() {
    return {
      'id': id,
      'heading': heading,
    };
  }
}