import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.purple, // Beispiel
    scaffoldBackgroundColor: Colors.pinkAccent, // Hintergrundfarbe des Designs
    textTheme: const TextTheme(
      // Die Schriftfamilie wird hier NICHT explizit gesetzt.
      // Flutter wählt automatisch die systemeigene Schriftart (Roboto auf Android, SF Pro auf iOS).
      displayLarge: TextStyle(
        fontSize: 96,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displaySmall: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      // Füge weitere Textstile hinzu, die du im Figma-Design siehst.
      // Die genauen fontSize-Werte und FontWeight (bold, normal etc.) musst du vom Figma-Design ableiten.
    ),
    // Weitere Theme-Eigenschaften wie ButtonTheme, AppBarTheme etc.
    // Definiere hier Farben, die du im Figma-Design siehst (z.B. für Buttons, Text, Hintergrund).
  );

  // Hier könntest du auch ein darkTheme definieren, falls nötig
}
