import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String pseudo;
  final String firstName;
  final String lastName;
  final String nationality;
  final String email;

  UserEntity(this.id, this.pseudo, this.email, this.firstName, this.lastName, this.nationality);

  Map<String, Object> toJson() {
    return {
      'id': id,
      'pseudo': pseudo,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'nationality': nationality,
    };
  }

  @override
  String toString() {
    return 'UserEntity { id: $id, pseudo: $pseudo, email: $email, firstName: $firstName, lastName: $lastName, nationality: $nationality }';
  }

  static UserEntity fromJson(Map<String, Object> json) {
    return UserEntity(
      json['id'] as String,
      json['pseudo'] as String,
      json['email'] as String,
      json['firstName'] as String,
      json['lastName'] as String,
      json['nationality'] as String,
    );
  }

  static UserEntity fromSnapshot(DocumentSnapshot snap) {
    return UserEntity(
      snap.documentID,
      snap.data['pseudo'],
      snap.data['email'],
      snap.data['firstName'],
      snap.data['lastName'],
      snap.data['nationality'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'id': id,
      'pseudo': pseudo,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'nationality': nationality,
    };
  }
}