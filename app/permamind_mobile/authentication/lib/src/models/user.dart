import 'package:meta/meta.dart';
import 'package:authentication/src/entities/entities.dart';

@immutable
class User {
  final String id;
  final String pseudo;
  final String firstName;
  final String lastName;
  final String nationality;
  final String email;

  User(this.pseudo, this.email, {String firstName = '', String lastName = '', String nationality = '', String id})
      : this.firstName = firstName ?? '',
        this.lastName = lastName ?? '',
        this.nationality = nationality ?? 'French',
        this.id = id;

  User copyWith({String id, String pseudo, String email, String firstName, String lastName, String nationality}) {
    return User(
      pseudo ?? this.pseudo,
      email ?? this.email,
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      nationality: nationality ?? this.nationality,
    );
  }

  @override
  int get hashCode =>
      pseudo.hashCode ^ email.hashCode ^ id.hashCode ^ firstName.hashCode ^ lastName.hashCode ^ nationality.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is User &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              pseudo == other.pseudo &&
              email == other.email &&
              firstName == other.firstName &&
              lastName == other.lastName &&
              nationality == other.nationality;

  @override
  String toString() {
    return 'User { id: $id, pseudo: $pseudo, email: $email, firstName: $firstName, lastName: $lastName, nationality: $nationality }';
  }

  UserEntity toEntity() {
    return UserEntity(id, pseudo, email, firstName, lastName, nationality);
  }

  static User fromEntity(UserEntity entity) {
    return User(
      entity.pseudo,
      entity.email,
      id: entity.id,
      firstName: entity.firstName ?? '',
      lastName: entity.lastName ?? '',
      nationality: entity.nationality ?? 'French',
    );
  }
}