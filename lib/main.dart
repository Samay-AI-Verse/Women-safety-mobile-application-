import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const WomenSafetyApp());
}

class WomenSafetyApp extends StatelessWidget {
  const WomenSafetyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Women Safety App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
        primarySwatch: Colors.purple,
        primaryColor: const Color(0xFF8B5CF6),
        useMaterial3: true,
        fontFamily: 'SF Pro Display',
      ),
      home: const WelcomeScreen(),
    );
  }
}
