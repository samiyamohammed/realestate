// ignore_for_file: unused_import

import 'package:go_router/go_router.dart';
import 'package:real_estate_marketplace/pages/home_page.dart';
import 'package:real_estate_marketplace/pages/unsighned_notification_page.dart';
import 'package:real_estate_marketplace/pages/unsighnedin_favirites_page.dart';
import 'package:real_estate_marketplace/pages/unsighned_message_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
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

    /// Add other routes here as needed
  ],
);
