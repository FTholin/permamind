import 'package:flutter/material.dart';
import 'package:permamind_mobile/blocs/bloc_provider.dart';

class GardensBloc implements BlocBase {

  Stream<List<int>>  outFavorites ;
  // Ici on va appeler l'api

  void dispose() {
  }
}