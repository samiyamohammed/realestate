import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
<<<<<<< HEAD
import 'package:real_estate_marketplace/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:real_estate_marketplace/bloc/theme_bloc/theme_bloc.dart';
import 'package:real_estate_marketplace/bloc/search_filter_bloc/search_filter_bloc.dart';
// ignore: unused_import
import 'package:real_estate_marketplace/pages/favorites_page.dart';
import 'package:real_estate_marketplace/pages/home_page.dart';
// ignore: unused_import
import 'package:real_estate_marketplace/pages/notification_page.dart';
=======
import 'package:real_estate_marketplace/bloc/home_bloc.dart';
import 'package:real_estate_marketplace/config/router.dart'; // Import the router file here
>>>>>>> 0b76177a3bff7e42772967a8a12962cd19421c52

void main() {
  runApp(const RealEstateApp());
}

class RealEstateApp extends StatelessWidget {
  const RealEstateApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FavoritesBloc()),
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => SearchFilterBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            theme: themeState.themeData,
            home: const HomePage(),
          );
        },
=======
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: MaterialApp.router(
        title: 'Real Estate Marketplace',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routerConfig: router, // Use the router from the imported router file
>>>>>>> 0b76177a3bff7e42772967a8a12962cd19421c52
      ),
    );
  }
}
