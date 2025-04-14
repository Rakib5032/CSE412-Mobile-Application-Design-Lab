import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const AuthScreen(),
    );
  }
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF24294b),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                // App Logo from Assets
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFD4AF37),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/app_logo.png',  //Replace with asset logo here
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.account_circle,
                        size: 60,
                        color: Color(0xFFD4AF37),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Main Heading
                Text(
                  "Let's Get Started",
                  style: TextStyle(
                    color: const Color(0xFFD4AF37),
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 12),
                // Subtitle
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Sign up or login to see what's happening near you",
                    style: TextStyle(
                      color: const Color(0xFFD4AF37).withOpacity(0.8),
                      fontSize: 15,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),
                // Auth Buttons with light backgrounds
                _buildSocialButton(
                  "Continue With Phone",
                  Icons.phone,
                  bgColor: const Color(0xFF3A3F68).withOpacity(0.5),
                ),
                const SizedBox(height: 16),
                _buildSocialButton(
                  "Continue With Facebook",
                  Icons.facebook,
                  bgColor: const Color(0xFF4267B2).withOpacity(0.2),
                ),
                const SizedBox(height: 16),
                _buildSocialButton(
                  "Continue With Google",
                  Icons.g_mobiledata,
                  bgColor: Colors.white.withOpacity(0.1),
                ),
                const SizedBox(height: 40),
                // Divider with "OR" text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: const Color(0xFFD4AF37).withOpacity(0.2),
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          "OR",
                          style: TextStyle(
                            color: const Color(0xFFD4AF37).withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: const Color(0xFFD4AF37).withOpacity(0.2),
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // Highlighted Login/Signup Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildAuthButton("Log In", isPrimary: true),
                    const SizedBox(width: 20),
                    _buildAuthButton("Sign Up", isPrimary: false),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String text, IconData icon, {Color? bgColor}) {
    return Container(
      width: double.infinity,
      height: 54,
      decoration: BoxDecoration(
        color: bgColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFD4AF37).withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24,
              color: const Color(0xFFD4AF37),
            ),
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(
                color: Color(0xFFD4AF37),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAuthButton(String text, {required bool isPrimary}) {
    return Container(
      width: 120,
      height: 50,
      decoration: BoxDecoration(
        color: isPrimary ? const Color(0xFFD4AF37) : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: const Color(0xFFD4AF37),
          width: isPrimary ? 0 : 1.5,
        ),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            color: isPrimary ? const Color(0xFF24294b) : const Color(0xFFD4AF37),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}