
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

  final tutorialsCollection = Firestore.instance.collection('tutorials');


  @override
  Future<void> addNewGarden(Garden garden) {
    return gardensCollection.add(garden.toEntity().toDocument());
  }


  @override
  Future<void> deleteGarden(Garden garden) async {
    return gardensCollection.document(garden.id).delete();
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
    return modelingsCollection
        .where("modelingName", isEqualTo: "Carotte - Radis").
    snapshots().map((snapshot) {
      return snapshot.documents
        .map((doc) => Modeling.fromEntity(ModelingEntity.fromSnapshot(doc)))
        .toList();
    });
  }


  Stream<List<Tutorial>> loadTutorials() {
    return tutorialsCollection
        .orderBy('classificationOrder', descending: false)
        .snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Tutorial.fromEntity(TutorialEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  Stream<List<TutorialActivity>> fetchTutoActivities(String tutoId) {
    return tutorialsCollection
        .document(tutoId).collection("activities")
        .orderBy('classificationOrder', descending: false)
        .snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => TutorialActivity.fromEntity(TutorialActivityEntity.fromSnapshot(doc)))
          .toList();
    });
  }

//  .document("Film").collection("firstFilm").getDocuments();


  Stream<List<TutorialActivity>> fetchActivities(String activityId) {
    return tutorialsCollection
        .document(activityId)
        .collection("activities")
        .snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => TutorialActivity.fromEntity(TutorialActivityEntity.fromSnapshot(doc)))
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
        .document(update.id)
        .updateData(update.toEntity().toDocument());
  }
}
