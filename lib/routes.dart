import 'package:flutter/material.dart';
import 'package:project/feedback.dart';
import 'package:project/homescreen.dart';

class AppRoutes {
  // Only include routes for screens that exist
  static const String home = '/';
  static const String feedback = '/feedback';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case feedback:
        return MaterialPageRoute(builder: (_) => const FeedbackScreen());
      case home:
      default:
        return MaterialPageRoute(builder: (_) => const Homescreen());
    }
  }
}
