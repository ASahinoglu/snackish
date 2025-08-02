import 'package:flutter/material.dart';

class SnackCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String imagePath;
  final int likes;

  const SnackCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imagePath,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 270,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,

          colors: [
            // Stop 1 (oben): Transparent
            Color.fromRGBO(255, 255, 255, 0.20),
            // Stop 2 (Mitte): Lila mit 74% Opazität
            Color.fromRGBO(144, 140, 245, 0.74),
            // Stop 3 (unten): Dunkleres Lila mit 74% Opazität
            Color.fromRGBO(140, 91, 234, 0.74),
          ],
          stops: [0.00, 0.31, 1.00], // Stopp-Positionen
        ),
        borderRadius: BorderRadius.circular(36),

        border: Border.all(
          color: const Color.fromRGBO(255, 255, 255, 0.6),
          width: 1.0,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bild zentriert oben
          Expanded(
            child: Center(
              child: Image.asset(imagePath, height: 175, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(height: 12),

          // Titel
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.white,
            ),
          ),

          // Untertitel
          //const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.white70),
          ),

          const SizedBox(height: 14),

          // Preis und Likes in einer Reihe
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.favorite_border,
                    size: 16,
                    color: Colors.white54,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    likes.toString(),
                    style: const TextStyle(color: Colors.white54, fontSize: 14),
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
