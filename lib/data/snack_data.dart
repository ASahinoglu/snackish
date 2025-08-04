class Snack {
  final String title;
  final String subtitle;
  final String detail;
  final String price;
  final String imagePath;
  final String category;
  final int? likes;
  final String? rating;

  Snack({
    required this.title,
    required this.subtitle,
    required this.detail,
    required this.price,
    required this.imagePath,
    required this.category,
    this.likes,
    this.rating,
  });
}

final List<Snack> allSnacks = [
  // Die Hauptkarte, die Sie auf dem HomeScreen haben
  Snack(
    title: "Angi’s Yummy Burger",
    subtitle: "Delish vegan burger\nthat tastes like heaven",
    detail:
        "Lorem ipsum dolor sit amet consectetur. Non feugiat imperdiet a vel sit at amet. Mi accumsan feugiat magna aliquam feugiat ac et. Pulvinar hendrerit id arcu at sed etiam semper mi hendrerit. Id aliquet quis quam.",
    price: "₳ 13.99",
    imagePath: 'assets/images/burger.png',
    category: 'Salty',
    rating: '4.8',
    likes: 410,
  ),

  // Empfohlene Snacks
  Snack(
    title: "Mogli’s Cup",
    subtitle: "Strawberry ice cream",
    detail:
        "Lorem ipsum dolor sit amet consectetur. Non feugiat imperdiet a vel sit at amet. Mi accumsan feugiat magna aliquam feugiat ac et. Pulvinar hendrerit id arcu at sed etiam semper mi hendrerit. Id aliquet quis quam.",
    price: "₳ 8.99",
    imagePath: 'assets/images/cupkake_cat.png',
    category: 'Sweet',
    rating: '4.0',
    likes: 200,
  ),
  Snack(
    title: "Balu’s Cup",
    subtitle: "Pistachio ice cream",
    detail:
        "Lorem ipsum dolor sit amet consectetur. Non feugiat imperdiet a vel sit at amet. Mi accumsan feugiat magna aliquam feugiat ac et. Pulvinar hendrerit id arcu at sed etiam semper mi hendrerit. Id aliquet quis quam.",
    price: "₳ 8.99",
    imagePath: 'assets/images/icecream.png',
    category: 'Sweet',
    rating: '4.0',
    likes: 165,
  ),
  Snack(
    title: "Smiling David",
    subtitle: "Hasellnuss ice cream",
    detail:
        "Lorem ipsum dolor sit amet consectetur. Non feugiat imperdiet a vel sit at amet. Mi accumsan feugiat magna aliquam feugiat ac et. Pulvinar hendrerit id arcu at sed etiam semper mi hendrerit. Id aliquet quis quam.",
    price: "₳ 3.99",
    imagePath: 'assets/images/icecream_stick.png',
    category: 'Sweet',
    rating: '4.0',
    likes: 310,
  ),
  Snack(
    title: "Kai in a Cone",
    subtitle: "Schoko ice cream",
    detail:
        "Lorem ipsum dolor sit amet consectetur. Non feugiat imperdiet a vel sit at amet. Mi accumsan feugiat magna aliquam feugiat ac et. Pulvinar hendrerit id arcu at sed etiam semper mi hendrerit. Id aliquet quis quam.",
    price: "₳ 3.99",
    imagePath: 'assets/images/icecream_cone.png',
    category: 'Sweet',
    rating: '4.0',
    likes: 290,
  ),
  Snack(
    title: "Pretzel",
    subtitle: "A classic salty pretzel",
    detail:
        "Lorem ipsum dolor sit amet consectetur. Non feugiat imperdiet a vel sit at amet. Mi accumsan feugiat magna aliquam feugiat ac et. Pulvinar hendrerit id arcu at sed etiam semper mi hendrerit. Id aliquet quis quam.",
    price: "₳ 4.50",
    imagePath: 'assets/images/pretzel.png', // Platzhalter
    category: 'Salty',
    rating: '4.0',
    likes: 50,
  ),
  Snack(
    title: "Iced Coffee",
    subtitle: "Cool and refreshing",
    detail:
        "Lorem ipsum dolor sit amet consectetur. Non feugiat imperdiet a vel sit at amet. Mi accumsan feugiat magna aliquam feugiat ac et. Pulvinar hendrerit id arcu at sed etiam semper mi hendrerit. Id aliquet quis quam.",
    price: "₳ 5.25",
    imagePath: 'assets/images/coffee.png', // Platzhalter
    category: 'Drinks',
    rating: '4.0',
    likes: 150,
  ),
  Snack(
    title: "Spicy Chips",
    subtitle: "Extra hot potato chips",
    detail:
        "Lorem ipsum dolor sit amet consectetur. Non feugiat imperdiet a vel sit at amet. Mi accumsan feugiat magna aliquam feugiat ac et. Pulvinar hendrerit id arcu at sed etiam semper mi hendrerit. Id aliquet quis quam.",
    price: "₳ 3.99",
    imagePath: 'assets/images/chips.png', // Platzhalter
    category: 'Salty',
    rating: '4.0',
    likes: 90,
  ),
  Snack(
    title: "Smoothie",
    subtitle: "Berry blast smoothie",
    detail:
        "Lorem ipsum dolor sit amet consectetur. Non feugiat imperdiet a vel sit at amet. Mi accumsan feugiat magna aliquam feugiat ac et. Pulvinar hendrerit id arcu at sed etiam semper mi hendrerit. Id aliquet quis quam.",
    price: "₳ 6.75",
    imagePath: 'assets/images/smoothie.png', // Platzhalter
    category: 'Drinks',
    rating: '4.0',
    likes: 120,
  ),
];
