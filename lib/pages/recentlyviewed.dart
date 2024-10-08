// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:real_estate_marketplace/bloc/BottomNavigationBloc.dart';
// import 'package:real_estate_marketplace/bloc/favorite_bloc/favorite_bloc.dart';
// import 'package:real_estate_marketplace/bloc/home_bloc.dart';
// import 'package:real_estate_marketplace/bloc/profile_bloc/profile_bloc.dart';
// import 'package:real_estate_marketplace/bloc/profile_bloc/profile_event.dart';
// import 'package:real_estate_marketplace/bloc/search_filter_bloc/search_filter_bloc.dart';
// import 'package:real_estate_marketplace/bloc/theme_bloc/theme_bloc.dart';
// import 'package:real_estate_marketplace/config/router.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   bool isOnboardingCompleted = prefs.getBool('onboardingCompleted') ?? false;
//   runApp(RealEstateApp(isOnboardingCompleted: isOnboardingCompleted));
// }

// class RealEstateApp extends StatelessWidget {
//   final bool isOnboardingCompleted;

//   const RealEstateApp({super.key, required this.isOnboardingCompleted});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(create: (context) => FavoritesBloc()),
//         BlocProvider(create: (context) => ThemeBloc()),
//         BlocProvider(create: (context) => HomeBloc()),
//         BlocProvider(create: (context) => ProfileBloc()..add(LoadProfile())),
//         BlocProvider(create: (context) => BottomNavigationBloc()),
//         BlocProvider(create: (context) => SearchFilterBloc()),
//       ],
//       child: BlocBuilder<ThemeBloc, ThemeData>(
//         builder: (context, themeState) {
//           return MaterialApp.router(
//             debugShowCheckedModeBanner: false,
//             theme: themeState,
//             // routerConfig: router(isOnboardingCompleted),
//           );
//         },
//       ),
//     );
//   }
// }
