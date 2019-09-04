import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String pseudo;
  final String nationality;
  final String email;

  UserEntity(this.pseudo, this.email, this.nationality);

  Map<String, Object> toJson() {
    return {
      'pseudo': pseudo,
      'email': email,
      'nationality': nationality,
    };
  }

  @override
  String toString() {
    return 'UserEntity { pseudo: $pseudo, email: $email, nationality: $nationality }';
  }

  static UserEntity fromJson(Map<String, Object> json) {
    return UserEntity(
      json['pseudo'] as String,
      json['email'] as String,
      json['nationality'] as String,
    );
  }

  static UserEntity fromSnapshot(DocumentSnapshot snap) {
    return UserEntity(
      snap.data['pseudo'],
      snap.data['email'],
      snap.data['nationality'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'pseudo': pseudo,
      'email': email,
      'nationality': nationality,
    };
  }
}