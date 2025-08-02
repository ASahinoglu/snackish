import 'dart:ui';
import 'package:flutter/material.dart';

class MainSnackCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String imagePath;
  final String? rating;
  final VoidCallback onPressed;

  const MainSnackCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imagePath,
    this.rating,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(),
              ),
            ),
          ),

          Positioned.fill(child: CustomPaint(painter: DiagonalBorderPainter())),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
                const SizedBox(height: 12),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 60),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(187, 141, 225, 1.0),
                          Color.fromRGBO(144, 140, 245, 1.0),
                        ],
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
                          blurStyle: BlurStyle.normal,
                          color: const Color.fromRGBO(234, 113, 197, 0.5),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                        BoxShadow(
                          blurStyle: BlurStyle.inner,
                          color: const Color.fromRGBO(255, 172, 228, 1.0),
                          blurRadius: 24,
                          offset: const Offset(0, 0),
                        ),
                        BoxShadow(
                          blurStyle: BlurStyle.inner,
                          color: const Color.fromRGBO(147, 117, 182, 1.0),
                          blurRadius: 15,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: const Text(
                      "Add to order",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          if (rating != null)
            Positioned(
              top: 15,
              right: 15,
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Color.fromRGBO(246, 158, 163, 1),
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    rating!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

          Positioned(
            right: -10,
            bottom: -20,
            child: Image.asset(imagePath, height: 225, fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }
}

class DiagonalBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double curve = 20.0;
    final paint = Paint()
      ..color = Color.fromRGBO(255, 255, 255, 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final path = Path();

    // Oben links (rund)
    path.moveTo(0, curve);
    path.quadraticBezierTo(0, 0, curve, 0);

    // Oben rechts (rund)
    path.lineTo(size.width - curve, 0);
    path.quadraticBezierTo(size.width, 0, size.width, curve);

    // Unten rechts (rund)
    path.lineTo(size.width, size.height - 40 - curve);
    path.quadraticBezierTo(
      size.width,
      size.height - 40,
      size.width - curve,
      size.height - 40,
    );

    // Schräge nach unten links
    path.lineTo(curve, size.height);

    // Unten links (rund)
    path.quadraticBezierTo(0, size.height, 0, size.height - curve);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
