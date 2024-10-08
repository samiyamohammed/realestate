import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_marketplace/bloc/theme_bloc/theme_bloc.dart';
import 'package:real_estate_marketplace/bloc/theme_bloc/theme_event.dart';
import 'package:real_estate_marketplace/bloc/theme_bloc/theme_state.dart';



class ToggleThemeIcon extends StatelessWidget {
  const ToggleThemeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ThemeBloc, AppThemeState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.topRight,
          child: state is LightThemeState
              ? Padding(
                  padding: EdgeInsets.all(16.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.dark_mode,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      context.read<ThemeBloc>().add(ToggleDarkTheme());
                    },
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(16.0),
                  child: IconButton(
                    icon: Icon(Icons.sunny),
                    color: Colors.white,
                    onPressed: () {
                      context.read<ThemeBloc>().add(ToggleLightTheme());
                    },
                  ),
                ),
        );
      },
    );
  }
}