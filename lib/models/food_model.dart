///
/// Food Model
///
/// Yemek modeli
///

class Food {
  final int id;
  final String title;
  final String image;
  final double price;
  final double rating;
  final double readyInMinutes;
  Food({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.rating,
    required this.readyInMinutes,
  });
//Aynı id 
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Food && id == other.id;
  @override
  int get hashCode => id.hashCode;
}
