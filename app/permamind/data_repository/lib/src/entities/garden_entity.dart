import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

class GardenEntity extends Equatable {
  final String id;
  final String name;
  final bool publicVisibility;
  final String admin;
  final List<GardenMember> members;
  final DateTime creationDate;
  final int dayActivitiesCount;

  GardenEntity(
      this.id,
      this.name,
      this.publicVisibility,
      this.admin,
      this.members,
      this.creationDate,
      this.dayActivitiesCount
      );

  Map<String, Object> toJson() {
    return {
      'id': id,
      'name': name,
      'publicVisibility': publicVisibility,
      'admin': admin,
      'members': members.map((item) {
        return item.toJson();
      }).toList(),
      'creationDate': creationDate,
      'dayActivitiesCount': dayActivitiesCount
    };
  }

  @override
  List<Object> get props => [id, name, publicVisibility, admin, members, creationDate, dayActivitiesCount];

  @override
  String toString() {
    return 'GardenEntity { id: $id, name: $name, publicVisibility: $publicVisibility, members: $members }';
  }

  static GardenEntity fromJson(Map<String, Object> json) {
    return GardenEntity(
        json['id'] as String,
        json['name'] as String,
        json['publicVisibility'] as bool,
        json['admin'] as String,
        json['members'] as List<GardenMember>,
        json['creationDate'],
        json['dayActivitiesCount']
    );
  }

  static GardenEntity fromSnapshot(DocumentSnapshot snap) {

    return GardenEntity(
        snap.documentID,
        snap.data['name'],
        snap.data['publicVisibility'],
        snap.data['admin'],
        snap.data['members'].map<GardenMember>((item) {
          return GardenMember.fromMap(item);
        }).toList(),
        DateTime.fromMillisecondsSinceEpoch(
            snap.data["creationDate"].millisecondsSinceEpoch),
        snap.data['dayActivitiesCount']
    );
  }

  Map<String, Object> toDocument() {
    return {
      'name': name,
      'publicVisibility': publicVisibility,
      'admin': admin,
      'members': members.map((item) {
        return item.toJson();
      }).toList(),
      'creationDate': creationDate,
      'dayActivitiesCount': dayActivitiesCount
    };
  }
}