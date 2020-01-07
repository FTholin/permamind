import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:data_repository/src/entities/entities.dart';


@immutable
class TutorialActivity {
  final String id;
  final String heading;
  final String content;

  TutorialActivity(this.heading, this.content, {String id})
      : this.id = id;

  TutorialActivity copyWith({String id, String heading
  }) {
    return TutorialActivity(
        heading ?? this.heading,
        content ?? this.content,
        id: id ?? this.id
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^ heading.hashCode ^ content.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TutorialActivity &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              heading == other.heading &&
              content == other.content;

  @override
  String toString() {
    return 'TutorialActivity { id: $id, heading: $heading, content: $content}';
  }

  TutorialActivityEntity toEntity() {
    return TutorialActivityEntity(id, heading, content);
  }

  static TutorialActivity fromEntity(TutorialActivityEntity entity) {
    return TutorialActivity(
      entity.heading,
      entity.content,
      id: entity.id,
    );
  }
}