import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

class ParcelEntity extends Equatable {
  final String id;
  final String name;
  final String gardenId;
  final bool publicVisibility;
  final String currentModelingId;
  final String currentModelingName;
  final double length;
  final double width;
  final bool parcelGround;
  final String admin;
  final List<GardenMember> members;
  final DateTime creationDate;
  final int dayActivitiesCount;
  final List<String> modelingsMonitoring;
  final bool isActive;

  ParcelEntity(
      this.id,
      this.name,
      this.gardenId,
      this.length,
      this.width,
      this.parcelGround,
      this.publicVisibility,
      this.admin,
      this.members,
      this.currentModelingId,
      this.currentModelingName,
      this.creationDate,
      this.dayActivitiesCount,
      this.modelingsMonitoring,
      this.isActive);

  Map<String, Object> toJson() {
    return {
      'id': id,
      'name': name,
      'gardenId': gardenId,
      'publicVisibility': publicVisibility,
      'admin': admin,
      'members': members.map((item) {
        return item.toJson();
      }).toList(),
      'currentModelingName': currentModelingName,
      'creationDate': creationDate,
      'dayActivitiesCount': dayActivitiesCount,
      'modelingsMonitoring': modelingsMonitoring,
      'isActive': isActive
    };
  }

  @override
  String toString() {
    return 'ParcelEntity { id: $id, name: $name, gardenId: $gardenId}';
  }


  @override
  List<Object> get props => [id,
    name, gardenId,publicVisibility,
    admin, members,currentModelingName,
    creationDate,dayActivitiesCount, modelingsMonitoring, isActive];


  static ParcelEntity fromJson(Map<String, Object> json) {
    return ParcelEntity(
        json['id'] as String,
        json['name'] as String,
        json['gardenId'] as String,
        json['length'] as double,
        json['width'] as double,
        json['parcelGround'] as bool,
        json['publicVisibility'] as bool,
        json['admin'] as String,
        json['members'] as List<GardenMember>,
        json['currentModelingId'] as String,
        json['currentModelingName'] as String,
        json['creationDate'],
        json['dayActivitiesCount'],
        json['modelingsMonitoring'],
        json['isActive']
    );
  }

  static ParcelEntity fromSnapshot(DocumentSnapshot snap) {

    return ParcelEntity(
        snap.documentID,
        snap.data['name'],
        snap.data['gardenId'],
        snap.data['length'],
        snap.data['width'],
        snap.data['parcelGround'],
        snap.data['publicVisibility'],
        snap.data['admin'],
        snap.data['members'].map<GardenMember>((item) {
          return GardenMember.fromMap(item);
        }).toList(),
        snap.data['currentModelingId'],
        snap.data['currentModelingName'],
        DateTime.fromMillisecondsSinceEpoch(
            snap.data["creationDate"].millisecondsSinceEpoch),
        snap.data['dayActivitiesCount'],
        new List<String>.from(snap.data['modelingsMonitoring']),
        snap.data['isActive']
    );
  }

  Map<String, Object> toDocument() {
    return {
      'name': name,
      'gardenId': gardenId,
      'length': length,
      'width': width,
      'parcelGround': parcelGround,
      'publicVisibility': publicVisibility,
      'admin': admin,
      'members': members.map((item) {
        return item.toJson();
      }).toList(),
      'currentModelingId': currentModelingId,
      'currentModelingName': currentModelingName,
      'creationDate': creationDate,
      'dayActivitiesCount': dayActivitiesCount,
      'modelingsMonitoring': modelingsMonitoring,
      'isActive': isActive
    };
  }
}