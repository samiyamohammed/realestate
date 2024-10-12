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

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_marketplace/models/properties_list_model.dart';
import 'package:real_estate_marketplace/widgets/vertical_listing.dart';

class RecentlyViewedPropertiesPage extends StatelessWidget {
  const RecentlyViewedPropertiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recently Viewed Properties'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/profile');
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // ignore: avoid_print
              print('Clear button pressed');
            },
            child: Text(
              'CLEAR',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: properties.length,
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        itemBuilder: (context, index) {
          return PropertyCard(
            property: properties[index],
          );
        },
      ),
    );
  }
}
