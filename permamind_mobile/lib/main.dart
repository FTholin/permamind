import 'dart:async';

import 'package:flutter/material.dart';
import 'package:permamind_mobile/blocs/bloc_provider.dart';
import 'package:permamind_mobile/blocs/application_bloc.dart';
import 'package:permamind_mobile/screens/home.dart';



Future<void> main() async {
//  debugPrintRebuildDirtyWidgets = true;
  return runApp(
    BlocProvider<ApplicationBloc>(
      child: MyApp(),
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
      home: HomePage(),
    );
  }
}


