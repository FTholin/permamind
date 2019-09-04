import 'package:meta/meta.dart';
import 'package:authentication/src/entities/entities.dart';

@immutable
class User {
  final String pseudo;
  final String nationality;
  final String email;

  User(this.pseudo, this.email, {String nationality = 'French'})
      : this.nationality = nationality ?? 'French';

  User copyWith({String id, String pseudo, String email, String firstName, String lastName, String nationality}) {
    return User(
      pseudo ?? this.pseudo,
      email ?? this.email,
      nationality: nationality ?? this.nationality,
    );
  }

  @override
  int get hashCode =>
      pseudo.hashCode ^ email.hashCode  ^ nationality.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is User &&
              runtimeType == other.runtimeType &&
              pseudo == other.pseudo &&
              email == other.email &&
              nationality == other.nationality;

  @override
  String toString() {
    return 'User { pseudo: $pseudo, email: $email, nationality: $nationality }';
  }

  UserEntity toEntity() {
    return UserEntity(pseudo, email, nationality);
  }

  static User fromEntity(UserEntity entity) {
    return User(
      entity.pseudo,
      entity.email,
      nationality: entity.nationality ?? 'French',
    );
  }
}