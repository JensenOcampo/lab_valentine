class Product {
  late int id;
  late String name;
  late String description;
  bool isFav;

  Product({
    required this.id,
    required this.name,
    required this.description,
    this.isFav = false,
  });
}
