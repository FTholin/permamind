import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
}

class LightThemeSelected extends ThemeEvent {
  LightThemeSelected() : super();

  @override
  String toString() => 'LightThemeSelected ';
}

class DarkThemeSelected extends ThemeEvent {
  DarkThemeSelected() : super();

  @override
  String toString() => 'DarkThemeSelected ';
}
