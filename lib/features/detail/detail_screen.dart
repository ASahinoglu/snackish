import 'package:flutter/material.dart';
import 'package:snackish/features/home/home_screen.dart'; // Importiere den Home-Screen für die Navigation

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Bildschirmabmessungen für responsive Positionierung
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // 1. Hintergrundbild (unterste Ebene)
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg_startscreen.png', // Dein Hintergrundbild
              fit: BoxFit.cover,
            ),
          ),

          // 2. cupcake_chick.png (Jetzt die zweite Ebene von unten)
          Positioned(
            top: screenHeight * 0.12, // Beispiel Abstand von oben, anpassen
            left: screenWidth * -0.01, // Beispiel Abstand von links, anpassen
            //right: screenWidth * 0.1, // Beispiel Abstand von rechts, anpassen
            //height: screenHeight * 0.4, // Beispiel Höhe, anpassen
            child: Image.asset(
              'assets/images/cupcake_chick.png',
              fit: BoxFit
                  .contain, // Stellt sicher, dass das Bild in die Grenzen passt
            ),
          ),

          // 3. snack_snack.png (Jetzt die dritte Ebene von unten, über cupcake_chick.png)
          Positioned.fill(
            child: Image.asset(
              'assets/images/snack_snack.png', // Dieses Asset wird hier eingefügt
              fit: BoxFit.contain,
              // Passt das Bild innerhalb seiner Grenzen an
            ),
          ),

          // 4. Hauptinhalt (SafeArea und Column für Statusleisten-Handling und untere Karte) - bleibt ganz oben
          Positioned.fill(
            child: SafeArea(
              child: Column(
                children: [
                  // Spacer, um den Inhalt (untere Karte) nach unten zu schieben
                  const Spacer(
                    flex: 3,
                  ), // Diesen Wert ggf. anpassen, um die "Card" zu positionieren
                  // Unterer Container (die "Card")
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Container(
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 0.05),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize
                            .min, // Container nimmt minimale Höhe ein
                        children: [
                          Text(
                            'Feeling Snackish Today?',
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Explore Angi's most popular snack selection\nand get instantly happy.",
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  fontSize: 16,
                                  color: const Color.fromRGBO(
                                    255,
                                    255,
                                    255,
                                    0.8,
                                  ),
                                ),
                          ),
                          const SizedBox(height: 30),

                          SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    WidgetStateProperty.resolveWith<Color?>((
                                      Set<WidgetState> states,
                                    ) {
                                      if (states.contains(
                                        WidgetState.pressed,
                                      )) {
                                        return const Color(0xFF8B47E6);
                                      }
                                      return null;
                                    }),
                                shape:
                                    WidgetStateProperty.all<
                                      RoundedRectangleBorder
                                    >(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          30.0,
                                        ),
                                      ),
                                    ),
                                padding:
                                    WidgetStateProperty.all<EdgeInsetsGeometry>(
                                      EdgeInsets.zero,
                                    ),
                                overlayColor:
                                    WidgetStateProperty.resolveWith<Color?>((
                                      Set<WidgetState> states,
                                    ) {
                                      if (states.contains(
                                        WidgetState.pressed,
                                      )) {
                                        return const Color.fromRGBO(
                                          255,
                                          255,
                                          255,
                                          0.2,
                                        );
                                      }
                                      return null;
                                    }),
                              ),
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFE842AC),
                                      Color(0xFF8B47E6),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Order Now',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
