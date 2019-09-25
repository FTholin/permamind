
import 'dart:async';

import 'package:async/async.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';
import 'entities/entities.dart';

class FirebaseDataRepository implements DataRepository {

  final todoCollection = Firestore.instance.collection('todos');
  
  final gardensCollection = Firestore.instance.collection('gardens');

  final modelingsCollection = Firestore.instance.collection('modelings');

  final plantsCollection = Firestore.instance.collection('vegetables');


  @override
  Future<void> addNewGarden(Garden garden) {
    return gardensCollection.add(garden.toEntity().toDocument());
  }

  @override
  Future<void> deleteGarden(Garden garden) async {
    return todoCollection.document(garden.gardenId).delete();
  }


  Stream<List<QuerySnapshot>> _combineStreams(String userId) {

    var stream1 = gardensCollection
        .where("gardenOwners", arrayContains: userId)
        .snapshots();

    var stream2 = gardensCollection
      .where("gardenContributors", arrayContains: userId)
      .snapshots();

    return StreamZip(([stream1, stream2])).asBroadcastStream();
  }


  @override
  Stream<List<Garden>> gardens(String userId) {

    var controller = StreamController<List<Garden>>();

    _combineStreams(userId).listen((snapshots) {

      List<DocumentSnapshot> documents = List<DocumentSnapshot>();

      snapshots.forEach((snapshot) {
        documents.addAll(snapshot.documents);
      });

      final gardens = documents.map((doc) {
        final garden = Garden.fromEntity(GardenEntity.fromSnapshot(doc));
        return garden;
      }).toList();

      controller.add(gardens);
    });

    return controller.stream;
  }


  @override
  Stream<List<Modeling>> fetchModelings() {
    return modelingsCollection.snapshots().map((snapshot) {
      return snapshot.documents
        .map((doc) => Modeling.fromEntity(ModelingEntity.fromSnapshot(doc)))
        .toList();
    });
  }


  @override
  Future<void> updateGarden(Garden update) {
    return gardensCollection
        .document(update.gardenId)
        .updateData(update.toEntity().toDocument());
  }
}
