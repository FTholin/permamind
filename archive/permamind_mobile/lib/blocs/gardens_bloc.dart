import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:permamind_mobile/api/perma_api.dart';
import 'package:permamind_mobile/blocs/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';


class GardensBloc implements BlocBase {



  GardensBloc() {
    print("création GardensBloc");

  }

  void dispose() {
    print("destruction GardensBloc");
  }
}