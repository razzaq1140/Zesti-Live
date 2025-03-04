
class Product {
  final String title;
  final double discountedPrice;
  final double originalPrice;
  final int discountPercentage;
  final String imagePath;

  Product({
    required this.title,
    required this.discountedPrice,
    required this.originalPrice,
    required this.discountPercentage,
    required this.imagePath,
  });
}


final List<Product> dummyProducts = [
  Product(
    title: 'Camelia Heels',
    discountedPrice: 64,
    originalPrice: 125,
    discountPercentage: 50,
    imagePath: 
        'https://oyster.ignimgs.com/mediawiki/apis.ign.com/mario-kart-for-wii-u/8/87/Mk8item19.png',
    ),
  Product(
    title: 'Converse Shoes',
    discountedPrice: 89,
    originalPrice: 135,
    discountPercentage: 40,
    imagePath: 
        'https://oyster.ignimgs.com/mediawiki/apis.ign.com/mario-kart-for-wii-u/8/87/Mk8item19.png',
  ),
  Product(
    title: 'Levi\'s Jacket',
    discountedPrice: 94,
    originalPrice: 135,
    discountPercentage: 30,
    imagePath:
        'https://oyster.ignimgs.com/mediawiki/apis.ign.com/mario-kart-for-wii-u/8/87/Mk8item19.png',
  ),
  Product(
    title: 'Winter Boots',
    discountedPrice: 45,
    originalPrice: 90,
    discountPercentage: 50,
    imagePath: 
        'https://oyster.ignimgs.com/mediawiki/apis.ign.com/mario-kart-for-wii-u/8/87/Mk8item19.png',
  ),
];
