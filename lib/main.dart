import 'package:flutter/material.dart';

import 'homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white70,
              backgroundColor: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
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
            backgroundColor: Color(0xFF00796B),
            elevation: 5,
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
              ))),
    );
  }
}
