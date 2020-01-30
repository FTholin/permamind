import 'dart:async';

import 'package:data_repository/data_repository.dart';

abstract class DataRepository {
  Future<String> addNewGarden(Garden garden);

  Future<void> addNewActivity(Activity activity);

  Future<void> addGardenActivities(List<Activity> schedule);

  Future<void> deleteGarden(Garden garden);

  Future<void> deleteGardenActivities(String gardenId);

  Stream<List<Garden>> gardens(String userId);

  Stream<List<Modeling>> fetchModelings();

  Stream<List<Activity>> fetchGardenActivities(String gardenId);

  Future<void> updateGarden(Garden garden);

  Future<void> updateActivity(Activity update);

  }
