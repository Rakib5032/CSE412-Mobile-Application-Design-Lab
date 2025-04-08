import 'package:flutter/material.dart';
import 'package:project/booknow.dart';
import 'package:project/contact.dart';
import 'package:project/event.dart';
import 'package:project/feedback.dart';
import 'package:project/homescreen.dart';
import 'package:project/settings.dart';

class AppRoutes {
  AppRoutes._(); // Private constructor

  static const String home = '/';
  static const String feedback = '/feedback';
  static const String events = '/events';
  static const String contact = '/contact';
  static const String settings = '/settings';
  static const String booknow = '/booknow';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    // Renamed parameter
    switch (routeSettings.name) {
      case AppRoutes.booknow:
        return MaterialPageRoute(builder: (_) => const Booknow());
      case AppRoutes.settings: // Use fully qualified name
        return MaterialPageRoute(builder: (_) => const Settings());
      case AppRoutes.contact:
        return MaterialPageRoute(builder: (_) => const EmergencyContact());
      case AppRoutes.feedback:
        return MaterialPageRoute(builder: (_) => const FeedbackScreen());
      case AppRoutes.events:
        return MaterialPageRoute(builder: (_) => const EventScreen());
      case AppRoutes.home:
      default:
        return MaterialPageRoute(builder: (_) => const Homescreen());
    }
  }
}
