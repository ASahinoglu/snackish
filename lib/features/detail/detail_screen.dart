import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:snackish/data/snack_data.dart';

class DetailScreen extends StatefulWidget {
  final Snack snack;
  const DetailScreen({super.key, required this.snack});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int quantity = 1;
  String selectedSize = 'Large';

  @override
  Widget build(BuildContext context) {
    final snack = widget.snack;
    final double unitPrice =
        double.tryParse(snack.price.replaceAll('₳', '').trim()) ?? 0.0;
    final double totalPrice = unitPrice * quantity;
    final double rating = double.tryParse(snack.rating ?? '0') ?? 0.0;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Hintergrund-Tap zum Schließen
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(color: const Color.fromRGBO(255, 255, 255, 0.02)),
          ),

          // Farbverlauf-Hintergrund hinter Bild und Card
          Positioned(
            top: 135,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(47, 43, 34, 1.0),
                    Color.fromRGBO(67, 127, 151, 1.0),
                  ],
                  stops: [1.00, 100.00],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          // Bild oben
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(snack.imagePath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),

          // Glass Card mit Inhalt
          Positioned.fill(
            top: 310,
            left: 20,
            right: 20,
            bottom: 220, // Platz für untere UI
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    border: Border.all(color: Colors.white10),
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  ),
                  child: _buildCardContent(snack, rating, totalPrice),
                ),
              ),
            ),
          ),

          // Close Button
          Positioned(
            top: 150,
            right: 10,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(6),
                child: const Icon(Icons.close, color: Colors.white),
              ),
            ),
          ),

          // Like-Button über Bild
          Positioned(
            top: 330,
            right: 50,
            child: Row(
              children: [
                const Icon(
                  Icons.favorite_border,
                  color: Colors.white54,
                  size: 18.0,
                ),
                const SizedBox(width: 4),
                Text(
                  '${snack.likes ?? 0}',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),

          // UI Unten (Größe, Menge, Button)
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: ['Small', 'Medium', 'Large'].map((size) {
                            final isSelected = selectedSize == size;
                            return GestureDetector(
                              onTap: () => setState(() => selectedSize = size),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.grey
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  size,
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 80),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.remove_circle,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            if (quantity > 1) setState(() => quantity--);
                          },
                        ),
                        Text(
                          quantity.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.grey,
                          ),
                          onPressed: () => setState(() => quantity++),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Bestellung auslösen
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 85,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFE970C4), Color(0xFFF69EA3)],
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
                          color: const Color(0xFFEA71C5).withAlpha(128),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                          spreadRadius: 3.0,
                        ),
                        const BoxShadow(
                          blurStyle: BlurStyle.inner,
                          color: Color(0xFF9375B6),
                          blurRadius: 24,
                          offset: Offset(0, -3),
                          spreadRadius: -2,
                        ),
                        const BoxShadow(
                          blurStyle: BlurStyle.inner,
                          color: Color(0xFFFFACE4),
                          blurRadius: 15,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Text(
                      'Add to order for ₳ ${totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardContent(Snack snack, double rating, double totalPrice) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          const SizedBox(height: 15.0),
          Text(
            snack.title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            snack.detail,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70, fontSize: 13.0),
          ),
          const SizedBox(height: 25),
          Text(
            snack.price,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ingredients',
                    style: const TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                  SizedBox(height: 6.0),
                  Row(
                    children: const [
                      Icon(Icons.grain, color: Colors.white60),
                      SizedBox(width: 10),
                      Icon(Icons.no_food, color: Colors.white60),
                      SizedBox(width: 10),
                      Icon(Icons.local_fire_department, color: Colors.white60),
                      SizedBox(width: 10),
                      Icon(Icons.local_fire_department, color: Colors.white60),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reviews',
                    style: const TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                  SizedBox(height: 6.0),

                  Row(
                    children: [
                      // ⭐ Sterne anzeigen
                      Row(
                        children: List.generate(5, (index) {
                          if (index < rating.floor()) {
                            return const Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 16,
                            );
                          } else if (index < rating) {
                            return const Icon(
                              Icons.star_half,
                              color: Colors.white,
                              size: 16,
                            );
                          } else {
                            return const Icon(
                              Icons.star_border,
                              color: Colors.white,
                              size: 16,
                            );
                          }
                        }),
                      ),
                      const SizedBox(width: 12),

                      // 🔢 Bewertungszahl
                      Text(
                        rating.toStringAsFixed(1),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
