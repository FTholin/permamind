
import 'dart:async';

import 'package:async/async.dart';
import 'package:authentication/authentication.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';
import 'entities/entities.dart';
import 'package:rxdart/rxdart.dart';


class FirebaseDataRepository implements DataRepository {

  final todoCollection = Firestore.instance.collection('todos');
  
  final gardensCollection = Firestore.instance.collection('gardens');

  final modelingsCollection = Firestore.instance.collection('modelings');

  final plantsCollection = Firestore.instance.collection('vegetables');

  final usersCollection = Firestore.instance.collection('users');

  @override
  Future<void> addNewGarden(Garden garden) {
    return gardensCollection.add(garden.toEntity().toDocument());
  }

  @override
  Future<void> deleteGarden(Garden garden) async {
    return gardensCollection.document(garden.gardenId).delete();
  }

//  ///private method to zip QuerySnapshot streams
//  Stream<QuerySnapshot> _combineStreams(String userId) {
//
//    var stream1 = gardensCollection
//        .where("gardenMembers", arrayContains: userId)
//        .snapshots();
//
//    var stream2 = gardensCollection
//        .where("gardenOwners", arrayContains: userId)
//        .snapshots();
//
//    return StreamGroup.merge([stream2,stream1]);
//
//  }

  Stream<List<Garden>> gardens(String userId) {
    return gardensCollection
        .where("gardenMembers",arrayContains: userId)
        .snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Garden.fromEntity(GardenEntity.fromSnapshot(doc)))
          .toList();
    });
  }


  @override
  Stream<List<Modeling>> fetchModelings() {
    return modelingsCollection.snapshots().map((snapshot) {
      return snapshot.documents
        .map((doc) => Modeling.fromEntity(ModelingEntity.fromSnapshot(doc)))
        .toList();
    });
  }


  Future<QuerySnapshot> searchByName(String value) {
    return usersCollection
    .where('searchKey',
    isEqualTo: value.substring(0, 1).toUpperCase())
    .getDocuments();
  }

  @override
  Future<void> updateGarden(Garden update) {
    return gardensCollection
        .document(update.gardenId)
        .updateData(update.toEntity().toDocument());
  }
}
