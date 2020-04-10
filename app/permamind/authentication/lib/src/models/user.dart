import 'package:meta/meta.dart';
import 'package:authentication/src/entities/entities.dart';

@immutable
class User {
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

  User(
    this.authenticationId,
    this.pseudo,
    this.email,
    this.searchKey,
    this.nationality,
    this.gardenCounter,
    this.parcelCounter,
    this.accountStatus,
    this.tutorialsCompleted,
    {String id}) : this.id = id;

  User copyWith(
      {String id, String authenticationId,
      String pseudo,
      String email,
      String nationality,
      String searchKey,
      int gardenCounter,
      int parcelCounter,
      int accountStatus,
      List<String> tutorialsCompleted}) {
    return User(
      authenticationId ?? this.authenticationId,
      pseudo ?? this.pseudo,
      email ?? this.email,
      searchKey ?? this.searchKey,
      nationality ?? this.nationality,
      gardenCounter ?? this.gardenCounter, parcelCounter ?? this.parcelCounter,
      accountStatus ?? this.accountStatus,
      tutorialsCompleted ?? this.tutorialsCompleted,
      id: id ?? this.id,
    );
  }

  @override
  int get hashCode => authenticationId.hashCode ^
      id.hashCode ^ pseudo.hashCode ^ email.hashCode ^ nationality.hashCode ^ searchKey.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          authenticationId == other.authenticationId &&
          id == other.id &&
          pseudo == other.pseudo &&
          email == other.email &&
          nationality == other.nationality &&
          searchKey == other.searchKey &&
          gardenCounter == other.gardenCounter &&
          parcelCounter == other.parcelCounter &&
          accountStatus == other.accountStatus && tutorialsCompleted == other.tutorialsCompleted;

  @override
  String toString() {
    return 'User { id: $id , pseudo: $pseudo, email: $email, nationality: $nationality, searchKey: $searchKey }';
  }

  UserEntity toEntity() {
    return UserEntity(id, authenticationId, pseudo, email, nationality, searchKey, gardenCounter, parcelCounter, accountStatus, tutorialsCompleted);
  }

  static User fromEntity(UserEntity entity) {
    return User(
      entity.authenticationId,
      entity.pseudo,
      entity.email,
      entity.searchKey,
      entity.nationality,
      entity.gardenCounter,
      entity.gardenCounter,
      entity.accountStatus,
      entity.tutorialsCompleted,
      id: entity.id,
    );
  }
}
