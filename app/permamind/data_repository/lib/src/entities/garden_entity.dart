import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

class GardenEntity extends Equatable {
  final String id;
  final String name;
  final bool publicVisibility;
  final String modelingId;
  final String modelingName;
  final double length;
  final double width;
  final bool gardenGround;
  final String admin;
  final List<GardenMember> members;
  final DateTime creationDate;

  GardenEntity(this.id,
      this.name,
      this.length,
      this.width,
      this.gardenGround,
      this.publicVisibility,
      this.admin,
      this.members,
      this.modelingId,
      this.modelingName,
      this.creationDate);

  Map<String, Object> toJson() {
    return {
      'id': id,
      'name': name,
      'publicVisibility': publicVisibility,
      'admin': admin,
      'members': members,
      'modelingName': modelingName,
      'creationDate': creationDate
    };
  }

  @override
  String toString() {
    return 'GardenEntity { id: $id, name: $name, publicVisibility: $publicVisibility, members: $members }';
  }

  static GardenEntity fromJson(Map<String, Object> json) {
    return GardenEntity(
      json['id'] as String,
      json['name'] as String,
      json['length'] as double,
      json['width'] as double,
      json['gardenGround'] as bool,
      json['publicVisibility'] as bool,
      json['admin'] as String,
      json['members'] as List<GardenMember>,
      json['modelingId'] as String,
      json['modelingName'] as String,
      json['creationDate']
    );
  }

  static GardenEntity fromSnapshot(DocumentSnapshot snap) {

    return GardenEntity(
      snap.documentID,
      snap.data['name'],
      snap.data['length'],
      snap.data['width'],
      snap.data['gardenGround'],
      snap.data['publicVisibility'],
      snap.data['admin'],
      snap.data['members'].map<GardenMember>((item) {
        return GardenMember.fromMap(item);
      }).toList(),
      snap.data['modelingId'],
      snap.data['modelingName'],
        DateTime.fromMillisecondsSinceEpoch(
            snap.data["creationDate"].millisecondsSinceEpoch)
    );
  }

  Map<String, Object> toDocument() {
    return {
      'name': name,
      'length': length,
      'width': width,
      'gardenGround': gardenGround,
      'publicVisibility': publicVisibility,
      'admin': admin,
      'members': members,
      'modelingId': modelingId,
      'modelingName': modelingName,
      'creationDate': creationDate
    };
  }
}