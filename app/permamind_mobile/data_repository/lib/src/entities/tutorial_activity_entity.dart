import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
class TutorialActivityEntity extends Equatable {
  final String id;
  final String heading;
  final String content;

  TutorialActivityEntity(this.id, this.heading, this.content);

  Map<String, Object> toJson() {
    return {
      'id': id,
      'heading': heading,
      'content': content
    };
  }

  @override
  String toString() {
    return 'Tutorial { id: $id, heading: $heading}';
  }

  static TutorialActivityEntity fromJson(Map<String, Object> json) {
    return TutorialActivityEntity(
        json['id'] as String,
        json['activityHeading'] as String,
        json['content'] as String
    );
  }

  static TutorialActivityEntity fromSnapshot(DocumentSnapshot snap) {
    return TutorialActivityEntity(
        snap.documentID,
        snap.data['activityHeading'],
        snap.data['activityContent']
    );
  }

  Map<String, Object> toDocument() {
    return {
      'id': id,
      'heading': heading,
      'content': content
    };
  }
}