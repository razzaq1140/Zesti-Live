import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../common/const/global_variables.dart';
import '../../../router/go_route.dart';
import 'model/all_item_model.dart';

class AllItemPage extends StatefulWidget {
  @override
  State<AllItemPage> createState() => _AllItemPageState();
}

class _AllItemPageState extends State<AllItemPage> {
  final List<AllItemEcommerceModel> items = [
    AllItemEcommerceModel(
      title: "Orange Summer",
      price: "97",
      rating: 4.9,
      image:
          'https://static.vecteezy.com/system/resources/previews/005/346/410/non_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
    ),
    AllItemEcommerceModel(
      title: "Peach Kiss",
      price: "59",
      rating: 4.8,
      image:
          'https://static.vecteezy.com/system/resources/previews/005/346/410/non_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
      // Example image
    ),
    AllItemEcommerceModel(
      title: "Puf Saleve",
      price: "43",
      rating: 4.7,
      image:
          'https://static.vecteezy.com/system/resources/previews/005/346/410/non_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
      // Example image
    ),
    AllItemEcommerceModel(
      title: "Saphire Suit",
      price: "125",
      rating: 4.9,
      image:
          'https://static.vecteezy.com/system/resources/previews/005/346/410/non_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
      // Example image
    ),
    AllItemEcommerceModel(
      title: "Puf Saleve",
      price: "43",
      rating: 4.7,
      image:
          'https://static.vecteezy.com/system/resources/previews/005/346/410/non_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
      // Example image
    ),
    AllItemEcommerceModel(
      title: "Saphire Suit",
      price: "125",
      rating: 4.9,
      image:
          'https://static.vecteezy.com/system/resources/previews/005/346/410/non_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
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
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: colorScheme(context).surface,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [],
          ),
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    textAlignVertical:
                        TextAlignVertical.center, // Ensures vertical alignment
                    decoration: InputDecoration(
                      isDense: true, // Removes extra vertical padding
                      hintText: "Find a bank or account",
                      hintStyle: TextStyle(
                        fontSize: 12,
                        color: colorScheme(context).outline.withOpacity(0.3),
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical:
                            0, // Adjust vertical padding to center the text
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 51,
                  decoration: BoxDecoration(
                    color: colorScheme(context).primary,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.search, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              context.pushNamed(AppRoute.myCart);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: colorScheme(context).primary,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(AppIcons.cart),
                  )),
            ),
          ),
          SizedBox(width: 5),
        ],
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
                    color: colorScheme(context).outline.withOpacity(0.6),
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.menu_outlined,
                  color: colorScheme(context).outline.withOpacity(0.6),
                ),
                SizedBox(width: 8),
                Text(
                  "Filters",
                  style: TextStyle(
                    fontSize: 12,
                    color: colorScheme(context).outline.withOpacity(0.6),
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
