import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_marketplace/bloc/theme_bloc/theme_event.dart';
import 'package:real_estate_marketplace/bloc/theme_bloc/theme_state.dart';

class ThemeBloc extends Bloc<ToggleThemeEvent, AppThemeState> {
  final ThemeData lightTheme;
  final ThemeData darkTheme;

  ThemeBloc({required this.lightTheme, required this.darkTheme})
      : super(LightThemeState(lightTheme)) {
    on<ToggleLightTheme>((event, emit) {
      emit(LightThemeState(lightTheme));
    });

    on<ToggleDarkTheme>((event, emit) {
      emit(DarkThemeState(darkTheme));
    });
  }
}
