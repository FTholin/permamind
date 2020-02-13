import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';

abstract class DataRepository {

  Future<String> addNewGarden(Garden garden);

  Future<void> addNewActivity(Activity activity);

  Future<void> addNewGardenDesign(GardenDesign design);

  Future<void> copyGarden(Garden garden);

  Future<void> addGardenActivities(List<Activity> schedule);

  Future<void> deleteGarden(Garden garden);

  Future<void> deleteGardenActivities(String gardenId);

  Future<void> deleteGardenDesign(String gardenId);

  Future<String> fetchIdGardenCreated(String gardenName);

  Stream<List<Garden>> gardens(String userId, String userPseudo);

  Stream<List<Modeling>> fetchModelings();

  Stream<List<Activity>> fetchGardenActivities(String gardenId);

  Stream<List<GardenDesign>> loadGardenDesign(String gardenId);

  Future<void> updateGarden(Garden garden);

  Future<void> updateActivity(Activity update);

  Future<QuerySnapshot> searchByName(String value);

  Future<QuerySnapshot> searchById(String value);

}
