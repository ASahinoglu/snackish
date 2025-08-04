import 'package:flutter/material.dart';
import 'package:snackish/common/category_chip.dart';
import 'package:snackish/common/main_snack_card.dart';
import 'package:snackish/common/snack_card.dart';
import 'package:snackish/data/snack_data.dart';
import 'package:snackish/features/detail/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showAllCategories = false;
  String _selectedCategory = 'All categories';

  // Filters the global list based on the selected category.
  List<Snack> get _filteredAndSortedSnacks {
    final List<Snack> filteredSnacks;
    if (_selectedCategory == 'All categories') {
      // Show all snacks except the main one.
      filteredSnacks = allSnacks
          .where((snack) => snack.title != "Angi’s Yummy Burger")
          .toList();
    } else {
      // Filter by the selected category.
      filteredSnacks = allSnacks
          .where((snack) => snack.category == _selectedCategory)
          .toList();
    }
    // Sort by likes in descending order.
    filteredSnacks.sort((a, b) => (b.likes ?? 0).compareTo(a.likes ?? 0));
    return filteredSnacks;
  }

  @override
  Widget build(BuildContext context) {
    final mainSnack = allSnacks.firstWhere(
      (snack) => snack.title == "Angi’s Yummy Burger",
    );
    final recommendedSnacks = _filteredAndSortedSnacks;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg_mainscreen.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(color: Colors.blueGrey);
              },
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
                              selected: _selectedCategory == 'All categories',
                              onPressed: () {
                                setState(() {
                                  // Umschalten des Zustands, um die Chips anzuzeigen/auszublenden
                                  _showAllCategories = !_showAllCategories;
                                  _selectedCategory = 'All categories';
                                });
                              },
                            ),
                            // Zeigt die anderen Chips nur, wenn _showAllCategories true ist
                            if (_showAllCategories) ...[
                              const SizedBox(width: 8),
                              CategoryChip(
                                label: 'Salty',
                                selected: _selectedCategory == 'Salty',
                                onPressed: () {
                                  setState(() {
                                    _selectedCategory = 'Salty';
                                  });
                                },
                              ),
                              const SizedBox(width: 8),
                              CategoryChip(
                                label: 'Sweet',
                                selected: _selectedCategory == 'Sweet',
                                onPressed: () {
                                  setState(() {
                                    _selectedCategory = 'Sweet';
                                  });
                                },
                              ),
                              const SizedBox(width: 8),
                              CategoryChip(
                                label: 'Drinks',
                                selected: _selectedCategory == 'Drinks',
                                onPressed: () {
                                  setState(() {
                                    _selectedCategory = 'Drinks';
                                  });
                                },
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(height: 45),
                      // MainSnackCard
                      MainSnackCard(
                        title: mainSnack.title,
                        subtitle: mainSnack.subtitle,
                        price: mainSnack.price,
                        imagePath: mainSnack.imagePath,
                        rating: mainSnack.rating,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (context) =>
                                DetailScreen(snack: mainSnack),
                          );
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
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...recommendedSnacks.map((snack) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 24.0),
                                child: SnackCard(
                                  title: snack.title,
                                  subtitle: snack.subtitle,
                                  price: snack.price,
                                  imagePath: snack.imagePath,
                                  likes: snack.likes ?? 0,
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) =>
                                          DetailScreen(snack: snack),
                                    );
                                  },
                                ),
                              );
                            }).toList(),
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
