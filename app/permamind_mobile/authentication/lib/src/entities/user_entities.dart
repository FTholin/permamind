import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String pseudo;
  final String nationality;
  final String email;
  final List<String> gardensAssociated;
  final List<String> activitiesAssignated;

  UserEntity(this.id, this.pseudo, this.email, this.gardensAssociated, this.activitiesAssignated, this.nationality);

  Map<String, Object> toJson() {
    return {
      'id': id,
      'pseudo': pseudo,
      'email': email,
      'nationality': nationality,
      'gardensAssociated': gardensAssociated,
      'activitiesAssignated': activitiesAssignated,
    };
  }

  @override
  String toString() {
    return 'UserEntity { id: $id, pseudo: $pseudo, email: $email, gardens: $gardensAssociated, activities: $activitiesAssignated, nationality: $nationality }';
  }

  static UserEntity fromJson(Map<String, Object> json) {
    return UserEntity(
      json['id'] as String,
      json['pseudo'] as String,
      json['email'] as String,
      json['gardensAssociated'] as List<String>,
      json['activitiesAssignated'] as List<String>,
      json['nationality'] as String,
    );
  }

  static UserEntity fromSnapshot(DocumentSnapshot snap) {
    return UserEntity(
      snap.data['id'],
      snap.data['pseudo'],
      snap.data['email'],
      snap.data['gardensAssociated'],
      snap.data['activitiesAssignated'],
      snap.data['nationality'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'id': id,
      'pseudo': pseudo,
      'email': email,
      'gardensAssociated': gardensAssociated,
      'activitiesAssignated': activitiesAssignated,
      'nationality': nationality,
    };
  }
}