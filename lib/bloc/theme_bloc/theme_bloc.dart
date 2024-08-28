// ignore_for_file: unnecessary_import, unused_import, duplicate_ignore

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
import 'package:bloc/bloc.dart';
// ignore: unnecessary_import
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightThemeState()) {
    on<ToggleThemeEvent>((event, emit) {
      if (state is LightThemeState) {
        emit(DarkThemeState());
      } else {
        emit(LightThemeState());
      }
    });
  }
}
