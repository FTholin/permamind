
import 'dart:async';

import 'package:async/async.dart';
import 'package:authentication/authentication.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';
import 'entities/entities.dart';
import 'package:logger/logger.dart';


class FirebaseDataRepository implements DataRepository {

  var logger = Logger();

  @override
  Future<void> addNewGarden(Garden garden) async {
    logger.i("WRITE::addNewGarden");
    return Firestore.instance.collection('gardens').add(garden.toEntity().toDocument());
  }


  @override
  Future<void> addNewDesignParcel(DesignParcel design) async {
    logger.i("WRITE::addNewDesignParcel");
    return Firestore.instance.collection('designs').add(design.toEntity().toDocument());
  }

  @override
  Future<void> addNewActivity(Activity activity) {
    logger.i("WRITE::addNewActivity");
    return Firestore.instance.collection('activities').add(activity.toEntity().toDocument());
  }

  @override
  Future<void> addNewParcel(Parcel parcel) {
    logger.i("WRITE::addNewParcel");
    return Firestore.instance.collection('parcels').document(parcel.id).setData(parcel.toEntity().toDocument());
  }

  @override
  Stream<List<Parcel>> loadParcels(String gardenId, String userId, String userPseudo) {

    logger.i("READ::loadParcels");
    return Firestore.instance.collection('parcels')
        .where("gardenId", isEqualTo: gardenId)
        .where("members",arrayContains: {'id': userId, 'pseudo': userPseudo})
        .snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Parcel.fromEntity(ParcelEntity.fromSnapshot(doc)))
          .toList();
    });
  }


  @override
  Future<void> deleteGarden(Garden garden) async {
    logger.i("DELETE::deleteGarden");
    return Firestore.instance.collection('gardens').document(garden.id).delete();
  }

  @override
  Future<void> copyGarden(Garden garden) async {
    logger.i("WRITE::copyGarden");
    return Firestore.instance.collection('gardens').document(garden.id).setData(garden.toEntity().toDocument());
  }



  @override
  Future<void> deleteParcel(String parcelId) async {
    logger.i("DELETE::deleteParcel");
    return Firestore.instance.collection('parcels').document(parcelId).delete();
  }

  @override
  Future<void> copyParcel(Parcel parcel) async {
    logger.i("WRITE::copyParcel");
    return Firestore.instance.collection('parcels').document(parcel.id).setData(parcel.toEntity().toDocument());
  }

  @override
  Future<String> fetchIdGardenCreated(String gardenName) async {
    logger.i("READ::fetchIdGardenCreated");
    return  Firestore.instance.collection('gardens').where("name",isEqualTo: gardenName).getDocuments().then((snapshot) {
      return snapshot.documents.first.documentID;
    });
  }

  @override
  Future<void> addParcelActivities(List<Activity> schedule) async {

    var batch = Firestore.instance.batch();


      for (int i = 0; i < schedule.length; i++) {
        DocumentReference docRef = await Firestore.instance.collection('activities').add(
            schedule[i].toEntity().toDocument());
        batch.setData(docRef, {
          'title': schedule[i].title,
          'gardenId': schedule[i].gardenId,
          'parcelId': schedule[i].parcelId,
          'complete': schedule[i].complete,
          'expectedDate': schedule[i].expectedDate,
          'category': schedule[i].category,
          'completeActivityUserId': schedule[i].completeActivityUserId
        });
        logger.i("WRITE::addParcelActivities");
      }
    batch.commit();

}

  @override
  Future<void> deleteGardenParcels(String gardenId) async {
    logger.i("READ::deleteGardenParcels");

    Firestore.instance.collection('parcels').where("gardenId",isEqualTo: gardenId).getDocuments().then((snapshot) {
      for (DocumentSnapshot doc in snapshot.documents) {
        logger.i("DELETE::deleteGardenParcels");
        doc.reference.delete();
      }
    });
  }

  @override
  Future<void> deleteActivitiesFromParcel(String parcelId) async {
    logger.i("DELETE::deleteActivitiesFromParcel");

    Firestore.instance.collection('activities').where("parcelId",isEqualTo: parcelId).getDocuments().then((snapshot) {
      for (DocumentSnapshot doc in snapshot.documents) {
        logger.i("DELETE::deleteActivitiesFromParcel");
        doc.reference.delete();
      }
    });
  }

  @override
  Future<void> deleteActivitiesFromGarden(String gardenId) async {
    logger.i("READ::deleteActivitiesFromGarden");

    Firestore.instance.collection('activities').where("gardenId",isEqualTo: gardenId).getDocuments().then((snapshot) {
      for (DocumentSnapshot doc in snapshot.documents) {
        logger.i("DELETE::deleteActivitiesFromGarden");

        doc.reference.delete();
      }
    });
  }

  @override
  Future<void> deleteDesignsFromGarden(String gardenId) async {
    logger.i("READ::deleteDesignsFromGarden");

    Firestore.instance.collection('designs').where("gardenId",isEqualTo: gardenId).getDocuments().then((snapshot) {
      for (DocumentSnapshot doc in snapshot.documents) {
        logger.i("DELETE::deleteDesignsFromGarden");
        doc.reference.delete();
      }
    });
  }

  @override
  Future<void> deleteDesignsParcel(String gardenId) async {
    logger.i("READ::deleteDesignsParcel");
    Firestore.instance.collection('designs').where("parcelId",isEqualTo: gardenId).getDocuments().then((snapshot) {
      for (DocumentSnapshot doc in snapshot.documents) {
        logger.i("DELETE::deleteDesignsParcel");
        doc.reference.delete();
      }
    });

  }

  @override
  Stream<List<Garden>> gardens(String userId, String userPseudo) {
    logger.i("READ::gardens");
    return Firestore.instance.collection('gardens')
        .where("members",arrayContains: {'id': userId, 'pseudo': userPseudo})
        .orderBy('creationDate', descending: false)
        .snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Garden.fromEntity(GardenEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Stream<List<DesignParcel>> loadDesignParcel(String parcelId) {
    logger.i("READ::loadDesignParcel");
    return Firestore.instance.collection('designs')
        .where("parcelId", isEqualTo: parcelId)
        .snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => DesignParcel.fromEntity(DesignParcelEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Stream<List<Modeling>> fetchModelings(List<String> veggiesList) {
    logger.i("READ::fetchModelings");
    if (veggiesList.isEmpty) {
      return Firestore.instance.collection('modelings')
          .snapshots().map((snapshot) {
        return snapshot.documents
            .map((doc) => Modeling.fromEntity(ModelingEntity.fromSnapshot(doc)))
            .toList();
      });
    } else {
      return Firestore.instance.collection('modelings')
          .where('composition', arrayContainsAny: veggiesList)
          .snapshots().map((snapshot) {
        return snapshot.documents
            .map((doc) => Modeling.fromEntity(ModelingEntity.fromSnapshot(doc)))
            .toList();
      });
    }
  }

  @override
  Stream<List<Vegetable>> fetchVeggies() {
    logger.i("READ::fetchVeggies");
    return Firestore.instance.collection('veggies')
        .snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Vegetable.fromEntity(VegetableEntity.fromSnapshot(doc)))
          .toList();
    });
  }


  Stream<List<Tutorial>> loadTutorials() {
    logger.i("READ::loadTutorials");

    return Firestore.instance.collection('tutorials')
        .orderBy('tutorialClassificationOrder', descending: false)
        .snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Tutorial.fromEntity(TutorialEntity.fromSnapshot(doc)))
          .toList();
    });
  }


  @override
  Stream<List<Activity>> loadParcelActivities(String parcelId, DateTime first, DateTime last) {

    logger.i("READ::loadParcelActivities");
    return Firestore.instance.collection('activities')
        .where("parcelId", isEqualTo: parcelId)
        .where("expectedDate", isGreaterThanOrEqualTo: first)
        .where("expectedDate", isLessThanOrEqualTo: last)
        .snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Activity.fromEntity(ActivityEntity.fromSnapshot(doc)))
          .toList();
    });
  }



  Future<QuerySnapshot> searchByName(String value) {
    logger.i("READ::searchByName");

    return Firestore.instance.collection('users')
    .where('searchKey',
    isEqualTo: value.substring(0, 1).toUpperCase())
    .getDocuments();
  }

  Future<QuerySnapshot> searchById(String value) {
    logger.i("READ::searchById");
    return Firestore.instance.collection('users')
        .where('id',
        isEqualTo: value)
        .getDocuments();
  }

  @override
  Future<void> updateGarden(Garden update) {
    logger.i("WRITE::updateGarden");

    return Firestore.instance.collection('gardens')
        .document(update.id)
        .updateData(update.toEntity().toDocument());
  }

  @override
  Future<void> updateActivity(Activity update) {
    logger.i("WRITE::updateActivity");
    return Firestore.instance.collection('activities')
        .document(update.id)
        .updateData(update.toEntity().toDocument());
  }


  @override
  Future<void> updateParcel(Parcel update) {
    logger.i("WRITE::updateParcel");
    return Firestore.instance.collection('parcels')
        .document(update.id)
        .updateData(update.toEntity().toDocument());
  }


  @override
  Future<void> updateParcelsFromGarden(String gardenId, String userId) {
    logger.i("READ::updateParcelsFromGarden");

    return Firestore.instance.collection('parcels').where("gardenId",isEqualTo: gardenId).getDocuments().then((snapshot) {
      for (DocumentSnapshot doc in snapshot.documents) {
        logger.i("WRITE::updateParcelsFromGarden");

        var newMembers = doc.data['members'];
        newMembers.removeWhere((member) => member['id'] == userId);

        doc.reference.setData({
          'name': doc.data['name'],
          'gardenId': doc.data['gardenId'],
          'length': doc.data['length'],
          'width': doc.data['width'],
          'parcelGround': doc.data['parcelGround'],
          'publicVisibility': doc.data['publicVisibility'],
          'admin': doc.data['admin'],
          'members': newMembers,
          'currentModelingId': doc.data['currentModelingId'],
          'currentModelingName': doc.data['currentModelingName'],
          'creationDate': doc.data['creationDate'],
          'dayActivitiesCount': doc.data['dayActivitiesCount'],
          'modelingsMonitoring': doc.data['modelingsMonitoring']
        });
      }
    });

  }
}
