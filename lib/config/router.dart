// ignore_for_file: unused_import

import 'package:go_router/go_router.dart';
import 'package:real_estate_marketplace/pages/aboutus_page.dart';
import 'package:real_estate_marketplace/pages/draft_properties_page.dart';
import 'package:real_estate_marketplace/pages/faq_page.dart';
import 'package:real_estate_marketplace/pages/home_page.dart';
import 'package:real_estate_marketplace/pages/posted_properties_page.dart';
import 'package:real_estate_marketplace/pages/profile_pages.dart';
import 'package:real_estate_marketplace/pages/search_filter_page.dart';
import 'package:real_estate_marketplace/pages/settings_page.dart';
import 'package:real_estate_marketplace/pages/unsighned_notification_page.dart';
import 'package:real_estate_marketplace/pages/unsignedin_favorites_page.dart';
import 'package:real_estate_marketplace/pages/unsighned_message_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/searchandfilter',
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
      builder: (context, state) => SearchAndFilterPage(),
    ),
    GoRoute(
      path: '/draft-properties',
      builder: (context, state) => const DraftPropertiesPage(),
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

    /// Add other routes here as needed
  ],
);
