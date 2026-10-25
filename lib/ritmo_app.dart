import 'package:flutter/material.dart';
import 'pages/onboarding_page.dart'; // Começa sempre na Onboarding

class RitmoApp extends StatelessWidget {
  const RitmoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ritmo Único',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0E17),
        useMaterial3: true,
      ),
      home: const OnboardingPage(), // Primeira tela do fluxo
    );
  }
}