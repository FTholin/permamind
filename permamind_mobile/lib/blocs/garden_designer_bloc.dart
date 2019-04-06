import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:permamind_mobile/blocs/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';


class GardenDesignerBloc implements BlocBase {


  GardenDesignerBloc() {
    print("création GardenDesignerBloc");
  }

  void dispose() {
    print("destruction GardensBloc");
  }
}