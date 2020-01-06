import 'package:data_repository/data_repository.dart';
import 'package:data_repository/src/entities/entities.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
class Tutorial extends Equatable {
  
  final String id;
  final String heading;


  Tutorial(this.heading, {String id})
      : this.id = id;

  Tutorial copyWith({String id, String heading,
  }) {
    return Tutorial(
        heading ?? this.heading,
        id: id ?? this.id
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^ heading.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Tutorial &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              heading == other.heading;

  @override
  String toString() {
    return 'Tutorial { id: $id, heading: $heading}';
  }

//  TutorialEntity toEntity() {
//    return TutorialEntity(id, heading, activities);
//  }

  static Tutorial fromEntity(TutorialEntity entity) {
    return Tutorial(
      entity.heading,
      id: entity.id,
    );
  }
}

