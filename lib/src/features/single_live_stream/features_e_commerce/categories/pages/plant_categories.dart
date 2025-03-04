import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/const/global_variables.dart';
import '../../../../features_e_commerce/pages/model/all_item_model.dart';
import '../../../../../router/go_route.dart';

class PlantCategoriesScreen extends StatefulWidget {
  @override
  State<PlantCategoriesScreen> createState() => _PlantCategoriesScreenState();
}

class _PlantCategoriesScreenState extends State<PlantCategoriesScreen> {
  final List<AllItemEcommerceModel> items = [
    AllItemEcommerceModel(
      title: "Orange Summer",
      price: "97",
      rating: 4.9,
      image:
          'https://multiwood.com.pk/cdn/shop/products/81WT6csPblL._AC_SL1500_1024x1024@2x.webp?v=1671522917',
    ),
    AllItemEcommerceModel(
      title: "Peach Kiss",
      price: "59",
      rating: 4.8,
      image:
          'https://artfasad.com/wp-content/uploads/2023/09/green-sofa-living-room-ideas-3.jpg.webp',
      // Example image
    ),
    AllItemEcommerceModel(
      title: "Puf Saleve",
      price: "43",
      rating: 4.7,
      image:
          'https://interwood.pk/cdn/shop/products/chelsea_bed_580x_crop_center.jpg?v=1724651362',
      // Example image
    ),
    AllItemEcommerceModel(
      title: "Saphire Suit",
      price: "125",
      rating: 4.9,
      image:
          'https://www.daals.com/cdn/shop/products/FT-COD-002-NAT_main.jpg?v=1692288240',
      // Example image
    ),
    AllItemEcommerceModel(
      title: "Puf Saleve",
      price: "43",
      rating: 4.7,
      image:
          "https://tarkhan.pk/wp-content/uploads/2018/04/zu46828218_alt_2_tm1544196290-jpg-1000%C3%971201-.jpg",
    ),
    AllItemEcommerceModel(
      title: "Saphire Suit",
      price: "125",
      rating: 4.9,
      image:
          'https://www.daals.com/cdn/shop/products/ACH-2163-MUSTARD-CHENILLE_main.jpg?v=1692292051',
      // Example image
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        elevation: 0,
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: colorScheme(context).primary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  context.pop();
                },
              ),
            ),
            Text(
              'Plant',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: colorScheme(context).primary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  "20 Items Found",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.menu_outlined,
                  color: Colors.grey,
                ),
                SizedBox(width: 8),
                Text(
                  "Filters",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MasonryGridView.builder(
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(AppRoute.allItemDetailPage);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: index.isEven ? 200 : 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: CachedNetworkImage(
                                imageUrl: item.image,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                            // Heart Icon
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    item.isFavorite = !item.isFavorite;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    item.isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: item.isFavorite
                                        ? Colors.red
                                        : Colors.grey,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                                Row(
                                  children: [
                                    RatingBarIndicator(
                                      rating: item.rating,
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      itemCount: 5,
                                      itemSize: 16,
                                      direction: Axis.horizontal,
                                    ),
                                    //  Icon(Icons.star, color: Colors.yellow, size: 16),
                                    Text(
                                      item.rating.toString(),
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              "\$${item.price}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
