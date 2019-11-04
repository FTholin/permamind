import 'package:flutter/material.dart';
import 'package:permamind_mobile/blocs/blocs.dart';
import 'package:bloc/bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState => _mapLightToThemeData();

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is LightThemeSelected) {
      yield _mapLightToThemeData();
    } else {
      yield _mapDarkToThemeData();
    }
  }

  ThemeState _mapLightToThemeData() {
    return ThemeState(
      theme: ThemeData(
        primaryColor: const Color(0xFF01534F),
        buttonColor: const Color(0xFF34CC67),
        accentColor: const Color(0xFF34CC67),
        canvasColor: const Color(0xFFF9F9F9)
      ),
      color: Colors.yellow,
    );
  }

  ThemeState _mapDarkToThemeData() {
    return ThemeState(
      theme: ThemeData(
        primaryColor: Colors.brown,
      ),
      color: Colors.pink,
    );
  }


}
