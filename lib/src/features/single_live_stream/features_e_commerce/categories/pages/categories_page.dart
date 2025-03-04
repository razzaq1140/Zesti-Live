import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/const/global_variables.dart';

// Popular Item Model
class PopularItem {
  final String title;
  final double price;
  final double rating;

  PopularItem({required this.title, required this.price, required this.rating});
}

final List<PopularItem> popularItems = [
  PopularItem(title: 'Vinta Backpack', price: 78.0, rating: 4.9),
  PopularItem(title: 'Travel Bag', price: 65.0, rating: 4.8),
  PopularItem(title: 'Gym Backpack', price: 50.0, rating: 4.7),
];

class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: colorScheme(context).primary,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {},
                        ),
                      ),
                      Text(
                        'Furniture',
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
                          icon: Icon(Icons.shopping_cart_outlined,
                              color: Colors.white),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Popular Items",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Displaying PopularItemCard
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
                  child: Column(
                    children: popularItems
                        .map((item) => PopularItemCard(item: item))
                        .toList(),
                  ),
                ),
              ],
            ),

            // Draggable Scrollable Sheet
            DraggableScrollableSheet(
              initialChildSize: 0.3, // Initial height (40% of screen)
              minChildSize: 0.3, // Minimum height (30% of screen)
              maxChildSize: 0.7, // Maximum height (80% of screen)
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            height: 5,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Categories",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 16),

                        // GridView for Categories (directly in GridView)
                        GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 3,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 10,
                          children: [
                            CategoryCard(
                              category: 'Sofa',
                              itemCount: 12,
                              imageUrl:
                                  'https://multiwood.com.pk/cdn/shop/products/81WT6csPblL._AC_SL1500_1024x1024@2x.webp?v=1671522917',
                            ),
                            CategoryCard(
                              category: 'Chair',
                              itemCount: 18,
                              imageUrl:
                                  'https://multiwood.com.pk/cdn/shop/products/81WT6csPblL._AC_SL1500_1024x1024@2x.webp?v=1671522917',
                            ),
                            CategoryCard(
                              category: 'Bed',
                              itemCount: 10,
                              imageUrl:
                                  'https://multiwood.com.pk/cdn/shop/products/81WT6csPblL._AC_SL1500_1024x1024@2x.webp?v=1671522917',
                            ),
                            CategoryCard(
                              category: 'Drawer',
                              itemCount: 8,
                              imageUrl:
                                  'https://multiwood.com.pk/cdn/shop/products/81WT6csPblL._AC_SL1500_1024x1024@2x.webp?v=1671522917',
                            ),
                            CategoryCard(
                              category: 'Lamp',
                              itemCount: 5,
                              imageUrl:
                                  'https://multiwood.com.pk/cdn/shop/products/81WT6csPblL._AC_SL1500_1024x1024@2x.webp?v=1671522917',
                            ),
                            CategoryCard(
                              category: 'Cabinet',
                              itemCount: 7,
                              imageUrl:
                                  'https://multiwood.com.pk/cdn/shop/products/81WT6csPblL._AC_SL1500_1024x1024@2x.webp?v=1671522917',
                            ),
                          ],
                        ),

                        SizedBox(height: 16),

                        // Popular Items Section
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Popular Item Card Widget
class PopularItemCard extends StatefulWidget {
  final PopularItem item;

  const PopularItemCard({Key? key, required this.item}) : super(key: key);

  @override
  State<PopularItemCard> createState() => _PopularItemCardState();
}

class _PopularItemCardState extends State<PopularItemCard> {
  bool isFavorite = false; // Track whether the product is favorited or not

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 102,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, bottom: 2, right: 12, left: 112),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item.title,
                          style: textTheme(context).bodySmall?.copyWith(
                                fontSize: 16,
                                color: colorScheme(context)
                                    .outline
                                    .withOpacity(0.5), // Visible color
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "\$${widget.item.price.toString()}",
                          style: textTheme(context).bodySmall?.copyWith(
                                fontSize: 16,
                                color: colorScheme(context)
                                    .primary, // Visible color
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Icon(Icons.star,
                                size: 14, color: AppColor.appYellow),
                            Icon(Icons.star,
                                size: 14, color: AppColor.appYellow),
                            Icon(Icons.star,
                                size: 14, color: AppColor.appYellow),
                            Icon(Icons.star,
                                size: 14, color: AppColor.appYellow),
                            Icon(Icons.star_half,
                                size: 14, color: AppColor.appYellow),
                            const SizedBox(width: 5),
                            Text(
                              widget.item.rating.toString(),
                              style: textTheme(context).bodySmall?.copyWith(
                                    fontSize: 10,
                                    color: colorScheme(context)
                                        .outline
                                        .withOpacity(0.5),
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red,
                          size: 20,
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: AppColor.appGreen,
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 21.0, vertical: 4),
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              color: colorScheme(context).surface,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
            width: 100,
            height: 105,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: CachedNetworkImage(
              imageUrl:
                  'https://artfasad.com/wp-content/uploads/2023/09/green-sofa-living-room-ideas-3.jpg.webp',
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator()), // Loading indicator
              errorWidget: (context, url, error) =>
                  Icon(Icons.error), // Error widget
              fit: BoxFit
                  .cover, // Makes sure the image fills the container with the right aspect ratio
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String category;
  final int itemCount;
  final String imageUrl;

  CategoryCard(
      {required this.category,
      required this.itemCount,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
  
      },
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Cached Network Image with border radius applied
            CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              height: 80,
              width: 100,
              fit: BoxFit.cover,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              category,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '$itemCount Items',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
