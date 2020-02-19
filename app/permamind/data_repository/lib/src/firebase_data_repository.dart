
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

  final vegetableGardensCollection = Firestore.instance.collection('vegetableGardens');

  final modelingsCollection = Firestore.instance.collection('modelings');

  final plantsCollection = Firestore.instance.collection('vegetables');

  final usersCollection = Firestore.instance.collection('users');

  final tutorialsCollection = Firestore.instance.collection('tutorials');

  final activitiesCollection = Firestore.instance.collection('activities');

  final designsCollection = Firestore.instance.collection('designs');

  final parcelsCollection = Firestore.instance.collection('parcels');

  final activitiesBisCollection = Firestore.instance.collection('activities_bis');


  @override
  Future<void> addNewGarden(Garden garden) async {


    return vegetableGardensCollection.add(garden.toEntity().toDocument());

  }



  @override
  Future<void> addNewDesignParcel(DesignParcel design) async {
    return designsCollection.add(design.toEntity().toDocument());
  }

  @override
  Future<void> addNewActivity(Activity activity) {
    return activitiesBisCollection.add(activity.toEntity().toDocument());
  }

  @override
  Future<void> addNewParcel(Parcel parcel) {
    return parcelsCollection.add(parcel.toEntity().toDocument());
  }

  @override
  Stream<List<Parcel>> loadParcels(String gardenId) {
    return parcelsCollection
        .where("gardenId", isEqualTo: gardenId)
        .snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Parcel.fromEntity(ParcelEntity.fromSnapshot(doc)))
          .toList();
    });
  }


  @override
  Future<void> deleteGarden(Garden garden) async {
    return vegetableGardensCollection.document(garden.id).delete();
  }

  @override
  Future<void> copyGarden(Garden garden) async {
    return gardensCollection.document(garden.id).setData(garden.toEntity().toDocument());
  }



  @override
  Future<void> deleteParcel(Parcel parcel) async {
    return parcelsCollection.document(parcel.id).delete();
  }

  @override
  Future<void> copyParcel(Parcel parcel) async {
    return parcelsCollection.document(parcel.id).setData(parcel.toEntity().toDocument());
  }

  @override
  Future<String> fetchIdGardenCreated(String gardenName) async {
    return  gardensCollection.where("name",isEqualTo: gardenName).getDocuments().then((snapshot) {
      return snapshot.documents.first.documentID;
    });
  }

  @override
  Future<void> addParcelActivities(List<Activity> schedule) async {

    var batch = Firestore.instance.batch();


      for (int i = 0; i < schedule.length; i++) {
        DocumentReference docRef = await activitiesBisCollection.add(
            schedule[i].toEntity().toDocument());
        batch.setData(docRef, {
          'title': schedule[i].title,
          'parcelId': schedule[i].parcelId,
          'complete': schedule[i].complete,
          'expectedDate': schedule[i].expectedDate,
          'category': schedule[i].category,
          'completeActivityUserId': schedule[i].completeActivityUserId
        });
      }
    batch.commit();

}

//  @override
//  Future<void> deleteGardenActivities(String parcelId) async {
//
//    activitiesBisCollection.where("parcelId",isEqualTo: parcelId).getDocuments().then((snapshot) {
//      for (DocumentSnapshot doc in snapshot.documents) {
//        doc.reference.delete();
//      }
//    });
//
//  }

  @override
  Future<void> deleteParcelActivities(String parcelId) async {

    activitiesBisCollection.where("parcelId",isEqualTo: parcelId).getDocuments().then((snapshot) {
      for (DocumentSnapshot doc in snapshot.documents) {
        doc.reference.delete();
      }
    });

  }

  @override
  Future<void> deleteDesignParcel(String gardenId) async {

    designsCollection.where("gardenId",isEqualTo: gardenId).getDocuments().then((snapshot) {
      for (DocumentSnapshot doc in snapshot.documents) {
        doc.reference.delete();
      }
    });

  }

  @override
  Stream<List<Garden>> gardens(String userId, String userPseudo) {
    return vegetableGardensCollection
        .where("members",arrayContains: {'id': userId, 'pseudo': userPseudo})
        .snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Garden.fromEntity(GardenEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Stream<List<DesignParcel>> loadDesignParcel(String gardenId) {
    return designsCollection
        .where("gardenId", isEqualTo: gardenId)
        .snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => DesignParcel.fromEntity(DesignParcelEntity.fromSnapshot(doc)))
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
  Stream<List<Activity>> loadParcelActivities(String parcelId) {
    return activitiesBisCollection
        .where("parcelId", isEqualTo: parcelId)
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
    return vegetableGardensCollection
        .document(update.id)
        .updateData(update.toEntity().toDocument());
  }

  @override
  Future<void> updateActivity(Activity update) {
    return activitiesBisCollection
        .document(update.id)
        .updateData(update.toEntity().toDocument());
  }


  @override
  Future<void> updateParcel(Parcel update) {
    return parcelsCollection
        .document(update.id)
        .updateData(update.toEntity().toDocument());
  }
}
