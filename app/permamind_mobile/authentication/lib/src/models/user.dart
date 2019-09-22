import 'package:meta/meta.dart';
import 'package:authentication/src/entities/entities.dart';

@immutable
class User {
  final String id;
  final String pseudo;
  final String nationality;
  final String email;
  List<String> gardensAssociated;
  List<String> activitiesAssignated;

  User(this.id, this.pseudo, this.email, this.gardensAssociated, this.activitiesAssignated, {String nationality = 'French'})
      : this.nationality = nationality ?? 'French';

  User copyWith({String id, String pseudo, String email, String firstName, String lastName, String nationality, List<String> gardensAssociated, List<String> activitiesAssignated}) {
    return User(
      id ?? this.id,
      pseudo ?? this.pseudo,
      email ?? this.email,
      gardensAssociated ?? this.gardensAssociated,
      activitiesAssignated ?? this.activitiesAssignated,
      nationality: nationality ?? this.nationality
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^ pseudo.hashCode ^ email.hashCode  ^ nationality.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is User &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              pseudo == other.pseudo &&
              email == other.email &&
              gardensAssociated == other.gardensAssociated &&
              activitiesAssignated == other.activitiesAssignated &&
              nationality == other.nationality;

  @override
  String toString() {
    return 'User { id: $id , pseudo: $pseudo, email: $email, gardensAssociated: $gardensAssociated, activitiesAssignated: $activitiesAssignated,  nationality: $nationality }';
  }

  UserEntity toEntity() {
    return UserEntity(id, pseudo, email, gardensAssociated, activitiesAssignated, nationality);
  }

  static User fromEntity(UserEntity entity) {
    return User(
      entity.id,
      entity.pseudo,
      entity.email,
      entity.gardensAssociated,
      entity.activitiesAssignated,
      nationality: entity.nationality ?? 'French',
    );
  }
}