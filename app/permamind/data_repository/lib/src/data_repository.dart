import 'dart:async';

import 'package:data_repository/data_repository.dart';

abstract class DataRepository {
  Future<void> addNewGarden(Garden garden);

  Future<void> deleteGarden(Garden garden);

  Stream<List<Garden>> gardens(String userId);

  Stream<List<Modeling>> fetchModelings();

  Future<void> updateGarden(Garden garden);
}
