import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String pseudo;
  final String nationality;
  final String email;
  final String searchKey;

  UserEntity(this.id, this.pseudo, this.email, this.nationality, this.searchKey);

  Map<String, Object> toJson() {
    return {
      'id': id,
      'pseudo': pseudo,
      'email': email,
      'nationality': nationality,
      'searchKey': searchKey
    };
  }

  @override
  String toString() {
    return 'UserEntity { id: $id, pseudo: $pseudo, email: $email, nationality: $nationality, searchKey: $searchKey }';
  }

  static UserEntity fromJson(Map<String, Object> json) {
    return UserEntity(
      json['id'] as String,
      json['pseudo'] as String,
      json['email'] as String,
      json['nationality'] as String,
      json['searchKey'] as String
    );
  }

  static UserEntity fromSnapshot(DocumentSnapshot snap) {
    return UserEntity(
      snap.documentID,
      snap.data['pseudo'],
      snap.data['email'],
      snap.data['nationality'],
      snap.data['searchKey']
    );
  }

  Map<String, Object> toDocument() {
    return {
      'id': id,
      'pseudo': pseudo,
      'email': email,
      'nationality': nationality,
      'searchKey': searchKey
    };
  }
}
