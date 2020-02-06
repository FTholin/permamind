import 'package:data_repository/data_repository.dart';
import 'package:data_repository/src/entities/entities.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
class Tutorial extends Equatable {
  
  final String id;
  final String tutorialHeading;
  final String activityHeading;
  final int tutorialClassificationOrder;
  final int activityClassificationOrder;
  final String activityContent;

  Tutorial(this.tutorialHeading,
      this.activityHeading,
      this.tutorialClassificationOrder,
      this.activityClassificationOrder,
      this.activityContent,
      {String id})
      : this.id = id;

  Tutorial copyWith({String id, String tutorialHeading,
  }) {
    return Tutorial(
        tutorialHeading ?? this.tutorialHeading,
        activityHeading ?? this.activityHeading,
        tutorialClassificationOrder ?? this.tutorialClassificationOrder,
        activityClassificationOrder ?? this.activityClassificationOrder,
        activityContent ?? this.activityContent,
        id: id ?? this.id
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^ tutorialHeading.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Tutorial &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              tutorialHeading == other.tutorialHeading &&
              activityHeading == other.activityHeading;

  @override
  String toString() {
    return 'Tutorial { id: $id, tutorialHeading: $tutorialHeading}';
  }

//  TutorialEntity toEntity() {
//    return TutorialEntity(id, tutorialHeading, activities);
//  }

  static Tutorial fromEntity(TutorialEntity entity) {
    return Tutorial(
      entity.tutorialHeading,
      entity.activityHeading,
      entity.tutorialClassificationOrder,
      entity.activityClassificationOrder,
      entity.activityContent,
      id: entity.id,
    );
  }
}

