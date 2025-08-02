import 'dart:ui';
import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final bool selected;

  const CategoryChip({
    super.key,
    required this.label,
    this.leadingIcon,
    this.trailingIcon,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // Wichtig für abgerundete Ecken beim Blur-Effekt
      borderRadius: BorderRadius.circular(30),

      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15.0,
          sigmaY: 15.0,
        ), // Anpassen der Blur-Stärke
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: selected
                ? const Color.fromRGBO(255, 255, 255, 0.6)
                : const Color.fromRGBO(255, 255, 255, 0.2),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: const Color.fromRGBO(255, 255, 255, 0.5),
              width: 1.0,
            ),
          ),

          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leadingIcon != null)
                Icon(
                  leadingIcon,
                  color: selected ? Colors.black : Colors.white,
                  size: 20,
                ),
              if (leadingIcon != null) const SizedBox(width: 4),

              Text(
                label,
                style: TextStyle(
                  color: selected ? Colors.black : Colors.white,
                  fontSize: 12,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),

              if (trailingIcon != null) const SizedBox(width: 4),
              if (trailingIcon != null)
                Icon(
                  trailingIcon,
                  color: selected ? Colors.black : Colors.white,
                  size: 20,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
