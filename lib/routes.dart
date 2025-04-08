import 'package:flutter/material.dart';
import 'package:project/event.dart';
import 'package:project/feedback.dart';
import 'package:project/homescreen.dart';

class AppRoutes {
  AppRoutes._(); // Private constructor

  static const String home = '/';
  static const String feedback = '/feedback';
  static const String events = '/events';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case feedback:
        return MaterialPageRoute(builder: (_) => const FeedbackScreen());
      case events:
        return MaterialPageRoute(builder: (_) => const EventScreen());
      case home:
      default:
        return MaterialPageRoute(builder: (_) => const Homescreen());
    }
  }
}
