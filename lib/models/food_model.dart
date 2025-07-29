///
/// Food Model
///
/// Yemek modeli
///

class Food {
  final String title;
  final String image;
  final double price;
  final double rating;
  final double maxReadyTime;
  Food(
      {required this.title,
      required this.image,
      required this.price,
      required this.rating,
      required this.maxReadyTime});
}
