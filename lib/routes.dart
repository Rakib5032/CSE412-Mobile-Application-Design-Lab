import 'package:flutter/material.dart';
import 'package:project/booknow.dart';
import 'package:project/contact.dart';
import 'package:project/event.dart';
import 'package:project/feedback.dart';
import 'package:project/homescreen.dart';
import 'package:project/settings.dart';

import 'Auth/LogIn.dart';
import 'Auth/SignUp.dart';
import 'Auth/login_or_register.dart';

class AppRoutes {
  AppRoutes._(); // Private constructor

  static const String loginOrRegister = '/';
  static const String feedback = '/feedback';
  static const String events = '/events';
  static const String contact = '/contact';
  static const String settings = '/settings';
  static const String booknow = '/booknowpage';
  static const String home = '/homescreen';
  static const String login = '/loginpage';
  static const String signup = '/sign_up';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutes.loginOrRegister:
        return MaterialPageRoute(builder: (_) => const LoginOrRegisterPage());
      case AppRoutes.booknow:
        return MaterialPageRoute(builder: (_) => const Booknow());
      case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => const Settings());
      case AppRoutes.contact:
        return MaterialPageRoute(builder: (_) => const EmergencyContact());
      case AppRoutes.feedback:
        return MaterialPageRoute(builder: (_) => const FeedbackScreen());
      case AppRoutes.events:
        return MaterialPageRoute(builder: (_) => const EventScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const Homescreen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginOrRegisterPage());
    }
  }
}
