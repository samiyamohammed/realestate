import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_marketplace/bloc/home_bloc.dart';
import 'package:real_estate_marketplace/config/router.dart';
import 'package:real_estate_marketplace/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:real_estate_marketplace/bloc/theme_bloc/theme_bloc.dart';
import 'package:real_estate_marketplace/pages/account_page/account_page.dart';
import 'package:real_estate_marketplace/pages/agent_page.dart';
// ignore: unused_import
import 'package:real_estate_marketplace/pages/favorites_page.dart';
import 'package:real_estate_marketplace/pages/home_page.dart';
// ignore: unused_import
// import 'package:real_estate_marketplace/pages/notification_page.dart';

void main() {
  runApp(const RealEstateApp());
}

class RealEstateApp extends StatelessWidget {
  const RealEstateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FavoritesBloc()),
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (context) => HomeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          // return MaterialApp.router(
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeState.themeData,
            home: const AgentPage(),
            // routerConfig:
            //     router, // Use the router from the imported router file
          );
        },
      ),
    );
  }
}
