import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_marketplace/bloc/BottomNavigationBloc.dart';
import 'package:real_estate_marketplace/bloc/auth_bloc/auth_bloc.dart';
import 'package:real_estate_marketplace/bloc/bloc_category/category_bloc.dart';
import 'package:real_estate_marketplace/bloc/bloc_category/category_event.dart';
import 'package:real_estate_marketplace/bloc/bloc_property/property_event.dart';
import 'package:real_estate_marketplace/bloc/home_bloc.dart';
// import 'package:real_estate_marketplace/config/router.dart';
import 'package:real_estate_marketplace/bloc/favorite_bloc/favorite_bloc.dart';
// import 'package:real_estate_marketplace/bloc/home_bloc.dart';
import 'package:real_estate_marketplace/bloc/profile_bloc/profile_bloc.dart';
import 'package:real_estate_marketplace/bloc/profile_bloc/profile_event.dart';
import 'package:real_estate_marketplace/bloc/bloc_property/property_bloc.dart';
import 'package:real_estate_marketplace/bloc/search_filter_bloc/search_filter_bloc.dart';
import 'package:real_estate_marketplace/bloc/theme_bloc/theme_bloc.dart';
import 'package:real_estate_marketplace/bloc/theme_bloc/theme_state.dart';
import 'package:real_estate_marketplace/bloc/user_bloc/user_bloc.dart';
import 'package:real_estate_marketplace/config/router.dart';
// import 'package:real_estate_marketplace/pages/account_page/account_page.dart';
// import 'package:real_estate_marketplace/pages/agent_page.dart';
// ignore: unused_import
import 'package:real_estate_marketplace/pages/favorites_page.dart';
import 'package:real_estate_marketplace/services/cache/cache_service.dart';
import 'package:real_estate_marketplace/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:real_estate_marketplace/pages/home_page.dart';
// ignore: unused_import
// import 'package:real_estate_marketplace/pages/notification_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isOnboardingCompleted = prefs.getBool('onboardingCompleted') ?? false;
  await CacheService.setupCache();
  runApp(RealEstateApp(isOnboardingCompleted: isOnboardingCompleted));
}

class RealEstateApp extends StatelessWidget {
  final bool isOnboardingCompleted;

  const RealEstateApp({super.key, required this.isOnboardingCompleted});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PropertyBloc()..add(FetchedPropertyListEvent()),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => CategoryBloc()..add(FetchedCategoryListEvent()),
          lazy: false,
        ),
        BlocProvider(create: (context) => FavoritesBloc()),
        BlocProvider(
            create: (context) =>
                ThemeBloc(lightTheme: lightTheme, darkTheme: darkTheme)),
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => ProfileBloc()..add(LoadProfile())),
        BlocProvider(create: (context) => BottomNavigationBloc()),
        BlocProvider(create: (context) => SearchFilterBloc()),
        BlocProvider(create: (context) => UserBloc()),
      ],
      child: BlocBuilder<ThemeBloc, AppThemeState>(
        builder: (context, themeState) {
          ThemeData appTheme;

          if (themeState is LightThemeState) {
            appTheme = themeState.themeData;
          } else if (themeState is DarkThemeState) {
            appTheme = themeState.themeData;
          } else {
            appTheme = ThemeData(
                brightness: WidgetsBinding.instance.window.platformBrightness);
          }

          return MaterialApp.router(
            // return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.dark,
            theme: appTheme,
            // home: const AgentPage(),
            routerConfig:
                router, // Use the router from the imported router file
            // routerConfig: router(isOnboardingCompleted),
          );
        },
      ),
    );
  }
}
