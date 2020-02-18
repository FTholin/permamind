import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';

abstract class DataRepository {

  Future<void> addNewGarden(Garden garden);

  Future<void> addNewActivity(Activity activity);

  Stream<List<Parcel>> loadParcels(String gardenId);

  Future<void> addNewGardenDesign(GardenDesign design);

  Future<void> addNewParcel(Parcel parcel);

  Future<void> copyGarden(Garden garden);

  Future<void> addParcelActivities(List<Activity> schedule);

  Future<void> deleteGarden(Garden garden);

  Future<void> deleteParcel(Parcel parcel);

  Future<void> copyParcel(Parcel parcel);

  Future<void> deleteGardenActivities(String gardenId);

  Future<void> deleteGardenDesign(String gardenId);

  Future<String> fetchIdGardenCreated(String gardenName);

  Stream<List<Garden>> gardens(String userId, String userPseudo);

  Stream<List<Modeling>> fetchModelings();

  Stream<List<Activity>> loadParcelActivities(String parcelId);

  Stream<List<GardenDesign>> loadGardenDesign(String gardenId);

  Future<void> updateGarden(Garden garden);

  Future<void> updateActivity(Activity update);

  Future<QuerySnapshot> searchByName(String value);

  Future<QuerySnapshot> searchById(String value);

  Future<void> updateParcel(Parcel update);

  }
