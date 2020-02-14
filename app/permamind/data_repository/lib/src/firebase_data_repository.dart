
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

  final activitiesCollection = Firestore.instance.collection('activities');

  final designsCollection = Firestore.instance.collection('designs');

  @override
  Future<String> addNewGarden(Garden garden) async {
    DocumentReference docRef = await gardensCollection.add(garden.toEntity().toDocument());
    return docRef.documentID;
  }


  @override
  Future<void> addNewGardenDesign(GardenDesign design) async {
    return designsCollection.add(design.toEntity().toDocument());
  }

  @override
  Future<void> addNewActivity(Activity activity) {
    return activitiesCollection.add(activity.toEntity().toDocument());
  }


  @override
  Future<void> deleteGarden(Garden garden) async {
    return gardensCollection.document(garden.id).delete();
  }

  @override
  Future<void> copyGarden(Garden garden) async {
    return gardensCollection.document(garden.id).setData(garden.toEntity().toDocument());
  }

  @override
  Future<String> fetchIdGardenCreated(String gardenName) async {
    return  gardensCollection.where("name",isEqualTo: gardenName).getDocuments().then((snapshot) {
      return snapshot.documents.first.documentID;
    });
  }

  @override
  Future<void> addGardenActivities(List<Activity> schedule) async {

    var batch = Firestore.instance.batch();


      for (int i = 0; i < schedule.length; i++) {
        DocumentReference docRef = await activitiesCollection.add(
            schedule[i].toEntity().toDocument());
        batch.setData(docRef, {
          'title': schedule[i].title,
          'gardenId': schedule[i].gardenId,
          'complete': schedule[i].complete,
          'expectedDate': schedule[i].expectedDate,
          'category': schedule[i].category,
          'completeActivityUserId': schedule[i].completeActivityUserId
        });
      }
    batch.commit();

}

  @override
  Future<void> deleteGardenActivities(String gardenId) async {

    activitiesCollection.where("gardenId",isEqualTo: gardenId).getDocuments().then((snapshot) {
      for (DocumentSnapshot doc in snapshot.documents) {
        doc.reference.delete();
      }
    });

  }

  @override
  Future<void> deleteGardenDesign(String gardenId) async {

    designsCollection.where("gardenId",isEqualTo: gardenId).getDocuments().then((snapshot) {
      for (DocumentSnapshot doc in snapshot.documents) {
        doc.reference.delete();
      }
    });

  }

  @override
  Stream<List<Garden>> gardens(String userId, String userPseudo) {
    return gardensCollection
        .where("members",arrayContains: {'id': userId, 'pseudo': userPseudo})
        .snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Garden.fromEntity(GardenEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Stream<List<GardenDesign>> loadGardenDesign(String gardenId) {
    return designsCollection
        .where("gardenId", isEqualTo: gardenId)
        .snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => GardenDesign.fromEntity(GardenDesignEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Stream<List<Modeling>> fetchModelings() {
    return modelingsCollection
    .snapshots().map((snapshot) {
      return snapshot.documents
        .map((doc) => Modeling.fromEntity(ModelingEntity.fromSnapshot(doc)))
        .toList();
    });
  }


  Stream<List<Tutorial>> loadTutorials() {
    return tutorialsCollection
        .orderBy('tutorialClassificationOrder', descending: false)
        .snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Tutorial.fromEntity(TutorialEntity.fromSnapshot(doc)))
          .toList();
    });
  }

//  Stream<List<TutorialActivity>> fetchTutoActivities(String tutoId) {
//    return tutorialsCollection
//        .document(tutoId).collection("activities")
//        .orderBy('classificationOrder', descending: false)
//        .snapshots().map((snapshot) {
//      return snapshot.documents
//          .map((doc) => TutorialActivity.fromEntity(TutorialActivityEntity.fromSnapshot(doc)))
//          .toList();
//    });
//  }

  @override
  Stream<List<Activity>> fetchGardenActivities(String gardenId) {

    return activitiesCollection
        .where("gardenId", isEqualTo: gardenId)
        .snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Activity.fromEntity(ActivityEntity.fromSnapshot(doc)))
          .toList();
    });
  }



  Future<QuerySnapshot> searchByName(String value) {
    return usersCollection
    .where('searchKey',
    isEqualTo: value.substring(0, 1).toUpperCase())
    .getDocuments();
  }

  Future<QuerySnapshot> searchById(String value) {
    return usersCollection
        .where('id',
        isEqualTo: value)
        .getDocuments();
  }

  @override
  Future<void> updateGarden(Garden update) {
    return gardensCollection
        .document(update.id)
        .updateData(update.toEntity().toDocument());
  }

  @override
  Future<void> updateActivity(Activity update) {
    return activitiesCollection
        .document(update.id)
        .updateData(update.toEntity().toDocument());
  }
}
