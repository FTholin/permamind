import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ActivityEntity extends Equatable {
  final String id;
  final String title;
  final String gardenId;
  final String parcelId;
  final bool complete;
  final DateTime expectedDate;
  final String category;
  final String completeActivityUserId;


  ActivityEntity(
      this.id,
      this.title,
      this.gardenId,
      this.parcelId,
      this.complete,
      this.expectedDate,
      this.category,
      this.completeActivityUserId
      );

  Map<String, Object> toJson() {
    return {
      'id': id,
      'title': title,
      'gardenId': gardenId,
      'parcelId': parcelId,
      'complete': complete,
      'expectedDate': expectedDate,
      'category': category,
      'completeActivityUserId': completeActivityUserId
    };
  }


  @override
  List<Object> get props => [id, title, gardenId, parcelId, complete, expectedDate, category, completeActivityUserId];


  @override
  String toString() {
    return 'ActivityEntity { id: $id, title: $title }';
  }

  static ActivityEntity fromJson(Map<String, Object> json) {
    return ActivityEntity(
        json['id'] as String,
        json['gardenId'] as String,
        json['parcelId'] as String,
        json['title'] as String,
        json['complete'] as bool,
        json['expectedDate'],
        json['category'] as String,
        json['completeActivityUserId']
    );
  }

  static ActivityEntity fromSnapshot(DocumentSnapshot snap) {

    return ActivityEntity(
        snap.documentID,
        snap.data['title'],
        snap.data['gardenId'],
        snap.data['parcelId'],
        snap.data['complete'],
        DateTime.fromMillisecondsSinceEpoch(
            snap.data["expectedDate"].millisecondsSinceEpoch),
        snap.data['category'],
        snap.data['completeActivityUserId']
    );
  }

  Map<String, Object> toDocument() {
    return {
      'gardenId': gardenId,
      'parcelId': parcelId,
      'title': title,
      'complete': complete,
      'expectedDate': expectedDate,
      'category': category,
      'completeActivityUserId': completeActivityUserId
    };
  }
}