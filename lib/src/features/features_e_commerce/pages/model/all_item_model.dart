class AllItemEcommerceModel {
  final String title;
  final String price;
  final double rating;
  final String image;
  bool isFavorite;

  AllItemEcommerceModel({
    required this.title,
    required this.price,
    required this.rating,
    required this.image,
    this.isFavorite = false, 
  });
}