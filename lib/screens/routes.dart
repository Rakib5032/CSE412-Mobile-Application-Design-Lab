import 'package:flutter/material.dart';
import 'package:project/screens/settings.dart';

import 'LogIn.dart';
import 'SignUp.dart';
import 'booknow.dart';
import 'contact.dart';
import 'event.dart';
import 'feedback.dart';
import 'homescreen.dart';
import 'login_or_register.dart';

class AppRoutes {
  AppRoutes._(); // Private constructor

  static const String loginOrRegister = '/loginOrRegister';
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
