import 'package:flutter/material.dart';

abstract class AppThemeState {}

class LightThemeState extends AppThemeState {
  final ThemeData themeData;
  LightThemeState(this.themeData);
}

class DarkThemeState extends AppThemeState {
  final ThemeData themeData;
  DarkThemeState(this.themeData);
}


