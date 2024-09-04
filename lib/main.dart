import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_marketplace/bloc/BottomNavigationBloc.dart';
import 'package:real_estate_marketplace/bloc/home_bloc.dart';
import 'package:real_estate_marketplace/bloc/profile_bloc/profile_bloc.dart';
import 'package:real_estate_marketplace/bloc/profile_bloc/profile_event.dart';
import 'package:real_estate_marketplace/bloc/search_filter_bloc/search_filter_bloc.dart';
import 'package:real_estate_marketplace/config/router.dart';

void main() {
  runApp(const RealEstateApp());
}

class RealEstateApp extends StatelessWidget {
  const RealEstateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => ProfileBloc()..add(LoadProfile())),
        BlocProvider(create: (context) => BottomNavigationBloc()),
        BlocProvider(create: (context) => SearchFilterBloc()),
      ],
      child: MaterialApp.router(
        title: 'Real Estate Marketplace',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routerConfig: router,
      ),
    );
  }
}
