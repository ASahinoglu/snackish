import 'package:flutter/material.dart';
import 'package:snackish/app_theme.dart'; // Stelle sicher, dass dies der korrekte Pfad ist
import 'package:snackish/features/start/start_screen.dart'; // Importiere deinen StartScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snackish App',
      theme: AppTheme.lightTheme, // Dein definiertes Theme
      home: const StartScreen(), // Dein Startscreen
      debugShowCheckedModeBanner: false, // Entfernt das "DEBUG" Banner
    );
  }
}
