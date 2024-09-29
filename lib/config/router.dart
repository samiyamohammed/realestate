// ignore_for_file: unused_import

import 'package:go_router/go_router.dart';
import 'package:real_estate_marketplace/pages/Home%20page/home_page.dart';
import 'package:real_estate_marketplace/pages/aboutus_page.dart';
import 'package:real_estate_marketplace/pages/account_page/Signin_page.dart';
import 'package:real_estate_marketplace/pages/account_page/account_page.dart';
import 'package:real_estate_marketplace/pages/draft_properties_page.dart';
import 'package:real_estate_marketplace/pages/faq_page.dart';
import 'package:real_estate_marketplace/pages/favorites_page.dart';
import 'package:real_estate_marketplace/pages/onboarding.dart';
import 'package:real_estate_marketplace/pages/posted_properties_page.dart';
import 'package:real_estate_marketplace/pages/profile_pages.dart';
import 'package:real_estate_marketplace/pages/propertydetail_page.dart';
import 'package:real_estate_marketplace/pages/search_filter_page.dart';
import 'package:real_estate_marketplace/pages/settings_page.dart';
import 'package:real_estate_marketplace/pages/unsighned_notification_page.dart';
import 'package:real_estate_marketplace/pages/unsignedin_favorites_page.dart';
import 'package:real_estate_marketplace/pages/unsighned_message_page.dart';
import 'package:real_estate_marketplace/pages/agent_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/propertydetail.dart';

GoRouter router = GoRouter(
  // initialLocation: '/home',
  initialLocation: '/auth',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/faq',
      builder: (context, state) => const FaqPage(),
    ),
    GoRoute(
      path: '/aboutus',
      builder: (context, state) => const AboutUsPage(),
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationPage(),
    ),
    GoRoute(
      path: '/chat',
      builder: (context, state) => const MessagePage(),
    ),
    GoRoute(
      path: '/favorite',
      builder: (context, state) => const FavoritePage(),
    ),
    GoRoute(
      path: '/posted-properties',
      builder: (context, state) => const PostedPropertiesPage(),
    ),
    GoRoute(
      path: '/searchandfilter',
      builder: (context, state) => const SearchAndFilterPage(),
    ),
    GoRoute(
      path: '/draft-properties',
      builder: (context, state) => const DraftPropertiesPage(),
    ),
    GoRoute(
      path: '/agent',
      builder: (context, state) => const AgentPage(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => ProfilePage(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => SettingsScreen(),
    ),
    GoRoute(
      path: '/language-preferences',
      builder: (context, state) => LanguagePreferencesPage(),
    ),
    GoRoute(
      path: '/searchandfilter',
      builder: (context, state) => const SearchAndFilterPage(),
    ),
    // GoRoute(
    //   path: '/propertydetail',
    //   builder: (context, state) => const PropertyDetailPage(),
    // ),
    GoRoute(
      path: '/onboardingpages',
      builder: (context, state) => const OnboardingPage(),
    ),

    GoRoute(
      path: '/auth',
      name: '/auth',
      builder: (context, state) => AccountPage(),
    )
    // Add other routes here as needed
  ],
);

// GoRouter router(bool isOnboardingCompleted) {
//   return GoRouter(
//     initialLocation: isOnboardingCompleted ? '/home' : '/onboardingpages',
//     routes: [
//       GoRoute(
//         path: '/home',
//         builder: (context, state) => const HomePage(),
//       ),
//       GoRoute(
//         path: '/onboardingpages',
//         builder: (context, state) => const OnboardingPage(),
//       ),
//       GoRoute(
//         path: '/faq',
//         builder: (context, state) => const FaqPage(),
//       ),
//       GoRoute(
//         path: '/aboutus',
//         builder: (context, state) => const AboutUsPage(),
//       ),
//       GoRoute(
//         path: '/notifications',
//         builder: (context, state) => const NotificationPage(),
//       ),
//       GoRoute(
//         path: '/chat',
//         builder: (context, state) => const MessagePage(),
//       ),
//       GoRoute(
//         path: '/favorite',
//         builder: (context, state) => const FavoritePage(),
//       ),
//       GoRoute(
//         path: '/posted-properties',
//         builder: (context, state) => const PostedPropertiesPage(),
//       ),
//       GoRoute(
//         path: '/searchandfilter',
//         builder: (context, state) => const SearchAndFilterPage(),
//       ),
//       GoRoute(
//         path: '/draft-properties',
//         builder: (context, state) => const DraftPropertiesPage(),
//       ),
//       GoRoute(
//         path: '/agent',
//         builder: (context, state) => const AgentPage(),
//       ),
//       GoRoute(
//         path: '/profile',
//         builder: (context, state) => ProfilePage(),
//       ),
//       GoRoute(
//         path: '/settings',
//         builder: (context, state) => SettingsScreen(),
//       ),
//       GoRoute(
//         path: '/language-preferences',
//         builder: (context, state) => LanguagePreferencesPage(),
//       ),
//       GoRoute(
//         path: '/searchandfilter',
//         builder: (context, state) => const SearchAndFilterPage(),
//       ),
//       GoRoute(
//         path: '/propertydetail/:name',
//         builder: (context, state) {
//           final String propertyName = state.pathParameters['name']!;
//           final PropertySample property = getPropertyByName(propertyName);

//           return PropertyDetailPage(property: property);
//         },
//       ),
//       GoRoute(
//         path: '/onboardingpages',
//         builder: (context, state) => const OnboardingPage(),
//       ),
//       // Other routes remain the same
//     ],
//   );
// }
