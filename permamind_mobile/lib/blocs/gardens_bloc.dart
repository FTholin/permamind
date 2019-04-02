import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:permamind_mobile/api/perma_api.dart';
import 'package:permamind_mobile/blocs/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';


class GardensBloc implements BlocBase {

  Stream<List<int>>  outFavorites ;
  // Ici on va appeler l'api


  void dispose() {
  }
}