import 'package:meta/meta.dart';
import 'package:authentication/src/entities/entities.dart';

@immutable
class User {
  final String id;
  final String pseudo;
  final String nationality;
  final String email;
  final String searchKey;
  final int gardenCounter;
  final int parcelCounter;
  final int accountStatus;

  User(
    this.id,
    this.pseudo,
    this.email,
    this.searchKey, {
    String nationality = 'French',
    int gardenCounter = 0,
    int parcelCounter = 0,
    int accountStatus = 0,
  }) : this.nationality = nationality ?? 'French', this.gardenCounter = 0, this.parcelCounter = 0, this.accountStatus = 0;

  User copyWith(
      {String id,
      String pseudo,
      String email,
      String nationality,
      String searchKey}) {
    return User(
      id ?? this.id,
      pseudo ?? this.pseudo,
      email ?? this.email,
      searchKey ?? this.searchKey,
      nationality: nationality ?? this.nationality,
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^ pseudo.hashCode ^ email.hashCode ^ nationality.hashCode ^ searchKey.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          pseudo == other.pseudo &&
          email == other.email &&
          nationality == other.nationality &&
          searchKey == other.searchKey &&
          gardenCounter == other.gardenCounter &&
          parcelCounter == other.parcelCounter &&
          accountStatus == other.accountStatus;

  @override
  String toString() {
    return 'User { id: $id , pseudo: $pseudo, email: $email, nationality: $nationality, searchKey: $searchKey }';
  }

  UserEntity toEntity() {
    return UserEntity(id, pseudo, email, nationality, searchKey, gardenCounter, parcelCounter, accountStatus);
  }

  static User fromEntity(UserEntity entity) {
    return User(
      entity.id,
      entity.pseudo,
      entity.email,
      entity.searchKey,
      nationality: entity.nationality ?? 'French',
      gardenCounter: entity.gardenCounter ?? 0,
      parcelCounter: entity.gardenCounter ?? 0,
      accountStatus: entity.accountStatus ?? 0
    );
  }
}
