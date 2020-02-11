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
  final List<TutorialActivity> tutorialActivities;

  Tutorial(this.tutorialHeading,
      this.activityHeading,
      this.tutorialClassificationOrder,
      this.activityClassificationOrder,
      this.tutorialActivities,
      {String id})
      : this.id = id;

  Tutorial copyWith({String id, String tutorialHeading,
  }) {
    return Tutorial(
        tutorialHeading ?? this.tutorialHeading,
        activityHeading ?? this.activityHeading,
        tutorialClassificationOrder ?? this.tutorialClassificationOrder,
        activityClassificationOrder ?? this.activityClassificationOrder,
        tutorialActivities ?? this.tutorialActivities,
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
      entity.tutorialActivities,
      id: entity.id,
    );
  }
}

class TutorialActivity {
  final String name;
  final bool content;
  final String type;

  TutorialActivity.fromMap(Map<dynamic, dynamic> data)
      : name = data['name'],
        content = data['content'],
        type = data['type'];

  Map<String, Object> toJson() {
    return {
      'name': name,
      'content': content,
      'type': type
    };
  }

  @override
  String toString() {
    return name;
  }
}