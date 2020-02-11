import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

class TutorialEntity extends Equatable {

  final String id;
  final String tutorialHeading;
  final String activityHeading;
  final int tutorialClassificationOrder;
  final int activityClassificationOrder;
  final List<TutorialActivity> tutorialActivities;
  final String background;

  TutorialEntity(
      this.id,
      this.tutorialHeading,
      this.activityHeading,
      this.tutorialClassificationOrder,
      this.activityClassificationOrder,
      this.tutorialActivities,
      this.background);

  Map<String, Object> toJson() {
    return {
      'id': id,
      'tutorialHeading': tutorialHeading,
      'activityHeading': activityHeading,
      'tutorialClassificationOrder': tutorialClassificationOrder,
      'activityClassificationOrder': activityClassificationOrder,
      'tutorialActivities': tutorialActivities
    };
  }

  @override
  String toString() {
    return 'Tutorial { id: $id, tutorialHeading: $tutorialHeading}';
  }

  static TutorialEntity fromJson(Map<String, Object> json) {
    return TutorialEntity(
      json['id'] as String,
      json['tutorialHeading'] as String,
      json['activityHeading'] as String,
      json['tutorialClassificationOrder'] as int,
      json['activityClassificationOrder'] as int,
      json['tutorialActivities'] as List<TutorialActivity>,
      json['background'] as String
    );
  }

  static TutorialEntity fromSnapshot(DocumentSnapshot snap) {

    return TutorialEntity(
      snap.documentID,
      snap.data['tutorialHeading'],
      snap.data['activityHeading'],
      snap.data['tutorialClassificationOrder'],
      snap.data['activityClassificationOrder'],

        snap.data['tutorialActivities'].map<TutorialActivity>((item) {
        return TutorialActivity.fromMap(item);
      }).toList(),
      snap.data['background']
    );
  }

  Map<String, Object> toDocument() {
    return {
      'id': id,
      'tutorialHeading': tutorialHeading,
      'activityHeading': activityHeading,
      'tutorialClassificationOrder': tutorialClassificationOrder,
      'activityClassificationOrder': activityClassificationOrder,
      'tutorialActivities': tutorialActivities,
      'background': background
    };
  }
}