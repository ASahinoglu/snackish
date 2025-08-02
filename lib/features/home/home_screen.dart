import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:snackish/common/category_chip.dart';
import 'package:snackish/common/main_snack_card.dart';
import 'package:snackish/common/snack_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              'assets/images/bg_mainscreen.png',
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),

                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        'Choose Your Favorite\nSnack',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.1,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CategoryChip(
                              label: 'All categories',
                              leadingIcon: Icons.local_cafe_outlined,
                              trailingIcon: Icons.keyboard_arrow_down,
                              selected: false,
                            ),
                            const SizedBox(width: 8),
                            CategoryChip(label: 'Salty', selected: true),
                            const SizedBox(width: 8),
                            CategoryChip(label: 'Sweet', selected: false),
                            const SizedBox(width: 8),
                            CategoryChip(label: 'Drinks', selected: false),
                          ],
                        ),
                      ),
                      const SizedBox(height: 45),

                      // Hauptgerichtkarte
                      MainSnackCard(
                        title: "Angi’s Yummy Burger",
                        subtitle:
                            "Delish vegan burger\nthat tastes like heaven",
                        price: "₳ 13.99",
                        imagePath: 'assets/images/burger.png',
                        rating: '4.8',
                        onPressed: () {
                          print("Add to order gedrückt!");
                        },
                      ),

                      const SizedBox(height: 55),
                      const Text(
                        'We Recommend',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Empfehlungen
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SnackCard(
                              title: "Mogli’s Cup",
                              subtitle: "Strawberry ice cream",
                              price: "₳ 8.99",
                              imagePath: 'assets/images/cupkake_cat.png',
                              likes: 200,
                            ),
                            SizedBox(width: 24.0),
                            SnackCard(
                              title: "Balu’s Cup",
                              subtitle: "Pistachio ice cream",
                              price: "₳ 8.99",
                              imagePath: 'assets/images/icecream.png',
                              likes: 180,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
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
