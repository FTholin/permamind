import 'package:data_repository/data_repository.dart';
import 'package:data_repository/src/entities/entities.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
class Tutorial extends Equatable {
  
  final String tutorialId;
  final String tutorialName;


  Tutorial(this.tutorialName, {String tutorialId})
      : this.tutorialId = tutorialId;

  Tutorial copyWith({String tutorialId, String tutorialName,
  }) {
    return Tutorial(
        tutorialName ?? this.tutorialName,
        tutorialId: tutorialId ?? this.tutorialId
    );
  }

  @override
  int get hashCode =>
      tutorialId.hashCode ^ tutorialName.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Tutorial &&
              runtimeType == other.runtimeType &&
              tutorialId == other.tutorialId &&
              tutorialName == other.tutorialName;

  @override
  String toString() {
    return 'Tutorial { tutorialId: $tutorialId, tutorialName: $tutorialName}';
  }

//  TutorialEntity toEntity() {
//    return TutorialEntity(tutorialId, tutorialName, activities);
//  }

  static Tutorial fromEntity(TutorialEntity entity) {
    return Tutorial(
      entity.tutorialName,
      tutorialId: entity.tutorialId,
    );
  }
}

