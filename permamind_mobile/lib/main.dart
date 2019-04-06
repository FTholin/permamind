import 'dart:async';

import 'package:flutter/material.dart';
import 'package:permamind_mobile/blocs/bloc_provider.dart';
import 'package:permamind_mobile/blocs/gardens_bloc.dart';
import 'package:permamind_mobile/screens/home.dart';
import 'package:permamind_mobile/blocs/vegetable_bloc.dart';



Future<void> main() async {
//  debugPrintRebuildDirtyWidgets = true;
  return runApp(
    BlocProvider<GardensBloc>(
      bloc: GardensBloc(),
      child: BlocProvider<VegetableBloc>(
            bloc: VegetableBloc(),
            child:MyApp()
        )
    ),
  );
}



class MyApp extends StatelessWidget {
  // This widget is the root of my application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.lightGreen
      ),
      home: HomePage()
    );
  }
}


