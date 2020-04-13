import 'dart:async';

import 'package:authentication/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_repository/data_repository.dart';

abstract class DataRepository {

  Future<void> addNewGarden(Garden garden);

  Future<void> addNewActivity(Activity activity);

  Stream<List<Parcel>> loadParcels(String gardenId, String userId, String userPseudo);

  Future<void> addNewDesignParcel(DesignParcel design);

  Future<void> addNewParcel(Parcel parcel);

  Future<void> copyGarden(Garden garden);

  Future<void> addParcelActivities(List<Activity> schedule);

  Future<void> deleteGarden(Garden garden);

  Future<void> deleteParcel(String parcelId);

  Future<void> copyParcel(Parcel parcel);

  Future<void> deleteActivitiesFromParcel(String parcelId);

  Future<void> deleteActivitiesFromGarden(String gardenId);

  Future<void> deleteDesignsParcel(String gardenId);

  Future<void> deleteGardenParcels(String gardenId);

  Future<void> deleteDesignsFromGarden(String gardenId);

  Future<String> fetchIdGardenCreated(String gardenName);

  Stream<List<Garden>> gardens(String userId, String userPseudo);

  Stream<List<Modeling>> fetchModelings(List<String> veggiesList);

  Future<List<ModelingSchedule>> fetchModelingActivities(String modelingId);

  Stream<List<Activity>> loadParcelActivities(String parcelId, DateTime first, DateTime last);

  Stream<List<DesignParcel>> loadDesignParcel(String gardenId);

  Future<int> gardenParcelsCounting(String gardenId);

  Future<void> updateGarden(Garden update);

  Future<int> userParcelCounting(String userId, String userPseudo);

  Future<int> userActivitiesCounting(String userId);

  Future<int> gardenDayActivitiesCounting(String gardenId);

  Future<int> parcelDayActivitiesCounting(String parcelId);


  Future<void> updateActivity(Activity update);

  Future<QuerySnapshot> searchByName(String value);

  Future<QuerySnapshot> searchById(String value);

  Future<void> updateParcel(Parcel update);

  Future<void> updateParcelsFromGarden(String gardenId, String userId);

  Stream<List<Vegetable>> fetchVeggies();
  }
