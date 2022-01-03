class Product {
  const Product({
    required this.name,
    required this.description,
    required this.price,
    this.imagePath,
  });

  final String name;
  final String description;
  final String price;
  final String? imagePath;
}
