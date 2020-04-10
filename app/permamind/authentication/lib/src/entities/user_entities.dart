import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String authenticationId;
  final String pseudo;
  final String nationality;
  final String email;
  final String searchKey;
  final int gardenCounter;
  final int parcelCounter;
  final int accountStatus;
  final List<String> tutorialsCompleted;

  UserEntity(this.id, this.authenticationId, this.pseudo, this.email, this.nationality, this.searchKey, this.gardenCounter, this.parcelCounter, this.accountStatus, this.tutorialsCompleted);

  Map<String, Object> toJson() {
    return {
      'id': id,
      'authenticationId': authenticationId,
      'pseudo': pseudo,
      'email': email,
      'nationality': nationality,
      'searchKey': searchKey,
      'gardenCounter': gardenCounter,
      'parcelCounter': parcelCounter,
      'accountStatus': accountStatus,
      'tutorialsCompleted': tutorialsCompleted,
    };
  }



  @override
  List<Object> get props => [id, authenticationId, pseudo, email, nationality, searchKey,gardenCounter,parcelCounter, accountStatus];


  @override
  String toString() {
    return 'UserEntity { id: $id, pseudo: $pseudo, email: $email, nationality: $nationality, searchKey: $searchKey }';
  }

  static UserEntity fromJson(Map<String, Object> json) {
    return UserEntity(
      json['id'] as String,
      json['authenticationId'] as String,
      json['pseudo'] as String,
      json['email'] as String,
      json['nationality'] as String,
      json['searchKey'] as String,
      json['gardenCounter'] as int,
      json['parcelCounter'] as int,
      json['accountStatus'] as int,
      json['tutorialsCompleted']
    );
  }

  static UserEntity fromSnapshot(DocumentSnapshot snap) {
    return UserEntity(
      snap.documentID,
      snap.data['authenticationId'],
      snap.data['pseudo'],
      snap.data['email'],
      snap.data['nationality'],
      snap.data['searchKey'],
      snap.data['gardenCounter'],
      snap.data['parcelCounter'],
      snap.data['accountStatus'],
      new List<String>.from(snap.data['tutorialsCompleted']),

    );
  }

  Map<String, Object> toDocument() {
    return {
      'authenticationId': authenticationId,
      'pseudo': pseudo,
      'email': email,
      'nationality': nationality,
      'searchKey': searchKey,
      'gardenCounter': gardenCounter,
      'parcelCounter': parcelCounter,
      'accountStatus': accountStatus,
      'tutorialsCompleted': tutorialsCompleted
    };
  }
}
