import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
class GardenActivityEntity extends Equatable {
  final String id;
  final String name;
  final bool isDone;

  GardenActivityEntity(this.id, this.name, this.isDone);

  Map<String, Object> toJson() {
    return {
      'id': id,
      'name': name,
      'isDone': isDone
    };
  }

  @override
  String toString() {
    return 'GardenActivityEntity { id: $id, name: $name}';
  }

  static GardenActivityEntity fromJson(Map<String, Object> json) {
    return GardenActivityEntity(
        json['id'] as String,
        json['name'] as String,
        json['isDone'] as bool
    );
  }

  static GardenActivityEntity fromSnapshot(DocumentSnapshot snap) {
    return GardenActivityEntity(
        snap.documentID,
        snap.data['name'],
        snap.data['isDone']
    );
  }

  Map<String, Object> toDocument() {
    return {
      'id': id,
      'name': name,
      'isDone': isDone
    };
  }
}