import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_marketplace/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:real_estate_marketplace/bloc/theme_bloc/theme_bloc.dart';
import 'package:real_estate_marketplace/pages/favorites_page.dart';
import 'package:real_estate_marketplace/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FavoritesBloc()),
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            theme: themeState.themeData,
            home: FavoritesPage(),
          );
        },
      ),
    );
  }
}
