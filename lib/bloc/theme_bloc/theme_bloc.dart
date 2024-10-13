import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_marketplace/bloc/theme_bloc/theme_event.dart';
import 'package:real_estate_marketplace/bloc/theme_bloc/theme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeBloc extends Bloc<ToggleThemeEvent, AppThemeState> {
  final ThemeData lightTheme;
  final ThemeData darkTheme;

  ThemeBloc({required this.lightTheme, required this.darkTheme})
      : super(LightThemeState(lightTheme)) {
    // Listen to the events and handle them accordingly

    on<LoadThemeEvent>(_onLoadTheme);

    on<ToggleLightTheme>((event, emit) async {
      emit(LightThemeState(lightTheme));
      await _saveThemeToPreferences(isDark: false); // Save light theme
    });

    on<ToggleDarkTheme>((event, emit) async {
      emit(DarkThemeState(darkTheme));
      await _saveThemeToPreferences(isDark: true); // Save dark theme
    });

    // Dispatch LoadThemeEvent to load the saved theme initially
    add(LoadThemeEvent());
  }

  // Handler for loading theme event
  Future<void> _onLoadTheme(
      LoadThemeEvent event, Emitter<AppThemeState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkTheme =
        prefs.getBool('isDarkTheme') ?? false; // Default to light theme
    if (isDarkTheme) {
      emit(DarkThemeState(darkTheme));
    } else {
      emit(LightThemeState(lightTheme));
    }
  }

  // Method to save the current theme preference
  Future<void> _saveThemeToPreferences({required bool isDark}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkTheme', isDark);
  }
}
