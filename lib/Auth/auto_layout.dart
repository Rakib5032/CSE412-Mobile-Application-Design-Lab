import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/Auth/auth_services.dart';
import 'package:project/screens/homescreen.dart';

import '../screens/login_or_register.dart';

class AutoLayout extends StatelessWidget {
  const AutoLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AuthService>(
      valueListenable: authServices,
      builder: (context, authService, child) {
        return StreamBuilder<User?>(
          stream: authService.authStateChanges,
          builder: (context, snapshot) {
            // Show loading indicator while connecting
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const AppLoadingPage();
            }

            // If user is authenticated or connection is established
            if (snapshot.hasData || authService.currentUser != null) {
              return const Homescreen();
            }

            // Default case - show login/register page
            return const LoginOrRegisterPage();
          },
        );
      },
    );
  }
}

class AppLoadingPage extends StatelessWidget {
  const AppLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
