class CardClass {
  final String assetImage;
  final String title;
  final double price;
  final double rating;

  CardClass({
    required this.assetImage,
    required this.title,
    required this.price,
    required this.rating,
  });
}

final List<CardClass> cardList = [
  CardClass(
    assetImage: 'assets/cigkofte.jpg',
    title: 'Çiğ Köfte',
    price: 75,
    rating: 4.2,
  ),
  CardClass(
    assetImage: 'assets/lahmacun.jpg',
    title: 'Lahmacun',
    price: 90,
    rating: 4.5,
  ),
  CardClass(
    assetImage: 'assets/kebap.jpg',
    title: 'Kebap',
    price: 250,
    rating: 4.8,
  ),
  CardClass(
    assetImage: 'assets/corba.jpg',
    title: 'Mercimek Çorba',
    price: 110,
    rating: 4.2,
  ),
];
