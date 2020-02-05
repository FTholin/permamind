import 'package:meta/meta.dart';
import 'package:authentication/src/entities/entities.dart';

@immutable
class User {
  final String id;
  final String pseudo;
  final String nationality;
  final String email;
  final String searchKey;

  User(
    this.id,
    this.pseudo,
    this.email,
    this.searchKey, {
    String nationality = 'French',
  }) : this.nationality = nationality ?? 'French';

  User copyWith(
      {String id,
      String pseudo,
      String email,
      String firstName,
      String lastName,
      String nationality,
      List<String> gardensAssociated,
      List<String> activitiesAssignated,
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
          nationality == other.nationality && searchKey == other.searchKey;

  @override
  String toString() {
    return 'User { id: $id , pseudo: $pseudo, email: $email, nationality: $nationality, searchKey: $searchKey }';
  }

  UserEntity toEntity() {
    return UserEntity(id, pseudo, email, nationality, searchKey);
  }

  static User fromEntity(UserEntity entity) {
    return User(
      entity.id,
      entity.pseudo,
      entity.email,
      entity.searchKey,
      nationality: entity.nationality ?? 'French',
    );
  }
}
