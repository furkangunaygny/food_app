class Foods {
  final String assetImage;
  final String title;
  final double price;
  final double rating;
  Foods({
    required this.assetImage,
    required this.title,
    required this.price,
    required this.rating,
  });

}

final List<Foods> foodList = [
  Foods(
    assetImage: 'assets/cigkofte.jpg',
    title: 'Çiğ Köfte',
    price: 6234234234287.92,
    rating: 4.2,
  ),
  Foods(
    assetImage: 'assets/lahmacun.jpg',
    title: 'Lahmacun sdfdsf xzdfds sdfsdfdsf sdfsd',
    price: 90,
    rating: 4.5,
  ),
  Foods(
    assetImage: 'assets/kebap.jpg',
    title: 'Kebap',
    price: 250,
    rating: 4.8,
  ),
  Foods(
    assetImage: 'assets/corba.jpg',
    title: 'Mercimek Çorba',
    price: 110,
    rating: 4.2,
  ),
];
