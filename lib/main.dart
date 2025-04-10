import 'package:flutter/material.dart';
import 'package:project/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRoutes.generateRoute,
      // home: HomeScreen(),
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD4AF37),
            foregroundColor: const Color(0xFF24294b),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 5,
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF24294b),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          titleTextStyle: TextStyle(
            fontSize: 24,
            color: Colors.white70,
          ),
          elevation: 5,
          centerTitle: true,
        ),
        textTheme: TextTheme(
          bodySmall: TextStyle(
            fontSize: 10,
          ),
          bodyMedium: TextStyle(
            fontSize: 18,
          ),
          bodyLarge: TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
