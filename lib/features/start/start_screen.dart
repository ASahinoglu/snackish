import 'package:flutter/material.dart';
import 'package:snackish/features/home/home_screen.dart';
import 'dart:ui';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Hintergrundbild
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg_startscreen.png',
              fit: BoxFit.cover,
            ),
          ),

          // cupcake chick
          Positioned(
            top: screenHeight * 0.115,
            left: screenWidth * -0.07,
            child: Image.asset(
              'assets/images/cupcake_chick.png',
              fit: BoxFit.contain,
              height: screenHeight * 0.64,
            ),
          ),

          // snack snack (leicht transparent)
          Positioned(
            top: screenHeight * 0.507,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                'assets/images/snack_snack.png',
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Card unten mit Blur und Transparenz
          Positioned(
            top: screenHeight * 0.65,
            left: 0.0,
            right: 0.0,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    width: screenWidth * 0.9,
                    padding: const EdgeInsets.symmetric(
                      vertical: 24.0,
                      horizontal: 20.0,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.01),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: const Color.fromRGBO(255, 255, 255, 0.1),
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Feeling Snackish Today?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          "Explore Angi’s most popular snack selection\nand get instantly happy.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(height: 25),

                        // Neuer Button (einfacher Stil – Figma-Version kannst du ersetzen!)
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 60,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFFE970C4), Color(0xFFF69EA3)],
                                stops: [0.0, 100.0],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),

                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color.fromRGBO(255, 255, 255, 0.2),
                                width: 1.0,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xFFEA71C5,
                                  ).withAlpha((0.5 * 255).round()),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                  spreadRadius: 3.0,
                                ),
                                BoxShadow(
                                  blurStyle: BlurStyle.inner,
                                  color: const Color(0xFF9375B6),
                                  blurRadius: 24,
                                  offset: const Offset(0, -3),
                                  spreadRadius: -2,
                                ),
                                BoxShadow(
                                  blurStyle: BlurStyle.inner,
                                  color: const Color(0xFFFFACE4),
                                  blurRadius: 15,
                                  offset: const Offset(0, 0),
                                  //spreadRadius: -5,
                                ),
                              ],
                            ),
                            child: const Text(
                              "Order Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
