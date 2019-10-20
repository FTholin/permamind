import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
class TutorialActivityEntity extends Equatable {
  final String id;
  final String name;

  TutorialActivityEntity(this.id, this.name);

  Map<String, Object> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'Tutorial { id: $id, name: $name}';
  }

  static TutorialActivityEntity fromJson(Map<String, Object> json) {
    return TutorialActivityEntity(
        json['id'] as String,
        json['name'] as String,
    );
  }

  static TutorialActivityEntity fromSnapshot(DocumentSnapshot snap) {
    return TutorialActivityEntity(
        snap.documentID,
        snap.data['activityName'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'id': id,
      'name': name,
    };
  }
}